// SECURITY GROUPS
resource "aws_security_group" "remote_access" {
  name        = "SG-Allow-RemoteRDPSSH"
  description = "SG-Allow-RemoteRDPSSH"
  vpc_id      = aws_vpc.eks.id

  ingress {
    description = "SG-Allow-SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ip_white_list]
  }

  ingress {
    description = "SG-Allow-RDP"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = [var.ip_white_list]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG-Allow-SSH_RDP"
  }
}

// EKS
resource "aws_security_group" "eks" {
  name        = "SG-EKS-NodesGroup"
  description = "SG-EKS-NodesGroup"
  vpc_id      = aws_vpc.eks.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG-EKS-NodesGroup"
  }
}
