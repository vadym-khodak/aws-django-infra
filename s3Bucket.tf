resource "aws_s3_bucket" "b" {
  bucket = "static-assets-django-react"
  acl    = "private"
  tags = {
    Name = "Static Assets"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.b.id

  ignore_public_acls = true
  restrict_public_buckets = true
  block_public_acls   = true
  block_public_policy = true
}

resource "aws_s3_bucket_policy" "app_static" {
  bucket = aws_s3_bucket.b.id
  policy = jsonencode({
    Version = "2008-10-17"
    Id      = "PolicyForCloudFrontPrivateContent"
    Statement = [
      {
        Sid = "1"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity ${aws_cloudfront_origin_access_identity.origin_access_identity.id}"
        },
        Action = "s3:GetObject",
        Resource = "${aws_s3_bucket.b.arn}/*"
      }
    ]
  })
}

