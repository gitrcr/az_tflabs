output "vm_name" {
  value = azurerm_windows_virtual_machine.this.name
}

output "vm_id" {
  value = azurerm_windows_virtual_machine.this.id
}

output "public_ip" {
  value = azurerm_public_ip.this.ip_address
}

output "private_ip" {
  value = azurerm_network_interface.this.ip_configuration[0].private_ip_address
}



# Output combinado (opcional)
output "vm_windows_info" {
  description = "Información completa de la VM"
  value = {
    name       = azurerm_windows_virtual_machine.this.name
    subnet_id  = azurerm_network_interface.this.ip_configuration[0].subnet_id
    private_ip = azurerm_network_interface.this.ip_configuration[0].private_ip_address
    public_ip  = azurerm_public_ip.this.ip_address
  }
}