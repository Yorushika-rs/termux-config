# 1. Gestión de plugins
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
fisher install jorgebucaran/autopair.fish PatrickF1/fzf.fish ilancosman/tide@v6

# 2. Inyección de configuración
# Uso una sola línea para evitar múltiples lecturas al disco
set -l config_path ~/.config/fish/config.fish
test -f $config_path; or touch $config_path

for line in "source ~/.aliases"
    grep -q "$line" $config_path; or echo "$line" >> $config_path
end

# 3. Autodestrucción y limpieza
rm (status filename) 
echo "Entorno listo."
