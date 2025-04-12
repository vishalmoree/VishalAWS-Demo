resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  path = "/system/"
 
  tags = {
    tag-key = "load-balancer"
  }
}

resource "aws_iam_policy" "policy" {
  #name        = "Demo-policy"
  #description = "A Demo policy"
  policy      = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_user_policy_attachment" "user_policy_attachment" {
  # group      = aws_iam_group.example_group.name
user = aws_iam_user.lb.name
policy_arn = aws_iam_policy.policy.policy
}