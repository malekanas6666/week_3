#creat user with name (mostafa)
resource "aws_iam_user" "mostafa_iam" {
  name = "Mostafa"
}

resource "aws_iam_access_key" "lb" {
  user = aws_iam_user.mostafa_iam.name
}

data "aws_iam_policy_document" "mos_doc" {
  statement {
    effect    = "Allow"
    actions   = ["s3:PutObject*"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "mostafa_ro" {
  name   = "mostafa_con"
  user   = aws_iam_user.mostafa_iam.name
  policy = data.aws_iam_policy_document.mos_doc.json
}



resource "aws_iam_user" "Taha_iam" {
  name = "Taha"
}

resource "aws_iam_access_key" "taha" {
  user = aws_iam_user.Taha_iam.name
}

data "aws_iam_policy_document" "tah_doc" {
  statement {
    effect    = "Allow"
    actions   = ["s3:GetObject*" ,
                 "s3:ListBucket",]
    
      resources=[ aws_s3_bucket.bucket3.arn,"${aws_s3_bucket.bucket3.arn}/*"]
   condition {
   test     = "StringLike"
   variable = "s3:prefix"

   values = [
     "log/",
   ]
}
}
}
 resource "aws_iam_user_policy" "taha-ro" {
  name   = "taha_con"
  user   = aws_iam_user.Taha_iam.name
  policy = data.aws_iam_policy_document.tah_doc.json
}
