# Terraform code sample 
This code sample presents a granular way to create a blob storage for backup, in our mock case, we suppose that we are creating a blob storage to backup kafka topics, which is something I have done in a previous company.  

First we have the Azure provider setup along with env-agnostic variables like resources names and for example, storage account config that could be different accross environment. 

## 01_backup/01_kafka
In this layer, we isolate the infrastructure for kafka backups. everytime we apply the contents of this folder, only  kafka backup infrastructure is affected. This is useful for separation of concerns. However, this layering granularity would not be a best practice if all of a client/company infra is provisioned and tracked with tf. In that case it would be past to implement one layer that tracks the infra state overall. 

## .tfvars
These files are referenced as argument when applying the tf layer in order to apply env-agnostic resources. 