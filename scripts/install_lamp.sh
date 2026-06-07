#!/bin/bash
#-e: Finaliza el script cuando hay error
#-x: Muestra el comando por pantalla
set -ex

# Actualizamos repositorios y paquetes
apt update
apt upgrade -y

# Instalamos apache y mysql server
apt install apache2 -y
apt install mysql-server -y

# Instalamos php y módulos (he añadido curl, xml y mbstring que usa WP-CLI por debajo)
apt install php libapache2-mod-php php-mysql php-curl php-xml php-mbstring -y

# Activamos el módulo rewrite (CRÍTICO para los enlaces permanentes)
a2enmod rewrite

# Copiamos el archivo de configuracion de apache
cp ../conf/000-default.conf /etc/apache2/sites-available/000-default.conf

# Reiniciamos apache para aplicar mod_rewrite y el VirtualHost
systemctl restart apache2