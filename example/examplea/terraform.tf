terraform {
  required_providers {
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.2.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "6.43.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.5.0"
    }
  }
  required_version = ">=1.5"

  # local state is intentional for this example; use a remote backend in real deployments
  backend "local" {}
}
