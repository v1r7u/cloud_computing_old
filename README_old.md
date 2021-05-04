# Cloud templates

The repository consists of several terraform templates for Cloud computing demos in `src` directory:

1. `storage_account` module: simple Azure Storage Account
2. `vm_psql` module: VM + VNet + Azure Postgres with private and public endpoints
3. `faas_eh_sa` module: Azure Function integrated with Event Hub and Storage Account
4. `observability` module: Azure Log Analytics workspace

All the modules are stitched together in `main.tf` entry point.

NOTE: The project supports [VSCode remote containers](https://code.visualstudio.com/docs/remote/containers). `.devcontainer` directory contains a ready-to-go profile and dockerfile with required dependencies to run all the samples.

## Provision infrastructure


