# ====== PATH ======
if not contains $HOME/.local/bin $PATH
    set -Ux PATH $HOME/.local/bin $HOME/bin $PATH
end

# ====== no greeting ======
set fish_greeting

# ====== conectar VPN ======
function connect_objetiva
    cd ~/Documentos/Pessoal/openvpn; or return
    sudo openvpn --config objetiva-arthur.cruz.ovpn
end

# ====== conectar VPN fedora-server aka fedorento server ======
function connect_fedora_server
    sudo systemctl enable --now tailscaled
end

# ====== desconectar VPN fedora-server aka fedorento server ======
function disconnect_fedora_server
    sudo systemctl disable --now tailscaled
end

# ====== aliases ======
alias pamcan pacman
alias ls 'eza --icons'
alias clear "printf '\033[2J\033[3J\033[1;1H'"
alias q 'qs -c ii'
alias tty-clock 'tty-clock -c -s -C 6'

alias benchmark "sysbench cpu run; sysbench cpu --threads=8 run"

alias lock "dbus-send --session --dest=org.gnome.ScreenSaver --type=method_call /org/gnome/ScreenSaver org.gnome.ScreenSaver.Lock"

function fish_title
    echo " "
end

function fish_prompt
    set_color green
    printf '%s@%s' $USER (hostname)

    set_color normal
    printf ':'

    set_color blue
    printf '%s' (pwd | sed "s|^$HOME|~|")

    set_color normal
    printf '$ '
end

# ====== Configurações opcionais adicionais ======
# (Caso esteja usando starship e queira ativar ele)
# starship init fish | source
# if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
#     cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
# end
