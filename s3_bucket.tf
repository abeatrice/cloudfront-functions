resource "aws_s3_bucket" "abeatrice-hey-s3-origin" {
  bucket = "abeatrice-hey-s3-origin"
  acl = "public-read"
}

resource "aws_s3_bucket" "abeatrice-hey-cf-access-logs" {
  bucket = "abeatrice-hey-cf-access-logs"
}

resource "aws_s3_bucket_object" "abeatrice-hey-s3-origin-object" {
  bucket = aws_s3_bucket.abeatrice-hey-s3-origin.id
  key    = "index.html"
  source = "index.html"
  content_type = "text/html"
  acl = "public-read"
  etag = filemd5("index.html")
}
