output "container_id" {
  description = "Olusturulan konteynerin ID bilgisi"
  value       = docker_container.nginx.id
}

output "image_id" {
  description = "Kullanilan imajin ID bilgisi"
  value       = docker_image.nginx.id
}

output "access_url" {
  description = "Tarayicidan erisim adresi"
  value       = "http://localhost:${var.external_port}"
}
