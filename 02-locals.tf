locals {
  group_name = "mars"

  ui_inbound_ports = {
    "100" : "80",
    "110" : "443",
    "120" : "3000"
  }

  api_inbound_ports = {
    "100" : "80",
    "110" : "443",
    "120" : "8080",
    "130" : "22"
  }

  db_inbound_ports = {
    "100" : "5432",
    "110" : "3306",
  }

  ag_inbound_ports = {
    "100" : "80",
    "110" : "443",
    "130" : "65200-65535"
  }

  api_vmss_inbound_ports = {
    "100" : "80",
    "110" : "8080",
    "120" : "443",
    "130" : "22"
  }

  ui_vmss_inbound_ports = {
    "100" : "80",
    "110" : "3000",
    "120" : "443",
    "130" : "22"
  }

  frontend_port_name             = "ag-instance-feport"
  frontend_ip_configuration_name = "ag-instance-feip"

  # API
  backend_address_pool_name_api = "ag-instance-api-address-pool"
  http_setting_name_api         = "ag-instance-be-htst-api"
  listener_name_api             = "ag-instance-listener-api"
  request_routing_rule_api      = "ag-instance-routing-rule-api"
  probe_name_api                = "ag-instance-probe-api"

  # REACT
  backend_address_pool_name_ui = "ag-instance-ui-address-pool"
  http_setting_name_ui         = "ag-instance-be-htst-ui"
  listener_name_ui             = "ag-instance-listener-ui"
  request_routing_rule_ui      = "ag-instance-routing-rule-ui"
  probe_name_ui                = "ag-instance-probe-ui"

  azure_username   = "azureuser"
  azure_public_key = file("${path.module}/ssh-key/terraform-azure.pub")
  environment      = var.environment

  common_tags = {
    environment = local.environment
  }

}

