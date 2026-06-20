variable "name_prefix" {
  type = string
}

resource "terraform_data" "security_blueprint" {
  input = {
    secrets_store = "vault"
    pki           = "internal_ca"
    encryption    = "storage_and_transport"
  }
}
