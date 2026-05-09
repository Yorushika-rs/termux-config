# 1. Gestión de plugins
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
fisher install jorgebucaran/autopair.fish PatrickF1/fzf.fish ilancosman/tide@v6

# 2. Inyección de configuración
set -l config_path ~/.config/fish/config.fish
test -f $config_path; or touch $config_path

for line in "source ~/.aliases"
    grep -q "$line" $config_path; or echo "$line" >> $config_path
end

fisher update

# 3. Descargas Fuentes para iconos
mkdir ~/.termux
mkdir ~/tmp-font
wget -O ~/tmp-font/Hack.zip \
"https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip"
unzip -j ~/tmp-font/Hack.zip \
"Hack Regular Nerd Font Complete.ttf" \
-d ~/.termux/

# 4. Mover y renombrar archivo ttf
mv ~/.termux/"Hack Regular Nerd Font Complete.ttf" ~/.termux/font.ttf

# 5. Recarga de settings
termux-reload-settings

# 6. Autodestrucción y limpieza
rm -rf ~/tmp-font
rm (status filename)
echo "Reload app for apply updates."
