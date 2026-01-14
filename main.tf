terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = var.image_name # Degiskenden geliyor
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = var.container_name # Degiskenden geliyor

  ports {
    internal = var.internal_port # Degiskenden geliyor
    external = var.external_port # Degiskenden geliyor
  }
  volumes {
    # path.module = main.tf dosyasının olduğu klasör demektir.
    # abspath = Tam dosya yolunu (C:/Users/... veya /home/atlas/...) bulur.
    host_path      = abspath("${path.module}/index.html")
    container_path = "/usr/share/nginx/html/index.html"
  }
}
