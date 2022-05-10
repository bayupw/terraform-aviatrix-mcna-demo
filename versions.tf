terraform {
  required_version = ">= 0.13.1"

  required_providers {
    aviatrix = {
      source  = "aviatrixsystems/aviatrix"
      version = "~>2.21.2"
    }
  }
}