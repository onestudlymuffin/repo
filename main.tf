

variable "length" {}

resource "random_pet" "name" {
 length    = var.length
 separator = "-"
}

resource "null_resource" "helloWorld1" {
  provisioner "local-exec" {
    command = "echo foo/Hello ${random_pet.name.id}"
  }
}

resource "null_resource" "helloWorld2" {
  provisioner "local-exec" {
    command = "echo foo/Hello ${random_pet.name.id}"
  }
}

resource "random_id" "random" {
  keepers {
    uuid = "${uuid()}"
  }

  byte_length = 8
}

output "random" {
  value = "${random_id.random.hex}"
}
