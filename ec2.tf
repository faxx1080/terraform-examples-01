
# Lookup the latest Amazon Linux 2023 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# EC2 Instance
resource "aws_instance" "example" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  key_name      = "demo"

  vpc_security_group_ids = [
    "sg-065c20ab0ffd0e433",
    "sg-068fcf7f6a127a96a"
  ]

  tags = {
    Name = "TerraformExample"
  }
}
