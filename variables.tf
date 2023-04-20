variable "region" {
  default = "us-east-1"
}

variable "ami" {
  default = "ami-0c55b159cbfafe1f0"
}

variable "instance_type" {
  default = "t4g.small"
}

variable "rds_instance_class" {
  default = "db.t4g.micro"
}

variable "db_name" {
  default = "wordpressdb"
}

variable "db_user" {
  default = "wordpressuser"
}

variable "db_password" {
  default = "password"
}

variable "db_allocated_storage" {
  default = "20"
}

variable "wp_db_name" {
  default = "wordpress"
}

variable "wp_db_user" {
  default = "wpuser"
}

variable "wp_db_password" {
  default = "wppassword"
}
