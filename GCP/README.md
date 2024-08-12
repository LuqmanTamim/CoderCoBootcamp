# Google Cloud Platform (GCP)

### Networking  
AWS VPC -> Cloud VPC
AWS VPN -> Cloud VPN (Sharing on prem with cloud)
Direct connect -> Cloud interconnect

### Storage  
__*(Object storage)*__ S3 -> Cloud storage 
__*(Block storage)*__  EBS -> Persistent disk
__*(File storage/share)*__  EFS -> Filestore

### Database  
__*(OLTP)*__  RDS/Aurora (high compute) -> Cloud SQL, Cloud Spanner (mission critical workloads and huge transactions)
__*(Data warehousing)*__  Amazon Redshift (SQL) -> BigQuery (huge volumes of data)
__*(NoSQL)*__  DynamoDB, DocumentDB -> Datastore/firestore, Cloud Bigtable(petabytes)
__*(cache databases)*__  Amazon ElastiCache -> Memorystore

### Other Services  
__*(Messaging)*__  Amazon SNS (Push based to subscribers), Amazon SQS (Msg pulled by customers) -> Cloud Pub/Sub (supports both pull and push approach)
__*(IAM)*__  Amazon IAM -> Cloud IAM
__*(Key management)*__  AWS KMW -> Cloud KMS
__*(IaC)*__  CloudFormation -> Cloud Deployment Manager
__*(Monitoring)*__  CloudWatch -> Monitoring
__*(Service Logs)*__  CloudWatch logs -> Cloud Logging
__*(Trace requests across applications)*__  AWS X-Ray -> Cloud Trace

### Regions and Zones
Regions -> Zones -> Zone list
