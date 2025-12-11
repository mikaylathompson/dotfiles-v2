alias rezsh='. ~/.zshrc'

alias la='ls -lAh'

alias gs='git status'
alias gcob='git checkout -b'

alias zzz='pmset sleepnow'
alias zzzscreen='pmset displaysleepnow'
alias slime='open -a "Sublime Text"'

# Requires the homebrew package exa (NOW NAMED eza)
alias exat='eza -T -L 2'
alias exatt='eza -T -L 3'
alias exattt='eza -T -L 4'
alias exatttt='eza -T'
alias lx='eza -al'

function makegif(){ ffmpeg -i $@ -s 600x400 -pix_fmt rgb8 -r 10 -f gif - | gifsicle --optimize=3 --delay=4 > "$@.gif" }
