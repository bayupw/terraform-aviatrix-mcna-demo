# ---------------------------------------------------------------------------------------------------------------------
# CIDR
# ---------------------------------------------------------------------------------------------------------------------
variable "global_supernet" {
  type    = string
  default = "10.0.0.0/8"
}

# Subnetting
locals {
  aws_supernet   = cidrsubnet(var.global_supernet, 8, 1) # 10.1.0.0/16
  azure_supernet = cidrsubnet(var.global_supernet, 8, 2) # 10.2.0.0/16
  gcp_supernet   = cidrsubnet(var.global_supernet, 8, 3) # 10.3.0.0/16
}

# ---------------------------------------------------------------------------------------------------------------------
# CSP Accounts
# ---------------------------------------------------------------------------------------------------------------------
variable "aws_account" {
  description = "AWS access account"
  type        = string
  default     = "aws-account"
}

variable "azure_account" {
  description = "Azure access account"
  type        = string
  default     = "azure-account"
}

variable "gcp_account" {
  description = "GCP access account"
  type        = string
  default     = "gcp-account"
}

# ---------------------------------------------------------------------------------------------------------------------
# CSP Regions
# ---------------------------------------------------------------------------------------------------------------------
variable "aws_region" {
  type        = string
  default     = "ap-southeast-2"
  description = "AWS region"
}

variable "azure_region" {
  type        = string
  default     = "Australia East"
  description = "Azure region"
}

variable "gcp_region" {
  type        = string
  default     = "australia-southeast1"
  description = "GCP region"
}

# ---------------------------------------------------------------------------------------------------------------------
# Aviatrix Transit & Spoke Gateway Size
# ---------------------------------------------------------------------------------------------------------------------
variable "aws_instance_size" {
  type        = string
  default     = "t2.micro" # HPE "c5.xlarge"
  description = "AWS gateway instance size"
}

variable "azure_instance_size" {
  type        = string
  default     = "Standard_B1ms" # HPE "Standard_D3_v2"
  description = "Azure gateway instance size"
}

variable "gcp_instance_size" {
  type        = string
  default     = "n1-standard-1" # HPE "n1-highcpu-4"
  description = "GCP gateway instance size"
}

# ---------------------------------------------------------------------------------------------------------------------
# Aviatrix Gateway Options
# ---------------------------------------------------------------------------------------------------------------------
variable "hpe" {
  type        = bool
  default     = false
  description = "Insane mode"
}

variable "ha_gw" {
  type        = bool
  default     = true
  description = "Enable HA gateway"
}

variable "enable_segmentation" {
  type        = bool
  default     = false
  description = "Enable segmentation"
}