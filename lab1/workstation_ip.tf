####
# Workstation External IP
###

data "http" "workstation_ip" {
  url = "https://ipinfo.io/ip"
}
