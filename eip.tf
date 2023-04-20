resource "aws_eip" "wordpress_eip" {
  instance = aws_instance.web.id
  vpc      = true

  tags = {
    Name = "wordpress-eip"
  }
}
