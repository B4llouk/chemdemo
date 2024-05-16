## 00_GLOBAL_CONFIG ## 
location= "westeurope" 
subscription_id = "mocksubscriptionid" 
resource_group_name = "chemdemoprod" 

## 01_BACKUP ## 
## 01/01_KAFKA ## 

storage_account_backup_kafka = {
    name = "chemdemokafkabackupprod" 
    # for example, replication type would probably be different for prod as we would want to replicate storage in prod but not on other envs   
    replication_type = "mockreplication" 
    blob_propreties= {
        changed_feed_enabled= true 
        versioning_enabled = true  

        restore_policy = {
            days = 6
        }
        
        delete_retention_policy = { 
            days= 7 # we could need delete retention for prod but not for other envs
        }
    }
}