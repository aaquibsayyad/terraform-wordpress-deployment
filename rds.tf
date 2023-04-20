resource "aws_db_instance" "rds_instance" {
  engine               = "mysql"
  instance_class       = var.rds_instance_class
  name                 = var.db_name
  username             = var.db_user
  password             = var.db_password
  allocated_storage    = var.db_allocated_storage
  storage_type         = "gp2"
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}
