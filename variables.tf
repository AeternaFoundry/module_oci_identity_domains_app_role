variable "identity_domains_app_roles" {
  description = <<EOT
Map of identity_domains_app_roles, attributes below
Required:
    - display_name
    - idcs_endpoint
    - schemas
    - app (block):
        - value (required)
Optional:
    - admin_role
    - attribute_sets
    - attributes
    - authorization
    - available_to_clients
    - available_to_groups
    - available_to_users
    - description
    - legacy_group_name
    - ocid
    - public
    - resource_type_schema_version
    - tags (block):
        - key (required)
        - value (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    display_name                 = string
    idcs_endpoint                = string
    schemas                      = list(string)
    admin_role                   = optional(bool)
    attribute_sets               = optional(list(string))
    attributes                   = optional(string)
    authorization                = optional(string)
    available_to_clients         = optional(bool)
    available_to_groups          = optional(bool)
    available_to_users           = optional(bool)
    description                  = optional(string)
    legacy_group_name            = optional(string)
    ocid                         = optional(string)
    public                       = optional(bool)
    resource_type_schema_version = optional(string)
    app = object({
      value = string
    })
    tags = optional(list(object({
      key   = string
      value = string
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

