resource "google_compute_address" "vpn_static_ip" {
  name         = "${var.vpn_name}-ip"
  network_tier = "PREMIUM"
  region       = var.region
}

resource "google_compute_vpn_gateway" "vpn_gateway" {
  name    = var.vpn_name
  network = var.network_name
  region  = var.region
}

resource "google_compute_forwarding_rule" "forwarding_rules_vpn" {
  for_each     = var.forwarding_rules
  name         = each.key
  ip_protocol  = each.value.protocol
  port_range   = each.value.port_range
  ip_address   = google_compute_address.vpn_static_ip.id
  target       = google_compute_vpn_gateway.vpn_gateway.id
  network_tier = "PREMIUM"
  region       = var.region
}

resource "google_compute_router" "router" {
  name    = "${var.vpn_name}-rt"
  network = var.network_name
  region  = var.region

  bgp {
    asn            = var.local_asn
    advertise_mode = "DEFAULT"
  }
}

resource "google_compute_router_interface" "interface" {
  name       = "${var.vpn_name}-tunnel-bgp-if"
  router     = google_compute_router.router.name
  vpn_tunnel = google_compute_vpn_tunnel.tunnel.id
  ip_range   = var.interface_ip_range
  region     = var.region
}

resource "google_compute_router_peer" "peer" {
  name                      = "${var.vpn_name}-tunnel-bgp"
  router                    = google_compute_router.router.name
  peer_ip_address           = var.peer_ip_address
  peer_asn                  = var.peer_asn
  advertised_route_priority = var.advertised_route_priority
  interface                 = google_compute_router_interface.interface.id
  region                    = var.region
}

resource "google_compute_vpn_tunnel" "tunnel" {
  name          = "${var.vpn_name}-tunnel-bgp"
  peer_ip       = var.vpn_tunnel_peer_ip
  ike_version   = "2"
  shared_secret = var.tunnel-secret
  region        = var.region

  target_vpn_gateway = google_compute_vpn_gateway.vpn_gateway.id

  router = google_compute_router.router.id

  depends_on = [
    google_compute_forwarding_rule.forwarding_rules_vpn,
  ]
}
