#cloud-config
hostname: ${hostname}
fqdn: ${hostname}
manage_etc_hosts: false
runcmd:
- echo `ifconfig | grep -A 1 eth0 | awk 'NR==2 { print $2 }'` ${hostname} >> /etc/hosts
