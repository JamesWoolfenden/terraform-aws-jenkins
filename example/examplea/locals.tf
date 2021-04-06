module "ip" {
  source  = "JamesWoolfenden/ip/http"
  version = "0.3.7"
}

locals {
  ip = module.ip.cidr
}
