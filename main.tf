# ---------------------------------------------------------------------------------------------------------------------
# AWS Transit
# ---------------------------------------------------------------------------------------------------------------------
module "aws_transit_1" {
  source              = "terraform-aviatrix-modules/mc-transit/aviatrix"
  cloud               = "aws"
  name                = "aws-transit"
  region              = var.aws_region
  cidr                = cidrsubnet(local.aws_supernet, 7, 0)
  account             = var.aws_account
  insane_mode         = var.hpe
  instance_size       = var.aws_instance_size
  ha_gw               = var.ha_gw
  enable_segmentation = var.enable_segmentation
  local_as_number     = 65501
}

# ---------------------------------------------------------------------------------------------------------------------
# Azure Transit
# ---------------------------------------------------------------------------------------------------------------------
module "azure_transit_1" {
  source              = "terraform-aviatrix-modules/mc-transit/aviatrix"
  cloud               = "azure"
  name                = "azure-transit"
  region              = var.azure_region
  cidr                = cidrsubnet(local.azure_supernet, 7, 0)
  account             = var.azure_account
  insane_mode         = var.hpe
  instance_size       = var.azure_instance_size
  ha_gw               = var.ha_gw
  enable_segmentation = var.enable_segmentation
  local_as_number     = 65502
}

# ---------------------------------------------------------------------------------------------------------------------
# GCP Transit
# ---------------------------------------------------------------------------------------------------------------------
module "gcp_transit_1" {
  source              = "terraform-aviatrix-modules/mc-transit/aviatrix"
  cloud               = "gcp"
  name                = "gcp-transit"
  region              = var.gcp_region
  cidr                = cidrsubnet(local.gcp_supernet, 7, 0)
  account             = var.gcp_account
  insane_mode         = var.hpe
  instance_size       = var.gcp_instance_size
  ha_gw               = var.ha_gw
  enable_segmentation = var.enable_segmentation
  local_as_number     = 65503
}


# ---------------------------------------------------------------------------------------------------------------------
# AWS Spoke
# ---------------------------------------------------------------------------------------------------------------------
module "aws_prod_spoke_1" {
  source        = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  cloud         = "AWS"
  name          = "aws-prod-spoke"
  cidr          = cidrsubnet(local.aws_supernet, 8, 2)
  region        = var.aws_region
  account       = var.aws_account
  transit_gw    = module.aws_transit_1.transit_gateway.gw_name
  insane_mode   = var.hpe
  instance_size = var.aws_instance_size
  ha_gw         = var.ha_gw
}

# ---------------------------------------------------------------------------------------------------------------------
# Azure Spoke
# ---------------------------------------------------------------------------------------------------------------------
module "azure_prod_spoke_1" {
  source        = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  cloud         = "azure"
  name          = "azure-prod-spoke"
  cidr          = cidrsubnet(local.azure_supernet, 8, 2)
  region        = var.azure_region
  account       = var.azure_account
  transit_gw    = module.azure_transit_1.transit_gateway.gw_name
  insane_mode   = var.hpe
  instance_size = var.azure_instance_size
  ha_gw         = var.ha_gw
}

# ---------------------------------------------------------------------------------------------------------------------
# GCP Spoke
# ---------------------------------------------------------------------------------------------------------------------
module "gcp_prod_spoke_1" {
  source        = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  cloud         = "gcp"
  name          = "gcp-prod-spoke"
  cidr          = cidrsubnet(local.gcp_supernet, 8, 2)
  region        = var.gcp_region
  account       = var.gcp_account
  transit_gw    = module.gcp_transit_1.transit_gateway.gw_name
  insane_mode   = var.hpe
  instance_size = var.gcp_instance_size
  ha_gw         = var.ha_gw
}

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