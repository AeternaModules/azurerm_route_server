output "route_servers_id" {
  description = "Map of id values across all route_servers, keyed the same as var.route_servers"
  value       = { for k, v in azurerm_route_server.route_servers : k => v.id if v.id != null && length(v.id) > 0 }
}
output "route_servers_branch_to_branch_traffic_enabled" {
  description = "Map of branch_to_branch_traffic_enabled values across all route_servers, keyed the same as var.route_servers"
  value       = { for k, v in azurerm_route_server.route_servers : k => v.branch_to_branch_traffic_enabled if v.branch_to_branch_traffic_enabled != null }
}
output "route_servers_hub_routing_preference" {
  description = "Map of hub_routing_preference values across all route_servers, keyed the same as var.route_servers"
  value       = { for k, v in azurerm_route_server.route_servers : k => v.hub_routing_preference if v.hub_routing_preference != null && length(v.hub_routing_preference) > 0 }
}
output "route_servers_location" {
  description = "Map of location values across all route_servers, keyed the same as var.route_servers"
  value       = { for k, v in azurerm_route_server.route_servers : k => v.location if v.location != null && length(v.location) > 0 }
}
output "route_servers_name" {
  description = "Map of name values across all route_servers, keyed the same as var.route_servers"
  value       = { for k, v in azurerm_route_server.route_servers : k => v.name if v.name != null && length(v.name) > 0 }
}
output "route_servers_public_ip_address_id" {
  description = "Map of public_ip_address_id values across all route_servers, keyed the same as var.route_servers"
  value       = { for k, v in azurerm_route_server.route_servers : k => v.public_ip_address_id if v.public_ip_address_id != null && length(v.public_ip_address_id) > 0 }
}
output "route_servers_resource_group_name" {
  description = "Map of resource_group_name values across all route_servers, keyed the same as var.route_servers"
  value       = { for k, v in azurerm_route_server.route_servers : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "route_servers_routing_state" {
  description = "Map of routing_state values across all route_servers, keyed the same as var.route_servers"
  value       = { for k, v in azurerm_route_server.route_servers : k => v.routing_state if v.routing_state != null && length(v.routing_state) > 0 }
}
output "route_servers_sku" {
  description = "Map of sku values across all route_servers, keyed the same as var.route_servers"
  value       = { for k, v in azurerm_route_server.route_servers : k => v.sku if v.sku != null && length(v.sku) > 0 }
}
output "route_servers_subnet_id" {
  description = "Map of subnet_id values across all route_servers, keyed the same as var.route_servers"
  value       = { for k, v in azurerm_route_server.route_servers : k => v.subnet_id if v.subnet_id != null && length(v.subnet_id) > 0 }
}
output "route_servers_tags" {
  description = "Map of tags values across all route_servers, keyed the same as var.route_servers"
  value       = { for k, v in azurerm_route_server.route_servers : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "route_servers_virtual_router_asn" {
  description = "Map of virtual_router_asn values across all route_servers, keyed the same as var.route_servers"
  value       = { for k, v in azurerm_route_server.route_servers : k => v.virtual_router_asn if v.virtual_router_asn != null }
}
output "route_servers_virtual_router_ips" {
  description = "Map of virtual_router_ips values across all route_servers, keyed the same as var.route_servers"
  value       = { for k, v in azurerm_route_server.route_servers : k => v.virtual_router_ips if v.virtual_router_ips != null && length(v.virtual_router_ips) > 0 }
}

