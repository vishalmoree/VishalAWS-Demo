resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  path = "/system/"
 
  tags = {
    tag-key = "load-balancer"
  }
}

resource "aws_iam_user" "lb1" {
  name = "loadbalancer1"
  path = "/system/"
 
  tags = {
    tag-key = "load-balancer1"
  }
}

resource "aws_iam_policy" "policy" {
  #name        = "Demo-policy"
  #description = "A Demo policy"
  policy      = {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*",
                "s3-object-lambda:*"
            ],
            "Resource": "*"
        }
    ]
}
}


resource "aws_iam_user_policy_attachment" "user_policy_attachment" {
  # group      = aws_iam_group.example_group.name
user = aws_iam_user.lb.name
policy_arn = aws_iam_policy.policy.policy
}

resource "aws_iam_user_policy_attachment" "user_policy_attachment" {
  # group      = aws_iam_group.example_group.name
user = aws_iam_user.lb1.name
policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}
