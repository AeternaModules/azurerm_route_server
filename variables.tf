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
    branch_to_branch_traffic_enabled = optional(bool)
    hub_routing_preference           = optional(string)
    tags                             = optional(map(string))
  }))
  validation {
    condition = alltrue([
      for k, v in var.route_servers : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.route_servers : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.route_servers : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.route_servers : (
        contains(["Standard"], v.sku)
      )
    ])
    error_message = "must be one of: Standard"
  }
  validation {
    condition = alltrue([
      for k, v in var.route_servers : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 11 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

