# ---------------------------------------------------------------------------------------------------------------------
# Multi-Cloud Transit Peering
# ---------------------------------------------------------------------------------------------------------------------
# module "transit-peering" {
#   source  = "terraform-aviatrix-modules/mc-transit-peering/aviatrix"
#   version = "1.0.3"

#   transit_gateways = [
#     module.aws_transit_1.transit_gateway.gw_name,
#     module.azure_transit_1.transit_gateway.gw_name,
#     module.gcp_transit_1.transit_gateway.gw_name,
#   ]

#   excluded_cidrs = ["0.0.0.0/0"]
# }