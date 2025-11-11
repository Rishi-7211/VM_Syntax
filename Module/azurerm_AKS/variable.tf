variable "AKS" {
  type = map(object({
    name     = string
    location = string
    rg_name  = string
  }))
}