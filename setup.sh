#!/data/data/com.termux/files/usr/bin/bash

pkg update -y && pkg upgrade -y
pkg install -y git fish python curl wget fzf proot

TEMP_DIR=$(mktemp -d)
git clone --depth 1 https://github.com/Yorushika-rs/termux-config.git "$TEMP_DIR"

mkdir -p ~/.config/fish
cp -r "$TEMP_DIR/fish/"* ~/.config/fish/
cp "$TEMP_DIR/.aliases" ~/.aliases

# Copia el script de finalización a la raíz (~)
cp "$TEMP_DIR/fish/finish_setup.fish" ~/finish_setup.fish

rm -rf "$TEMP_DIR"

chsh -s fish

echo "Fase 1 completa. Ahora entra en fish y ejecuta: source ~/finish_setup.fish"
