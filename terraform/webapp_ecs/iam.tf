resource "aws_iam_user" "webapp_ecs_user" {
  name = "webapp_ecs_user"
}

resource "aws_iam_user_policy" "webapp_ecs_user_policy_s3" {
  user = aws_iam_user.webapp_ecs_user.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Effect": "Allow",
          "Action": "s3:*",
          "Resource": ["arn:aws:s3:::webapp_ecs_storage"]
      }
  ]
}
EOF
}
