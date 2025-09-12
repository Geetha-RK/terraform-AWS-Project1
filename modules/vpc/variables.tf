variable "vpc_cidr_new" {
    description = "VPC CIDR range"
    type = string
}

variable "subnet_cidr" {
    description = "subnet cidr"
    type = list(string)
}

variable "subnet_names" {
    description = "Subnet names"
    type = list(string)
    default = ["PublicSubnet1","PublicSubnet2"]
}