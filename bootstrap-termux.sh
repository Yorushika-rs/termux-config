#!/data/data/com.termux/files/usr/bin/bash
echo "🚀 Bootstrap Yorushika-rs/termux-config - Config Fish completa"

# Update
pkg update -y && pkg upgrade -y

# Paquetes
pkg install -y fish curl git openssh python nodejs npm

# Fisher 
echo "📦 Fisher + plugins..."
curl -fsSL https://git.io/fisher --output fisher.fish
mkdir -p ~/.config/fish/functions
mv fisher.fish ~/.config/fish/functions/
fish -c "source ~/.config/fish/functions/fisher.fish && fisher install jorgebucaran/fisher"
fish -c "fisher install jorgebucaran/autopair.fish PatrickF1/fzf.fish IlanCosman/tide@v5 && fisher update"

# Limpiar
apt autoremove -y

# Sync a .congif/fish
git clone https://github.com/Yorushika-rs/termux-config.git ~/temp-config
cp -r ~/temp-config/.config/fish/ ~/.config/
rm -rf ~/temp-config

# pvenv function
if not grep -q "function pvenv" ~/.config/fish/config.fish 2>/dev/null
    echo '
function pvenv
    set VENV_NAME "venv"
    if test -d "./$VENV_NAME"
        source "./$VENV_NAME/bin/activate.fish"
    else
        python3 -m venv "$VENV_NAME" && source "./$VENV_NAME/bin/activate.fish"
    end
end' >> ~/.config/fish/config.fish
end

chsh -s fish
termux-reload-settings

echo "✅ Finalizado!"

exec fish
