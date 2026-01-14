variable "container_name" {
  description = "Docker konteynerinin ismi"
  type        = string
  default     = "tutorial_nginx"
}

variable "image_name" {
  description = "Kullanilacak Docker imaji"
  type        = string
  default     = "nginx:latest"
}

variable "internal_port" {
  description = "Konteyner icindeki port"
  type        = number
  default     = 80
}

variable "external_port" {
  description = "Disaridan erisilecek port (Localhost)"
  type        = number
  default     = 8000
}
