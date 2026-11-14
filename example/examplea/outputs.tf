output "ip" {
  description = "CIDR of the caller's public IP, allowed to reach Jenkins"
  value       = local.ip
}
