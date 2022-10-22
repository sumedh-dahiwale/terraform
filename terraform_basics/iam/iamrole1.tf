
resource "aws_iam_role" "test_role1" {

    name = "test-role1"
    path = "/apps/"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Sid = ""
                Principal = {
                    Service = "lambda.amazonaws.com"

                }
            },
        ]
    })

    tags = {
        tag-key = "tag-value"
    } 
}

resource "aws_iam_policy" "test1_policy" {
    name = "test1-policy"
    #path = "/apps/"
    description = "IAM Policy for test1 role"
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action :[
                    "logs:CreateLogGroup"
                ],
                Resource:"arn:aws:logs:*:*:*",
                Effect: "Allow"
            },
        ]
    })
}

resource "aws_iam_role_policy_attachment" "add_policy_test1" {
    role = aws_iam_role.test_role1.id
    policy_arn = aws_iam_policy.test1_policy.arn
  
}