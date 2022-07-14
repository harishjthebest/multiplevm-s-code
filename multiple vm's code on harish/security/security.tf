resource "azurerm_network_security_group" "harish_security" {
  name                = "harish_security_group"
  location            = var.location
  resource_group_name = var.rg
  security_rule {
    name                       = "harish_security_rule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_subnet_network_security_group_association" "harish_security" {
  subnet_id                 = var.vsubid
  network_security_group_id = azurerm_network_security_group.harish_security.id
}