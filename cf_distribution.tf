locals {
    s3_origin_id = "abeatriceHeyS3Origin"
}

resource "aws_cloudfront_origin_access_identity" "abeatrice-hey-cf-origin-access-identity" {
}

resource "aws_cloudfront_distribution" "abeatrice-hey-cloudfront-distribution" {
  origin {
    domain_name = aws_s3_bucket.abeatrice-hey-s3-origin.bucket_regional_domain_name
    origin_id = local.s3_origin_id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.abeatrice-hey-cf-origin-access-identity.cloudfront_access_identity_path
    }
  }

  enabled = true
  is_ipv6_enabled = true
  default_root_object = "index.html"

  logging_config {
    bucket = aws_s3_bucket.abeatrice-hey-cf-access-logs.bucket_regional_domain_name
    prefix = "staging"
    include_cookies = true
  }

  default_cache_behavior {
    allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl = 0
    default_ttl = 0
    max_ttl = 0

    function_association {
      event_type = "viewer-request"
      function_arn = aws_cloudfront_function.abeatrice-hey-cf-func-viewer-request.arn
    }

    function_association {
      event_type = "viewer-response"
      function_arn = aws_cloudfront_function.abeatrice-hey-cf-func-viewer-response.arn
    }
  }

  price_class = "PriceClass_200"

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations = ["US", "CA"]
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
