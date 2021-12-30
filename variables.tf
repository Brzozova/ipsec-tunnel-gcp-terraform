variable "project_id" {
  type        = string
  description = <<EOF
     The ID of the project in which the resource belongs.
     If it is not provided, the provider project is used.
  EOF
}

variable "vpn_name" {
  type        = string
  description = "Name of the network VPN Gateway."
}

variable "region" {
  type        = string
  description = "The region to host the required components."
}

variable "vpn_tunnel_peer_ip" {
  type        = string
  description = <<-EOF
    IP address of the peer VPN gateway. Only IPv4 is supported."
  EOF
}

variable "tunnel_secret_name" {
  type        = string
  description = <<EOF
     Shared secret used to set the secure session between the
     Cloud VPN gateway and the peer VPN gateway.
     Stored in Secred Manager.
  EOF
}

variable "forwarding_rules" {
  type        = map(any)
  description = "Map of forwarding rules."
}

variable "peer_ip_address" {
  type        = string
  description = <<EOF
     IP address of the BGP interface outside
     Google Cloud Platform. Only IPv4 is supported.
  EOF
}

variable "peer_asn" {
  type        = string
  description = <<EOF
     Peer BGP Autonomous System Number (ASN).
     Each BGP interface may use a different value.
  EOF
}

variable "local_asn" {
  type        = string
  description = <<EOF
     Local BGP Autonomous System Number (ASN).
     Must be an RFC6996 private ASN, either 16-bit or 32-bit.
     The value will be fixed for this router resource.
     All VPN tunnels that link to this router will
     have the same local ASN.
  EOF
}

variable "advertised_route_priority" {
  type        = string
  description = <<EOF
     The priority of routes advertised to this BGP peer.
     Where there is more than one matching route of maximum
     length, the routes with the lowest priority value win.
  EOF
  default     = "100"
}

variable "interface_ip_range" {
  type        = string
  description = <<EOF
     IP address and range of the interface.
     The IP range must be in the RFC3927 link-local IP space.
     Changing this forces a new interface to be created.
  EOF
}

variable "network_name" {
  type        = string
  description = "Name of the network being created"
}

variable "description" {
  type        = string
  description = <<-EOF
    The resource must be recreated to modify this field."
  EOF
  default     = ""
}
