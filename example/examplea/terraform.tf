terraform {
  required_providers {
    aws = {
      version = "3.8.0"
      source  = "hashicorp/aws"
    }

    http = { version = "1.1" }

    template = { version = "2.1" }

    tls = { version = "2.0" }
  }
}
