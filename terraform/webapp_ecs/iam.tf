resource "aws_iam_user" "webapp_ecs_user" {
  name = "webapp_ecs_user"
}

resource "aws_iam_user_policy" "webapp_ecs_user_policy_s3" {
  user = aws_iam_user.webapp_ecs_user.id
  policy = data.aws_iam_policy_document.s3_access.json
}

resource "aws_iam_user_policy" "webapp_ecs_user_policy_ecr" {
  user = aws_iam_user.webapp_ecs_user.id
  policy = data.aws_iam_policy_document.ecr_power_user.json
}
