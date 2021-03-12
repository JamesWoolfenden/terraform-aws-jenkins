terraform {
  required_providers {
    aws = {
      version = "3.32.0"
      source  = "hashicorp/aws"
    }

    http = {
      version = "2.0.0"
    source = "hashicorp/http" }

    template = {
      version = "2.2.0"
    source = "hashicorp/template" }

    tls = { version = "3.0.0"
    source = "hashicorp/tls" }
  }
}
