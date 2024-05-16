variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "backup-rg"
}

variable "storage_account_backup_kafka" {
  description = "Storage account configuration"
  type = object ({
    name = string 
    storage_name = optional (string, "kafka_backup_archive")
    tier = optional (string, "Standard")
    replication_type= optional (string, "LRS")
    kind = optional (string, "StorageV2") 
    blob_propreties= optional (object ({
      changed_feed_enabled = optional (bool)
      versioning_enabled = optional (bool) 
      restore_policy = optional (object({ days = number })) # restore policy config 
      delete_retention_policy = optional (object ({ days = number})) # delete retention policy config
    }) )
  })
}

variable "location" {}