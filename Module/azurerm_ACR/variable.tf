variable "ACR" {
  type = map(object({
    name              = string
    rg_name           = string
    location          = string
    environment       = string
    tags              = map(string)
    replica_locations = list(string)
  }))
}


