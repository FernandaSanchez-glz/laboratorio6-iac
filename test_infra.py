import json
import subprocess
from urllib.request import urlopen

NOMBRE = "servidor-lab"
URL = "http://localhost:8083"

# Verificar que el contenedor existe
resultado = subprocess.run(
    ["docker", "inspect", NOMBRE],
    capture_output=True,
    text=True,
    check=True
)

contenedor = json.loads(resultado.stdout)[0]

# Verificar que está en ejecución
assert contenedor["State"]["Running"], "El contenedor no está activo"

# Verificar el puerto publicado
puertos = contenedor["NetworkSettings"]["Ports"]
assert puertos["80/tcp"][0]["HostPort"] == "8083", "Puerto incorrecto"

# Verificar respuesta HTTP
with urlopen(URL, timeout=5) as respuesta:
    contenido = respuesta.read().decode("utf-8")
    assert respuesta.status == 200
    assert "Welcome to nginx" in contenido

print("PRUEBA FUNCIONAL APROBADA")
print("Contenedor activo, puerto correcto y Nginx respondiendo.")
