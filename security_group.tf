resource "aws_vpc" "testvpc" {
  cidr_block = "10.20.0.0/24"
}

resource "aws_subnet" "main" {
  vpc_id     = "${aws_vpc.testvpc.id}"
  cidr_block = "10.20.1.0/24"

  tags {
    Name = "Main"
  }
}
resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id = "${aws_vpc.testvpc.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "allow_all"
  }
}