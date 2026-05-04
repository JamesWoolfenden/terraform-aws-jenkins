terraform {
  required_providers {


    template = {
      version = "2.2.0"
    source = "hashicorp/template" }

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
  required_version = ">=0.14.8"
}
