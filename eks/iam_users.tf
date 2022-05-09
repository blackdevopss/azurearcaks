# Creates an IAM user for ADO to connect as - e.g., Authentication
resource "aws_iam_user" "ado_iam_user" {
  name = "terraform"
  path = "/"

  tags = {
    BuiltBy = "Terraform"
  }
}

# Create IAM policy for the ADO IAM user
resource "aws_iam_policy" "ado_iam_policy" {
  name = "terraform"

  policy = <<POLICY
{
  "Version": "2012-10-17",

  "Statement": [
    {
      "Sid": "AllowAllPermissions",
      "Effect": "Allow",
      "Action": [
        "*"
      ],
      "Resource": "*"
    }
  ]
}
POLICY
}

# Attach IAM assume role to User
resource "aws_iam_user_policy_attachment" "iam_user_assume_attach" {
  user       = aws_iam_user.ado_iam_user.name
  policy_arn = aws_iam_policy.ado_iam_policy.arn
}