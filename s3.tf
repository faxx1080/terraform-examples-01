# S3 Bucket
resource "aws_s3_bucket" "example" {
  bucket = "my-terraform-sample-bucket-djfbgisahdbf-123456"
  force_destroy = true
}

# S3 Object Upload Example
resource "aws_s3_object" "example_upload" {
  bucket = aws_s3_bucket.example.id
  key    = "sample_file.txt"
  source = "sample_file.txt"
  etag   = filemd5("sample_file.txt")
}

