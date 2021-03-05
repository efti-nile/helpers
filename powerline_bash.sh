# # 
# "Enable" powerline
if [ -d "$HOME/.local/bin" ]; then
        PATH="$HOME/.local/bin:$PATH"
fi

# #
# Enable powerline for bash
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh
