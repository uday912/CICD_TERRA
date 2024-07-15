provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "./modules_ec2instance"
  ami_value = "ami-04a81a99f5ec58529" 
  instance_type_value = "t2.micro"
  subnet_id_value = "subnet-096bbb546694fc83a"
}
