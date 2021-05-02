# Create Azure Kuberntes Service from Azure Portal

The goal: show required steps to create a complex Azure offering (AKS)

1. Open "create service" view and select Kubernetes Service. Fill in the form:

    1. Create new resource group.

    2. Enter unique within Resource Group AKS name.

    3. Select desired region (based on region might change avaialble VM types, availability zones, kubernetes versions)

    4. Select availability zones (for example, deselect all zones to opt-out from zone-redundancy)

    5. Select desired Kubernetes version (for example, the latest available)

    6. Select primary node pool VM type and count (only one VM could be enough)

    7. Go to Node Pools. Add new `zeropool` without availability zones with any VM type and scale it to 0.

    8. Go to authentication. Explain high-level meaning of each property.

    9. Go to Networking. Stay with default values, but choose Network Policy plugin. Networking stack should be explained at demo `05-core-services_networking`.

    10. Go to Integrations. Stay with defaults.

    11. Skip tags, create AKS.

2. Review created AKS

    1. Enable auto-scaler for `zeropool`.

    2. Show Kubernetes resources and Container Insights.

    3. Show created _system resource group_ with VMs and networking stack.
