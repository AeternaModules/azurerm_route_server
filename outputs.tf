output "route_servers" {
  description = "All route_server resources"
  value       = azurerm_route_server.route_servers
}
output "route_servers_branch_to_branch_traffic_enabled" {
  description = "List of branch_to_branch_traffic_enabled values across all route_servers"
  value       = [for k, v in azurerm_route_server.route_servers : v.branch_to_branch_traffic_enabled]
}
output "route_servers_hub_routing_preference" {
  description = "List of hub_routing_preference values across all route_servers"
  value       = [for k, v in azurerm_route_server.route_servers : v.hub_routing_preference]
}
output "route_servers_location" {
  description = "List of location values across all route_servers"
  value       = [for k, v in azurerm_route_server.route_servers : v.location]
}
output "route_servers_name" {
  description = "List of name values across all route_servers"
  value       = [for k, v in azurerm_route_server.route_servers : v.name]
}
output "route_servers_public_ip_address_id" {
  description = "List of public_ip_address_id values across all route_servers"
  value       = [for k, v in azurerm_route_server.route_servers : v.public_ip_address_id]
}
output "route_servers_resource_group_name" {
  description = "List of resource_group_name values across all route_servers"
  value       = [for k, v in azurerm_route_server.route_servers : v.resource_group_name]
}
output "route_servers_routing_state" {
  description = "List of routing_state values across all route_servers"
  value       = [for k, v in azurerm_route_server.route_servers : v.routing_state]
}
output "route_servers_sku" {
  description = "List of sku values across all route_servers"
  value       = [for k, v in azurerm_route_server.route_servers : v.sku]
}
output "route_servers_subnet_id" {
  description = "List of subnet_id values across all route_servers"
  value       = [for k, v in azurerm_route_server.route_servers : v.subnet_id]
}
output "route_servers_tags" {
  description = "List of tags values across all route_servers"
  value       = [for k, v in azurerm_route_server.route_servers : v.tags]
}
output "route_servers_virtual_router_asn" {
  description = "List of virtual_router_asn values across all route_servers"
  value       = [for k, v in azurerm_route_server.route_servers : v.virtual_router_asn]
}
output "route_servers_virtual_router_ips" {
  description = "List of virtual_router_ips values across all route_servers"
  value       = [for k, v in azurerm_route_server.route_servers : v.virtual_router_ips]
}

