resource "null_resource" "example_shell" {

  depends_on = [aws_instance.example, aws_lambda_function.example, aws_s3_bucket.example]

  provisioner "local-exec" {
    command = "echo hello world && echo `uname -a`"
  }
}
