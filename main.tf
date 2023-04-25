
// our controller can only run on ECS
data "aws_iam_policy_document" "controller_assume_role_policy" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "controller" {
  statement {
    sid    = "Controller IAM Policy"
    effect = "Allow"
    actions = [
      "s3:ListBucket",
      "s3:ListAllMyBuckets"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "controller" {
  name   = "controller"
  path   = "/jenkins/"
  policy = data.aws_iam_policy_document.controller.json
}

resource "aws_iam_role" "controller" {
  name               = "controller"
  path               = "/jenkins/"
  assume_role_policy = data.aws_iam_policy_document.controller_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "controller" {
  role       = aws_iam_role.controller.name
  policy_arn = aws_iam_role.controller.arn
}
