variable "compartment_ocid" {}
variable "region" {}
variable "display_name_prefix" {}

variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
  default = "ami-test"

  # Variable validation is part of v13 and later
  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}

resource "null_resource" "basic" {
  provisioner "local-exec" {
    command = "echo 1"
  }
}

resource "random_string" "password" {
  length = 16
  special = true
  override_special = "/@\" "
}

resource "time_static" "example" {}

data "http" "example" {
  url = "https://oracle.com"

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }
}

resource "tls_private_key" "example" {
  algorithm = "ECDSA"
}

provider "archive" {}


data "template_file" "init" {
  template = "invalid"
}

output "private_key" {
  value     = tls_private_key.example.private_key_pem
  sensitive = true
}
