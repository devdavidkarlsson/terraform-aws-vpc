variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_key_path" {}
variable "aws_key_name" {}

variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "eu-west-1"
}

variable "amis" {
    description = "AMIs by region"
    default = {
        eu-west-1 = "ami-f1810f86" # ubuntu 14.04 LTS
    }
}

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/16" 
}


/*
  Public subnets:
*/

variable "public_subnet_cidr_a" {
    description = "CIDR for the Public Subnet in AZ A"
    default = "10.0.32.0/20"
}

variable "public_subnet_cidr_b" {
    description = "CIDR for the Public Subnet in AZ B"
    default = "10.0.96.0/20"
}

variable "public_subnet_cidr_c" {
    description = "CIDR for the Public Subnet in AZ C"
    default = "10.0.160.0/20"
}

/*
  Private subnets:
*/

variable "private_subnet_cidr_a" {
    description = "CIDR for the Private Subnet in AZ A"
    default = "10.0.0.0/19"
}

variable "private_subnet_cidr_b" {
    description = "CIDR for the Private Subnet in AZ B"
    default = "10.0.64.0/19"
}

variable "private_subnet_cidr_c" {
    description = "CIDR for the Private Subnet in AZ C"
    default = "10.0.128.0/19"
}

/*
  Private subnets:
*/
/*
variable "spare_subnet_cidr_a" {
    description = "CIDR for the Private Subnet in AZ A"
    default = "10.0.98.0/20"
}

variable "spare_subnet_cidr_b" {
    description = "CIDR for the Private Subnet in AZ B"
    default = "10.0.112.0/20"
}

variable "spare_subnet_cidr_c" {
    description = "CIDR for the Private Subnet in AZ C"
    default = "10.0.176.0/20"
}
*/
