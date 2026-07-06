variable "route_servers" {
  description = <<EOT
Map of route_servers, attributes below
Required:
    - location
    - name
    - public_ip_address_id
    - resource_group_name
    - sku
    - subnet_id
Optional:
    - branch_to_branch_traffic_enabled
    - hub_routing_preference
    - tags
EOT

  type = map(object({
    location                         = string
    name                             = string
    public_ip_address_id             = string
    resource_group_name              = string
    sku                              = string
    subnet_id                        = string
    branch_to_branch_traffic_enabled = optional(bool)   # Default: false
    hub_routing_preference           = optional(string) # Default: "ExpressRoute"
    tags                             = optional(map(string))
  }))
  validation {
    condition = alltrue([
      for k, v in var.route_servers : (
        contains(["Standard"], v.sku)
      )
    ])
    error_message = "must be one of: Standard"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_route_server's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    validate.RouteServerName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: public_ip_address_id
  #   source:    [from commonids.ValidatePublicIPAddressID] !ok
  # path: public_ip_address_id
  #   source:    [from commonids.ValidatePublicIPAddressID] err != nil
  # path: subnet_id
  #   source:    [from commonids.ValidateSubnetID] !ok
  # path: subnet_id
  #   source:    [from commonids.ValidateSubnetID] err != nil
  # path: hub_routing_preference
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

