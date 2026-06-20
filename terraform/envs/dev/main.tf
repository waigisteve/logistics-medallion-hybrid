module "platform" {
  source = "../../"

  environment     = "dev"
  project_name    = var.project_name
  platform_target = var.platform_target
}

variable "project_name" {
  type    = string
  default = "logistics-medallion"
}

variable "platform_target" {
  type = string
}
