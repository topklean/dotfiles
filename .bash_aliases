alias batcat=bat
alias ls='ls -a --group-directories-first --color=auto'
alias ll='ls -l'

alias ...='cd /'
alias ..='cd ..' 
alias 2..='cd ../..'
alias 3..='cd ../../..'

alias 755='chmod 755'
alias 600='chmod 600'

alias apt='sudo apt'
alias apt-get='sudo apt-get'

alias mkdir='mkdir -pv'

alias h='history'

# alias ps='ps -ef'

alias pfs='printf "%s:"'
alias root='sudo -i'

# alias terra='/home/topklean/Documents/lab/bin/terraform'
# alias twc="/home/topklean/Documents/10_tools/twitch_cli/twitch"

# alias arsenal=/home/topklean/.local/bin/arsenal

alias go_thm="ctfGo t"
alias go_htb="ctfGo h"
alias go_oscp="ctfGo o"
alias go_ctf="ctfGo"
alias xports="extractPorts"
alias xp="extractPorts"
alias ha="hostadd"
alias nng="grepNmapScript"
alias py3w="python3 -m http.server"
alias py2w="python -m SimpleHTTPServer"
alias getlinks='lynx -dump -nonumbers -list_decoded -listonly -hiddenlinks=listonly -unique_urls'
alias getsource='lynx -source'
alias getcontent='lynx -dump -nonumbers -nolist'
alias getrobots="wwwGetRobots"
alias getcomments="wwwGetComment"
alias statusedit="vim /home/topklean/Documents/ctf/status.txt"
alias icat="kitty +kitten icat --align=left"
alias gp=grepport
alias np1="nmap -Pn -n -oG grep"
alias np2='sudo nmap -Pn -n -sCV -O -oN version -p'
alias np3='sudo nmap -Pn -n -sS --open --min-rate 5000 -p- -oN all_normal'
alias ascii='man ascii| grep -m 1 -A 66 --color=never Oct|batcat --style grid,numbers -l vimrc'

alias info='info -v link-style=cyan -v active-link-style=white,bgblue -v match-style=underline,bold,nocolor'
alias __x='[[ $- =~ x ]] && set +x || set -x'
alias _x='__x; ' 
alias _xa='set -x'
alias _xd='set +x'
alias ok="echo ok "
alias ko="echo ko "
alias okko="&& ok || ko "
alias ipraw='rax2 -I 0x'
alias soruso='sort | uniq -c | sort -k1n'
alias vm='vim src/main.rs'
alias vl='vim src/lib.rs'
# alias go=cd
alias go_c="cd ~/Documents/dev/c/"
alias sshkg='ssh-keygen -f "id_rsa_$(for i in {1..5}; do printf "\\$(printf %o $(($RANDOM%26+97)))"; done)" -t rsa -N "" &> /dev/null ||:'
alias wwwHeaders='curl -LI'
alias venv_pwn='source /home/topklean/Documents/00_env/pwn/bin/activate'

alias v=~/.local/nvim-linux64/bin/nvim
alias gh=/usr/bin/ghidra

alias ssh='TERM=xterm-256color ssh'
alias yy='xclip -selection c'
alias pp='xclip -selection c -o'
alias pp='xclip -selection c -o'
alias pp='xclip -selection c -o'
# alias pause='clear; toilet -w 200 -f pagga < <(echo -e "                                  \npause de 10 mins     \n                                  ")'
# alias fzf="fzf -i -m --bind='alt-i:up,alt-k:down'"
# alias fzf='fzf -i --bind=\'alt-i:up,alt-k:down,alt-j:backward-char,alt-l:forward-char\' --height=~50% --reverse --border=rounded --border-label=\"$(lolcat -f<<<$PWD)\" --margin=1,2% --color=dark --preview=\'batcat -l java {+}\''
# alias fzf="fzf -i --bind='alt-i:up,alt-k:down,alt-j:backward-char,alt-l:forward-char' --height=~50% --reverse --border=rounded --margin=1,2% --color=dark"

# mod exec
alias x='chmod u+x'
# python venv
alias manim_acitvate='. ~/venv/manim/bin/activate'
alias hgrep='h|& grep'
# alias pause='Documents/projets/bash/pause/pause_v1.sh'
alias pause='/home/topklean/Documents/projets/pause/i3.sh >& /dev/null'
alias pacman='sudo pacman'
alias feh_pictures='feh -g 1280x720 ~/Pictures'


# grep 
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'

# ip
alias ip='ip --color=auto'

# glava for streaming
alias mic="pkill -f 'polybar.+bas|screenkey'; ( polybar -q bas >&/dev/null & ); (pkill glava; glava -d >&/dev/null &); (pkill screenkey; screenkey &)"
# alias mic='ps aux | grep [p]olybar|grep [b]as|awk "{print \$2}" | xargs -n1 kill -9;( polybar -q bas >&/dev/null & ); (pkill glava; glava -d >&/dev/null &); (pkill screenkey; screenkey &)'
alias mic_off="pkill -f 'polybar.+bas|screenkey'"
