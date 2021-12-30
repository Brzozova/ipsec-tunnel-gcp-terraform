# Network tunnels

This module is used to deploy ipsec tunnel in GCP.

## Forwarding rules map described

Example of Forwarding rules map:

```bash
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
```

### Example of import

There you have example of proper import:

```bash
terragrunt import 'google_compute_forwarding_rule.forwarding_rules_vpn["gcp-vpn-rule-udp4500"]' "europe-west3/gcp-vpn-rule-udp4500"
terragrunt import 'google_compute_forwarding_rule.forwarding_rules_vpn["gcp-vpn-rule-esp"]' "europe-west3/gcp-vpn-rule-esp"
terragrunt import 'google_compute_forwarding_rule.forwarding_rules_vpn["gcp-vpn-rule-udp500"]' "europe-west3/gcp-vpn-rule-udp500"
terragrunt import google_compute_vpn_tunnel.tunnel projects/casino-ngf/regions/europe-west3/vpnTunnels/gcp-vpn-tunnel-bgp
```
<!-- BEGIN_TF_DOCS -->


## Resources

| Name | Type |
|------|------|
| [google_compute_address.vpn_static_ip](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_compute_forwarding_rule.forwarding_rules_vpn](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_forwarding_rule) | resource |
| [google_compute_router.router](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router) | resource |
| [google_compute_router_interface.interface](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_interface) | resource |
| [google_compute_router_peer.peer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_peer) | resource |
| [google_compute_vpn_gateway.vpn_gateway](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_vpn_gateway) | resource |
| [google_compute_vpn_tunnel.tunnel](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_vpn_tunnel) | resource |

## Providers

| Name | Version |
|------|---------|
| google | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| advertised\_route\_priority | The priority of routes advertised to this BGP peer. Where there is more than one matching route of maximum length, the routes with the lowest priority value win. | `string` | `"100"` | no |
| description | The resource must be recreated to modify this field. | `string` | `""` | no |
| forwarding\_rules | Map of forwarding rules. | `map(any)` | n/a | yes |
| interface\_ip\_range | IP address and range of the interface. The IP range must be in the RFC3927 link-local IP space. Changing this forces a new interface to be created. | `string` | n/a | yes |
| local\_asn | Local BGP Autonomous System Number (ASN). Must be an RFC6996 private ASN, either 16-bit or 32-bit. The value will be fixed for this router resource. All VPN tunnels that link to this router will have the same local ASN. | `string` | n/a | yes |
| network\_name | Name of the network being created | `string` | n/a | yes |
| peer\_asn | Peer BGP Autonomous System Number (ASN). Each BGP interface may use a different value. | `string` | n/a | yes |
| peer\_ip\_address | IP address of the BGP interface outside Google Cloud Platform. Only IPv4 is supported. | `string` | n/a | yes |
| project\_id | The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | `string` | n/a | yes |
| region | The region to host the required components. | `string` | n/a | yes |
| tunnel\_secret\_name | Shared secret used to set the secure session between the Cloud VPN gateway and the peer VPN gateway. | `string` | n/a | yes |
| vpn\_name | Name of the network VPN Gateway. | `string` | n/a | yes |
| vpn\_tunnel\_peer\_ip | IP address of the peer VPN gateway. Only IPv4 is supported. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| interface\_ip\_range | The IP range of the interface. |
| peer\_ip\_address | The IP address of the BGP interface outside Google Cloud Platform. |
| tunnel\_peer\_ip | The IP address of the peer VPN gateway. |
| tunnel\_self\_link | The URI of the BGP tunnel being created. |
| vpn\_gateway\_ip | The IP address of VPN gateway. |
| vpn\_ip\_id | The ID of VPN external IP address. |
| vpn\_router\_id | The ID of the Cloud Router being created. |

<!-- END_TF_DOCS -->
