output "wordpress_public_ip" {
  value = aws_eip.wordpress_eip.public_ip
}
