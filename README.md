# Cloudfront functions example

set a visitor_id request/reponse cookie to track users with cloudfront viewer request and viewer response functions

## Documents
[Cloudfront Functions](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/cloudfront-functions.html)

## Deployment

You will need aws console credentials in the ~/.aws/credentials file. Terraform will create a cloudfront distribution, two cloudfront functions, and two s3 buckets. You will need to place a public init.html file in the origin bucket.

```sh
$ terraform init
$ terraform apply
```
