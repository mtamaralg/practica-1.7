# Práctica: Despliegue Automatizado de WordPress con WP-CLI y Let's Encrypt

## 📖 Descripción General
Este repositorio contiene una solución de infraestructura como código (IaC) basada en Bash para automatizar el despliegue de un sitio web WordPress seguro. 

El proceso configura desde cero una pila **LAMP** (Linux, Apache, MySQL, PHP), despliega WordPress utilizando su interfaz de línea de comandos (**WP-CLI**), configura los enlaces permanentes (Permalinks), instala plugins de seguridad y, finalmente, asegura el tráfico mediante un certificado SSL/TLS gratuito de **Let's Encrypt**.

## 📂 Estructura del Repositorio

* **`conf/`**: Configuración del servidor web.
  * `000-default.conf`: VirtualHost de Apache base, preparado con `AllowOverride ALL` para permitir la reescritura de URLs de WordPress.
* **`htaccess/`**: Reglas del servidor.
  * `.htaccess`: Reglas de reescritura estándar de WordPress para habilitar URLs amigables.
* **`php/`**: Archivos de prueba.
  * `index.php`: Script con la función `phpinfo()` para validar el correcto funcionamiento de PHP.
* **`scripts/`**: Ejecutables de automatización.
  * `.env`: Centraliza las credenciales de la base de datos, los datos del administrador de WordPress y el dominio público.
  * `install_lamp.sh`: Instala los paquetes del sistema (Apache, MySQL, PHP y extensiones necesarias), habilita `mod_rewrite` y aplica la configuración base.
  * `deploy_wordpress_with_wpcli.sh`: Descarga WP-CLI, configura la base de datos, instala WordPress, ajusta los *permalinks*, instala el plugin `wps-hide-login` para ocultar la ruta de administración y corrige los permisos del sistema de archivos.
  * `setup_letsencrypt_https.sh`: Instala Certbot mediante Snap, inyecta el dominio en el VirtualHost y solicita el certificado SSL para forzar la navegación por HTTPS.

## ⚙️ Configuración Previa

Antes de lanzar los scripts, es obligatorio revisar el archivo `scripts/.env` y asegurarse de que el dominio apunta correctamente a la IP pública del servidor:

```env
CERTBOT_EMAIL=tu_correo@ejemplo.com
CERTBOT_DOMAIN=practica7DAW.ddns.net
URL_HIDE_LOGIN=secreto

```

IMAGENES

sudo ./install_lamp.sh
<img width="1588" height="625" alt="Primera cap 1 7" src="https://github.com/user-attachments/assets/bf340a1a-7a58-4bde-9e65-6d70daea1055" />

sudo ./deploy_wordpress_with_wpcli.sh
<img width="1586" height="629" alt="Segunda cap 1 7" src="https://github.com/user-attachments/assets/cec67ba8-e694-4f5e-a753-3379297f705f" />

sudo ./setup_letsencrypt_https.sh
<img width="1571" height="627" alt="Tercera cap 1 7" src="https://github.com/user-attachments/assets/5f9e86da-fc84-4fc9-8315-4ba697dc2fc0" />

Escribimos en el navegador https://practica7DAW.ddns.net
<img width="1910" height="1019" alt="Cuarta cap 1 7" src="https://github.com/user-attachments/assets/602c7504-e4d0-4c92-aa44-a90768766f59" />

Escribimos lo mismo pero le añadimos /secreto https://practica7DAW.ddns.net/secreto
<img width="1917" height="1013" alt="Quinta cap 1 7" src="https://github.com/user-attachments/assets/dc9b59cb-f6d5-4edf-90a3-779804626b48" />

Escribimos lo mismo pero cambiamos /secreto por /wp-admin
<img width="1911" height="1009" alt="Sexta cap 1 7" src="https://github.com/user-attachments/assets/69225d1a-3fcc-4d71-a501-dc159e700a41" />
