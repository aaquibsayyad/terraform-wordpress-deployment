# Create an EC2 instance
resource "aws_instance" "wordpress" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t4g.small"
  key_name      = var.key_name

  # Attach the security group
  vpc_security_group_ids = [aws_security_group.wordpress.id]

  # Define the user data script to install Docker and launch WordPress
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install docker
              sudo service docker start
              sudo usermod -aG docker ec2-user
              sudo docker run -d -p 80:80 --name wordpress --restart always wordpress:latest
              EOF

  # Define the connection settings
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }
}

# Create an elastic IP
resource "aws_eip" "wordpress" {
  vpc      = true
  instance = aws_instance.wordpress.id
}

# Associate the elastic IP with the EC2 instance
resource "aws_eip_association" "wordpress" {
  instance_id   = aws_instance.wordpress.id
  allocation_id = aws_eip.wordpress.id
}
