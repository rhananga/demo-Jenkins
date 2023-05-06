# provider.tf
provider "aws" {
  region = "us-east-1"
  #access_key = var.access_key
  #secret_key = var.secret_key
}

# main.tf
resource "aws_vpc" "testvpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "testsubnet" {
  vpc_id     = aws_vpc.testvpc.id
  cidr_block = "10.0.1.0/24"
}
