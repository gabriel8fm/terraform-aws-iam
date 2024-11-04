resource "aws_iam_role" "iam_role" {
  name               = var.role_name
  assume_role_policy = var.assume_role_policy  # Dynamic assume role policy
}

resource "aws_iam_policy_attachment" "attach_admin_policy_to_role" {
  name       = "attach-admin-policy-to-role"
  roles      = [aws_iam_role.tech_interview_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group" "iam_group" {
  name = var.group_name
}

resource "aws_iam_user" "iam_user" {
  name = var.user_name
}

resource "aws_iam_access_key" "iam_access_key" {
  user = aws_iam_user.iam_user.name
}

resource "aws_iam_user_group_membership" "iam_user_group_membership" {
  user   = aws_iam_user.iam_user.name
  groups = [aws_iam_group.iam_group.name]
}

resource "aws_iam_group_policy_attachment" "attach_admin_policy_to_group" {
  group      = aws_iam_group.iam_group.name
  policy_arn = var.policy_arns[count.index]
}
