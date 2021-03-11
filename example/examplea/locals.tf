data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

locals {
  ip = chomp(data.http.myip.body) / 32
}
