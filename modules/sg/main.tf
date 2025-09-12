resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Allow HTTP, SSH inbound traffic"
  vpc_id      = var.vpc_id #vpc id passed from the output variable of module-vpc

  tags = {
    Name = "allow_http_ssh"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  description = "HTTP"
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = "0.0.0.0/0" #Public access
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  description = "SSH"
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = "0.0.0.0/0" #Public access - //restrict this for production. This is not safe
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"  #Allow all ip
  # from_port         = 0
  # to_port           = 0
}
