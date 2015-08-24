#Mount the shared folders
alias mountrpshare='sudo mount.cifs //GREGORI/RPGs /home/avery/Documents/rpgShare/ -o user=anne'
alias mountshome='sudo mount.cifs //GREGORI/shome/ /home/avery/shome/ -o user=Anne'
alias winmount='sudo mount /dev/sda5 /mnt/windows/'

#Launch in background
alias bgl='screen -d -m'

#logout
alias logout='cinnamon-session-quit --logout'

alias sai='sudo apt-get install'
alias ls.='ls -d .*'
alias dwmcomp='sudo make clean install'

#alias vim='vim'

alias edc='vim ~/dwmSrc/config.h'
alias ebr='vim ~/.bashrc'
alias eba='vim ~/.bash_aliases'
alias evr='vim ~/.vimrc'
alias etr='vim ~/.config/termite/config'

alias sbr='source ~/.bashrc'

#volume
alias vol='amixer sset Master'

alias please='sudo !!'
alias godot='~/Documents/games/godot/bin/godot.x11.tools.64'

# network
alias restartwifi='nmcli nm wifi off; sleep 1s; nmcli nm wifi on'

alias def=sdcv

# not really disk guess, but similar
alias disk_guess='du -hs * | sort -h'

alias t123="echo 't123'"
