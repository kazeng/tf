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