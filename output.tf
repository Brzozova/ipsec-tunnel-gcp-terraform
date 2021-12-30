output "vpn_ip_id" {
  value       = google_compute_address.vpn_static_ip.id
  description = "The ID of VPN external IP address."
}

output "vpn_gateway_ip" {
  value       = google_compute_address.vpn_static_ip.address
  description = "The IP address of VPN gateway."
}

output "vpn_router_id" {
  value       = google_compute_router.router.id
  description = "The ID of the Cloud Router being created."
}

output "peer_ip_address" {
  value       = google_compute_router_peer.peer.peer_ip_address
  description = "The IP address of the BGP interface outside Google Cloud Platform."
}

output "tunnel_self_link" {
  value       = google_compute_vpn_tunnel.tunnel.self_link
  description = "The URI of the BGP tunnel being created."
}

output "tunnel_peer_ip" {
  value       = google_compute_vpn_tunnel.tunnel.peer_ip
  description = "The IP address of the peer VPN gateway."
}

output "interface_ip_range" {
  value       = google_compute_router_interface.interface.ip_range
  description = "The IP range of the interface."
}