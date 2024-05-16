## 00_GLOBAL_CONFIG ## 
location= "westeurope" 
subscription_id = "mocksubscriptionid" 
resource_group_name = "chemdemostg" 

## 01_BACKUP ## 
## 01/01_KAFKA ## 

storage_account_backup_kafka = {
    name = "chemdemokafkabackupdev"   
    blob_propreties= {
        changed_feed_enabled= true 
        versioning_enabled = true  

        restore_policy = {
            days = 6
        }

    }
}