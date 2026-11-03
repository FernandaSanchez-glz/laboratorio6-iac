terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nginx" {
  name = var.imagen_nginx
}

resource "docker_container" "servidor_lab" {
  name  = var.nombre_contenedor
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = var.puerto_externo
  }
}
