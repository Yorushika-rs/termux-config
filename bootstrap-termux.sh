#!/data/data/com.termux/files/usr/bin/bash

# 1. Instalación de paquetes
pkg update -y && pkg upgrade -y
pkg install -y git fish python curl wget

# 2. Configuración de Shell
chsh -s fish

# 3. Clonación de configuración
TEMP_DIR=$(mktemp -d)
git clone --depth 1 https://github.com/Yorushika-rs/termux-config.git "$TEMP_DIR"

# 4. Desplegar archivos
mkdir -p ~/.config/fish
cp -r "$TEMP_DIR/fish/"* ~/.config/fish/
cp "$TEMP_DIR/.aliases" ~/.aliases

# 5. Vincular alias
echo "source ~/.aliases" >> ~/.config/fish/config.fish

# 6. Instalar Fisher y sincronizar plugins (Corrección de error de source)
fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update"

# Limpieza
rm -rf "$TEMP_DIR"

echo "Instalación completada con Fisher."
