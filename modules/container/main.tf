resource "azurerm_service_plan" "service_plan" {
  name                = "${var.service_plan}-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "app_pyweb" {
  name                = "app-pyweb"
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.service_plan.id

  site_config {
    always_on = true
    application_stack {
      docker_image_name = var.container_image
      docker_registry_url = "https://index.docker.io"
    }
  }
  tags = var.tags
}
