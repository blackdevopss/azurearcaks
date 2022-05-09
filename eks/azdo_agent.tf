/*
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "keypair" {
  key_name   = "aws-ssh-keypair"
  public_key = var.ssh_public_key
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true
  availability_zone           = aws_subnet.public.availability_zone
  key_name                    = aws_key_pair.keypair.id
  vpc_security_group_ids      = [aws_security_group.remote_access.id]
  iam_instance_profile        = aws_iam_instance_profile.azdo.name

  tags = {
    Name = "vm-azdo-agent-aws"
  }
}
*/