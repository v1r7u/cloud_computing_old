# Cloud templates

The repository consists of several terraform templates for Cloud computing demos in `src` directory:

1. `storage_account` module: simple Azure Storage Account
2. `vm_psql` module: VM + VNet + Azure Postgres with private and public endpoints
3. `faas_eh_sa` module: Azure Function integrated with Event Hub and Storage Account
4. `observability` module: Azure Log Analytics workspace

All the modules are stitched together in `main.tf` entry point.

NOTE: The project supports [VSCode remote containers](https://code.visualstudio.com/docs/remote/containers). `.devcontainer` directory contains a ready-to-go profile and dockerfile with required dependencies to run all the samples.

## Provision infrastructure

1. Login to azure `az login` and select Subscription `az account set -s $SUBSCRIPTION_ID`

2. Generate test ssh_key

  ```sh
  TODO: add script
  ```

3. Create `terraform.tfvars` file. This file will contain your unique properties for the rest of terraform configuration, for example:

  ```
  subscription_id = "subscription-id"

  prefix   = "igork"
  location = "westeurope"

  psql_admin    = "psqladmin"
  psql_password = "Secure-password"

  ssh_pub_key_path = "~/.ssh/id_test.pub"
  ```

4. Provision Azure components via terraform

  ```sh
    terraform init
    terraform apply
  ```

### PSQL module

<!--
TODO: output public ips
-->

#### Perform tests

```sh
  ssh -i ~/.ssh/id_test adminuser@vm-ip

  sudo apt update && sudo apt upgrade -y
  sudo apt-get install -y postgresql-client postgresql-contrib

  pgbench -i "host=igork-postgresql-priv.postgres.database.azure.com port=5432 dbname=exampledb user=psqladmin@igork-postgresql-priv sslmode=require"
  pgbench -i "host=igork-postgresql-pub.postgres.database.azure.com port=5432 dbname=exampledb user=psqladmin@igork-postgresql-pub sslmode=require"

  # 3 client, 30 seconds, select-only
  pgbench "host=igork-postgresql-priv.postgres.database.azure.com port=5432 dbname=exampledb user=psqladmin@igork-postgresql-priv sslmode=require" -c 3 -T 30 -S
  pgbench "host=igork-postgresql-pub.postgres.database.azure.com port=5432 dbname=exampledb user=psqladmin@igork-postgresql-pub sslmode=require" -c 3 -T 30 -S
```

#### Check results

Open Log Analytics and query:

```kusto
AzureDiagnostics 
| project TimeGenerated, Resource, Message
| where Message contains "connection received: host"
| where Message !contains "127.0.0.1"
| take 1000
```

Open any VM resource
- open `Metrics` tab
- select `Network Out Billable`
- select both VMs as scope:

![PSQL network](files/psql_network.png)
