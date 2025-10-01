# Automatically zip lambda_code.py for Lambda deployment
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/lambda_code.py"
  output_path = "${path.module}/lambda_code.zip"
}
# IAM Role for Lambda
resource "aws_iam_role" "lambda_role" {
  name = "lambda_basic_execution"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Lambda Function
resource "aws_lambda_function" "example" {
  function_name = "example_lambda"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_code.lambda_handler"
  runtime       = "python3.13"

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
}
