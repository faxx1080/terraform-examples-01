output "s3_bucket_arn" {
  value = aws_s3_bucket.example.arn
}

output "lambda_function_arn" {
  value = aws_lambda_function.example.arn
}

output "ec2_instance_arn" {
  value = aws_instance.example.arn
}

output "ec2_instance_public_ip" {
  value = aws_instance.example.public_ip
}
