https://docs.microsoft.com/en-us/azure/developer/terraform/create-linux-virtual-machine-with-infrastructure

TODO:
+ 1. add vms-subnet to psql-priv firewall
+ 2. create subnet for network-interface with public IP
+ 3. add pub-ip to psql-pub firewall
4. add log analytics


```sh
  terraform init
  terraform apply

  ssh -i ~/.ssh/id_test adminuser@vm-ip

  sudo apt update
  sudo apt upgrade
  sudo apt-get install -y postgresql-client
  sudo apt-get install -y postgresql-contrib

  pgbench -i "host=igork-postgresql-pub.postgres.database.azure.com port=5432 dbname=exampledb user=psqladmin@igork-postgresql-pub sslmode=require"
  # 1 client, 30 seconds, select-only
  pgbench "host=igork-postgresql-pub.postgres.database.azure.com port=5432 dbname=exampledb user=psqladmin@igork-postgresql-pub sslmode=require" -c 1 -T 30 -S
```
