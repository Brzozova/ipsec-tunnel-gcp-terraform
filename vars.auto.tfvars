  vpn_name                  = "gcp-vpn"
  network_name              = "random-network"
  region                    = "europe-west3"
  interface_ip_range        = "185.384.0.10/30"
  vpn_tunnel_peer_ip        = "92.233.40.47"
  tunnel_secret_name        = "ipsec-tunnel-secret" 
  peer_ip_address           = "185.384.0.4"
  peer_asn                  = "65500"
  local_asn                 = "65507"
  advertised_route_priority = "100"

  forwarding_rules = {
    "gcp-vpn-rule-esp" = {
      "protocol"    = "ESP"
      "port_range"  = null
      "target_pool" = "gcp-vpn"
    }
    "gcp-vpn-rule-udp500" = {
      "protocol"    = "UDP"
      "port_range"  = "500"
      "target_pool" = "gcp-vpn"
    }
    "gcp-vpn-rule-udp4500" = {
      "protocol"    = "UDP"
      "port_range"  = "4500"
      "target_pool" = "gcp-vpn"
    }
  }
