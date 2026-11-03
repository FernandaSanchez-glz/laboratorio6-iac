variable "nombre_contenedor" {
  description = "Nombre del contenedor Docker"
  type        = string
  default     = "servidor-lab"
}

variable "imagen_nginx" {
  description = "Imagen de Nginx utilizada"
  type        = string
  default     = "nginx:alpine"
}

variable "puerto_externo" {
  description = "Puerto externo para acceder al servidor"
  type        = number
  default     = 8082
}
