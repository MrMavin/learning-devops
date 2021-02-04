data "aws_iam_policy_document" "ecr_power_user" {
  statement {
    sid = "1"

    actions = [
      "ecr:DescribeImageScanFindings",
      "ecr:GetLifecyclePolicyPreview",
      "ecr:GetDownloadUrlForLayer",
      "ecr:ListTagsForResource",
      "ecr:UploadLayerPart",
      "ecr:ListImages",
      "ecr:PutImage",
      "ecr:BatchGetImage",
      "ecr:CompleteLayerUpload",
      "ecr:DescribeImages",
      "ecr:DescribeRepositories",
      "ecr:InitiateLayerUpload",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetRepositoryPolicy",
      "ecr:GetLifecyclePolicy",
    ]

    resources = [
      "arn:aws:ecr:${var.region}:${var.user_id}:repository/${var.ecr_registry_name}",
    ]
  }

  statement {
    actions = [
      "ecr:GetAuthorizationToken",
    ]

    resources = [
      "*",
    ]

  }
}

resource "aws_ecr_repository" "webapp_ecs_ecr" {
  name = var.ecr_registry_name
}

// TODO: lifecycle policy
