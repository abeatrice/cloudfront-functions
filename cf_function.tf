resource "aws_cloudfront_function" "abeatrice-hey-cf-func-viewer-request" {
  name = "abeatrice-hey-cf-func-viewer-request"
  runtime = "cloudfront-js-1.0"
  publish = true
  code = file("${path.module}/viewer-request/index.js")
}

resource "aws_cloudfront_function" "abeatrice-hey-cf-func-viewer-response" {
  name = "abeatrice-hey-cf-func-viewer-response"
  runtime = "cloudfront-js-1.0"
  publish = true
  code = file("${path.module}/viewer-response/index.js")
}
