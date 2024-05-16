locals {
  tags = { 
    # here we can put useful tags for env, repo and who manages this object, example: 
    environemnt = var.environemnt 
    repository = "git@github.com:B4llouk/chemdemo" 
  }
}

resource "azurerm_resource_group" "mock_backup" {
  name     = "${var.resource_group_name}-${var.environment}"
  location = var.resource_group_location
}

resource "azurerm_storage_account" "kafka_backup_storage_account" {
  name                     = var.storage_account_backup_kafka.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.storage_account_backup_kafka.account_tier
  account_replication_type = var.storage_account_backup_kafka.replication_type
  tags= local.tags
}

blob_propreties { 
  changed_feed_enabled = var.storage_account_backup_kafka.blob_propreties.changed_feed_enabled
  versioning_enabled = var.storage_account_backup_kafka.blob_propreties.versioning_enabled

  restore_policy { 
    days= var.storage_account_backup_kafka.blob_propreties.restore_policy.days
  }

  delete_retention_policy {
    days= var.storage_account_backup_kafka.blob_propreties.delete_retention_policy.days
  }
}

resource "azurerm_storage_container" "kafka_backup_container" {
  name                  = var.storage_account_backup_kafka.storage_name
  storage_account_name  = azurerm_storage_account.kafka_backup_storage_account.name
}
