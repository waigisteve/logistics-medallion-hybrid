variable "project_name" {
  type    = string
  default = "logistics-medallion"
}

variable "environment" {
  type = string
}

variable "platform_target" {
  type    = string
  default = "vsphere_or_kubernetes"
}
