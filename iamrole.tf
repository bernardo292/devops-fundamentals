# Create an IAM Role
resource "aws_iam_role" "instance_role" {
  name               = "my-instance-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json

  # Define the Assume Role Policy Document (for the Role)
  data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions   = ["sts:AssumeRole"]
    resources = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  }
}

# Create IAM Policy (The policy is read via external json file)
resource "aws_iam_policy" "instance_policy" {
  name        = "my-instance-policy"
  description = "A sample policy"

   # Define Policy JSON or use policy
   policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:ListBucket",
        "s3:GetObject"
      ],
      "Resource": [
        "arn:aws:s3:::my-instance-bucket",
        "arn:aws:s3:::my-instance-bucket/*"
      ]
    }
  ]
}
POLICY
}

# Attach the IAM Policy to the Role
resource "aws_iam_policy_attachment" "my_policy_attachment" {
  name       = "my-policy-attachment"
  policy_arn = aws_iam_policy.instance_policy.arn
  roles      = [aws_iam_role.instance_role.name]
}