provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = var.container_nginx_name
  ports {
    internal = 80
    external = 8000
  }
}

output "container_id" {
  value = docker_container.nginx.id
}

output "ip_address" {
  value = docker_container.nginx.network_data[0].ip_address
}

output "network_data" {
  value = docker_container.nginx.network_data
}
