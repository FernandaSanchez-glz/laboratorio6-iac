output "nombre_contenedor" {
  description = "Nombre del contenedor creado"
  value       = docker_container.servidor_lab.name
}

output "id_contenedor" {
  description = "Identificador del contenedor"
  value       = docker_container.servidor_lab.id
}

output "puerto_acceso" {
  description = "Puerto externo del servidor Nginx"
  value       = "http://localhost:8082"
}
