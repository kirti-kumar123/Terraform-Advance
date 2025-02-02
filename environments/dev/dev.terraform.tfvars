
dev-rgs = {
  rg1 = {
    name     = "Mahendra"
    location = "westeurope"
  }
  rg2 = {
    name     = "kumar"
    location = "westeurope"
    tags     = { environment = "dev" }
  }
  rg3 = {
    name     = "kirti1"
    location = "westeurope"
    tags     = { environment = "dev" }
  }

}


dev-stgs = {
  stg1 = {
    name                     = "kirtistoragekumar"
    resource_group_name      = "kirti1"
    location                 = "westeurope"
    account_replication_type = "LRS"
    account_tier             = "Standard"

  }
  stg2 = {
    name                     = "kirtistoragekumar1"
    resource_group_name      = "kumar"
    location                 = "westeurope"
    account_replication_type = "LRS"
    account_tier             = "Standard"

} }

dev-cons = {
  con1 = {
    name                 = "kirticonatiner"
    storage_account_name = "kirtistoragekumar"
    resource_group_name  = "kirti1"
  }
  con2 = {
    name                 = "kirticonatiner1"
    storage_account_name = "kirtistoragekumar1"
    resource_group_name  = "kumar"
  }
}

dev-vnets = {
  vnet1 = {
    name                = "vnet"
    location            = "Japan East"
    resource_group_name = "kirti1"
    address_space       = ["10.0.0.0/24"]
    dns_servers         = ["10.0.0.4", "10.0.0.5"]
    subnets = {
      subnet1 = {

        name             = "floor1"
        address_prefixes = ["10.0.0.0/28"]
      }
      subnet2 = {

        name             = "floor2"
        address_prefixes = ["10.0.0.16/28"]
      }
      subnet3 = {

        name             = "AzureBastionSubnet"
        address_prefixes = ["10.0.0.64/26"]
    } }

  }
  vnet2 = {
    name                = "vnet1"
    location            = "Japan East"
    resource_group_name = "kirti1"
    address_space       = ["10.0.1.0/24"]
    dns_servers         = ["10.0.0.4", "10.0.0.5"]
    subnets = {
      subnet1 = {

        name             = "floor1"
        address_prefixes = ["10.0.1.0/28"]
      }
      subnet2 = {

        name             = "floor2"
        address_prefixes = ["10.0.1.16/28"]
      }
      subnet3 = {

        name             = "floor3"
        address_prefixes = ["10.0.1.32/27"]
    } }

  }
}


dev-win-vms = {
  vm1 = {
    vm_name             = "kirtivm"
    resource_group_name = "kirti1"
    location            = "Japan East"
    size                = "Standard_F2"
    # admin_username                = "kirti"
    # admin_password                = "kirti@123"
    caching                       = "ReadWrite"
    storage_account_type          = "Standard_LRS"
    publisher                     = "MicrosoftWindowsServer"
    offer                         = "WindowsServer"
    sku                           = "2016-Datacenter"
    version                       = "latest"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "floor1"
    virtual_network_name          = "vnet"
    allocation_method             = "Static"
    nsg_name                      = "kirtivm-nsg"
    asgs_name                     = "AppWeb"
    kv_name="kirtiKeyvault"
  }
  vm2 = {
    vm_name                       = "kirtivm1"
    resource_group_name           = "kirti1"
    location                      = "Japan East"
    size                          = "Standard_B1s"
    admin_username                = "kirti"
    admin_password                = "kirti@123"
    caching                       = "ReadWrite"
    storage_account_type          = "Standard_LRS"
    publisher                     = "MicrosoftWindowsServer"
    offer                         = "WindowsServer"
    sku                           = "2016-Datacenter"
    version                       = "latest"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "floor1"
    virtual_network_name          = "vnet"
    allocation_method             = "Static"
    nsg_name                      = "kirtivm-nsg"
    asgs_name                     = "AppWeb"
    kv_name="kirtiKeyvault"
  }
  # vm3={
  #   vm_name= "kirtivm2"
  #   resource_group_name="kirti1"
  #   location="Japan East"
  #   size="Standard_B1s"
  #   admin_username="kirti"
  #   admin_password="kirti@123"
  #   caching="ReadWrite"
  #   storage_account_type="Standard_LRS"
  #   publisher= "MicrosoftWindowsServer"
  #   offer= "WindowsServer"
  #   sku="2016-Datacenter"
  #   version= "latest"
  #   private_ip_address_allocation="Dynamic"
  #   subnet_name="floor2"
  #    virtual_network_name= "vnet"
  #    allocation_method="Static"
  #    nsg_name="kirtivm-nsg"
  #    asgs_name="AppLogic"
  # }
}

dev-nsgs = {
  nsg1 = {
    name                = "kirtivm-nsg"
    resource_group_name = "kirti1"
    location            = "Japan East"
    security_rules = {
      rule1 = {
        name                       = "RDPAllow"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
      rule2 = {
        name                       = "RDPDeny"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Deny"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }
}
dev-asgs = {
  asgs1 = {
    name                = "AppWeb"
    location            = "Japan East"
    resource_group_name = "kirti1"
  }
  asgs2 = {
    name                = "AppLogic"
    location            = "Japan East"
    resource_group_name = "kirti1"
  }
}

dev-bastions = {
  bas1 = {
    name                 = "kirtibastion"
    location             = "Japan East"
    resource_group_name  = "kirti1"
    allocation_method    = "Static"
    pip_sku              = "Standard"
    virtual_network_name = "vnet"
    virtual_network_id   = false
  }
}

dev-keyvaults = {
  kv1 = {
    name                       = "kirtiKeyvault"
    location                   = "Japan East"
    resource_group_name        = "kirti1"
    soft_delete_retention_days = 7
    purge_protection_enabled   = true
    sku_name                   = "standard"
    key_permissions            = ["Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey", "Release", "Rotate", "GetRotationPolicy","SetRotationPolicy"]
    secret_permissions         = ["Backup", "Delete", "Get", "List", "Purge", "Recover","Restore","Set"]
    storage_permissions        = []
    certificate_permissions    = ["Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"]

} }
