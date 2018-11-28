provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.aws_region}"
}

resource "aws_instance" "testmachine" {
  ami = "ami-009d6802948d06e52"
  instance_type = "t2.micro"
  key_name = "ec2_key"
  vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
  tags {
    Name = "testmachine",
    Owner = "Roshan Sawant"
  }
}

output "instance_out" {
  value = "${aws_instance.testmachine.public_ip}"
}