provider "docker" {}

resource "docker_image" "wordpress" {
  name         = "wordpress:latest"
  keep_locally = false
}

resource "docker_container" "wordpress" {
  name  = "wordpress"
  image = docker_image.wordpress.latest
  ports {
    internal = 80
    external = 80
  }
  restart = "always"
  env = [
    "WORDPRESS_DB_HOST=${aws_rds_instance.mysql.address}",
    "WORDPRESS_DB_USER=wordpress",
    "WORDPRESS_DB_PASSWORD=${aws_rds_cluster_instance.mysql.password}",
    "WORDPRESS_DB_NAME=wordpress",
  ]
}
