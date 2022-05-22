# Reference   : https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_gateway
# Description : Manages an Application Gateway.
resource "azurerm_application_gateway" "ag-instance" {
  name                = "${local.group_name}-ag-instance"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  sku {
    name = "Standard_v2"
    tier = "Standard_v2"
  }

  autoscale_configuration {
    min_capacity = 1
    max_capacity = 2
  }

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = azurerm_subnet.agsubnet.id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.ag_publicip.id
  }

  # API
  http_listener {
    name                           = local.listener_name_api
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
    host_names                     = ["api.mars-smartbank.com"]
  }


  backend_address_pool {
    name = local.backend_address_pool_name_api
  }

  backend_http_settings {
    name                  = local.http_setting_name_api
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
    # probe_name            = local.probe_name_api
  }

  # probe {
  #   name                = local.probe_name_api
  #   host                = "127.0.0.1"
  #   interval            = 30
  #   timeout             = 30
  #   unhealthy_threshold = 3
  #   protocol            = "Http"
  #   port                = 80
  #   path                = "/api/healthcheck.html"
  # }

  # UI
  http_listener {
    name                           = local.listener_name_ui
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
    host_names                     = ["ui.mars-smartbank.com"]
  }

  backend_address_pool {
    name = local.backend_address_pool_name_ui
  }
  backend_http_settings {
    name                  = local.http_setting_name_ui
    cookie_based_affinity = "Disabled"
    port                  = 3000
    protocol              = "Http"
    request_timeout       = 60
    # probe_name            = local.probe_name_ui
  }
  # probe {
  #   name                = local.probe_name_ui
  #   host                = "127.0.0.1"
  #   interval            = 30
  #   timeout             = 30
  #   unhealthy_threshold = 3
  #   protocol            = "Http"
  #   port                = 80
  #   path                = "/ui/healthcheck.html"
  # }

  request_routing_rule {
    name                       = local.request_routing_rule_api
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name_api
    backend_address_pool_name  = local.backend_address_pool_name_api
    backend_http_settings_name = local.http_setting_name_api
  }

  request_routing_rule {
    name                       = local.request_routing_rule_ui
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name_ui
    backend_address_pool_name  = local.backend_address_pool_name_ui
    backend_http_settings_name = local.http_setting_name_ui
  }

}



