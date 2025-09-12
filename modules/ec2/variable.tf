variable "sg_id" {
  type = string
  description="SG id for EC2"
}

variable "subnets" {
    description = "Subnets for EC2"
    type = list(string)
}

variable "ec2_names"{
    description = "EC2 names"
    type = list(string)
    default = [ "Webserver1","Webserver2" ]
}