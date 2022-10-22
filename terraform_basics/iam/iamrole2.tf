
resource "aws_iam_role" "test_role2" {

    name = "test-role2"
    path = "/apps/"
    assume_role_policy = jsonencode(
        {
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