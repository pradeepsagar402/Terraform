module "webserver" {
  source = "./ec2"
  ami = "ami-0f918f7e67a3323f0"
  instancetype = "t2.micro"
  tags = {
        "Name" = "Sample-Server"
        "Managed_by" = "Terraform"
        "Created_by" = "local_module"
    }
  secuirity_group_rules =   { "ssh" = {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      }, "http" = {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }
}