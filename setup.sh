#!/bin/bash

# Script para instalar Regolith Desktop en Ubuntu

# 1. Registrar la clave pública de Regolith
echo "Registrando la clave pública de Regolith..."
wget -qO - https://regolith-desktop.org/regolith.key | \
gpg --dearmor | sudo tee /usr/share/keyrings/regolith-archive-keyring.gpg > /dev/null

# 2. Añadir la URL del repositorio a apt
echo "Añadiendo el repositorio de Regolith..."
echo deb "[arch=amd64 signed-by=/usr/share/keyrings/regolith-archive-keyring.gpg] \
https://regolith-desktop.org/release-3_2-ubuntu-noble-amd64 noble main" | \
sudo tee /etc/apt/sources.list.d/regolith.list

# 3. Actualizar apt e instalar Regolith
echo "Actualizando apt e instalando Regolith..."
sudo apt update
sudo apt install -y regolith-desktop regolith-session-flashback regolith-look-lascaille

# 4. Reiniciar el sistema
echo "Instalación completa. Reiniciando el sistema..."
sudo reboot
