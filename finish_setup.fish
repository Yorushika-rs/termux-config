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

mkdir ~/.termux
wget -O ~/.termux/HackRegularNerdFontComplete.ttf \
"https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/Hack/Regular/HackNerdFont.ttf"
mv ~/.termux/HackRegularNerdFontComplete.ttf ~/.termux/font.ttf

termux-reload-settings

# 3. Autodestrucción y limpieza
rm (status filename) 
echo "Reload app for apply updates."
