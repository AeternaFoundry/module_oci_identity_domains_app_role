resource "oci_identity_domains_app_role" "identity_domains_app_roles" {
  for_each = var.identity_domains_app_roles

  display_name                 = each.value.display_name
  idcs_endpoint                = each.value.idcs_endpoint
  schemas                      = each.value.schemas
  admin_role                   = each.value.admin_role
  attribute_sets               = each.value.attribute_sets
  attributes                   = each.value.attributes
  authorization                = each.value.authorization
  available_to_clients         = each.value.available_to_clients
  available_to_groups          = each.value.available_to_groups
  available_to_users           = each.value.available_to_users
  description                  = each.value.description
  legacy_group_name            = each.value.legacy_group_name
  ocid                         = each.value.ocid
  public                       = each.value.public
  resource_type_schema_version = each.value.resource_type_schema_version

  app {
    value = each.value.app.value
  }

  dynamic "tags" {
    for_each = each.value.tags != null ? each.value.tags : []
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

