################
# Matt defined #
################

#> Data section
LAZY_CONFIG=$HOME/.config/lazygit/config.yml
LAZYGIT_THEME=$HOME/Documents/themes/lazygit/themes-mergable/mocha/lavender.yml

#> Quality of Life
alias cls=clear
alias q=exit
alias clip="xclip -selection clip"
alias dot="cd ~/.dotfiles/"

#> Programs
alias ls="eza --color=always --icons"
alias bat=batcat
alias cat=batcat
alias lg="lazygit --use-config-file='$LAZY_CONFIG,$LAZYGIT_THEME'"
alias glow=$HOME/Documents/glow/glow
alias dn=dotnet
alias csc="dotnet /home/matt/.local/programs/dotnet-sdk-9.0.102/sdk/9.0.102/Roslyn/bincore/csc.dll"
alias rkdv=/home/matt/foss/armbian-rk322x-tv-box-linux/rkdeveloptool/rkdeveloptool
alias hyf=hyfetch

#> Scripts
alias set-wallpaper="bash /home/matt/dev/bash/scripts/wallpaper-looper/set-wallpaper.sh"

#> Git
alias gs="git s"
alias glg="git lg"

# Default aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
