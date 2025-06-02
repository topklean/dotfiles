#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# HISTORY
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# ignore this command
HISTIGNORE="bg:fg"
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=20000

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# espace insecable non inséré après pipe
# altgr+| suivi de espace, parfois espace
#
setxkbmap -option "nbsp:none"

# PROMPT
# blank line before exe the command => detach result from the prompt
PS0='\n'

# SOME COLORS
#NORMAL COLORS
RESET='\[\e[0;0m\]'
BLACK='\[\e[30m\]'
RED='\[\e[31m\]'
GREEN='\[\e[32m\]'
YELLOW='\[\e[33m\]'
BLUE='\[\e[34m\]'
MAGENTA='\[\e[35m\]'
CYAN='\[\e[36m\]'
WHITE='\[\e[37m\]'
#BRIGHT
BRIGHT_BLACK='\[\e[90m\]'
BRIGHT_RED='\[\e[91m\]'
BRIGHT_GREEN='\[\e[92m\]'
BRIGHT_YELLOW='\[\e[93m\]'
BRIGHT_BLUE='\[\e[94m\]'
BRIGHT_MAGENTA='\[\e[95m\]'
BRIGHT_CYAN='\[\e[96m\]'
BRIGHT_WHITE='\[\e[97m\]'

# PERSONNAL
BLUE_8B_21='\[\e[38;5;21m\]'
BLUE_8B_27='\[\e[38;5;27m\]'
BLUE_8B_33='\[\e[38;5;33m\]'
BLUE_8B_39='\[\e[38;5;39m\]'
BLUE_8B_45='\[\e[38;5;45m\]'
BLUE_8B_69='\[\e[38;5;69m\]'
BLUE_8B_75='\[\e[38;5;75m\]'
CYAN_8B_81='\[\e[38;5;81m\]' # this one
GREEN_8B_41='\[\e[38;5;43m\]'
GREEN_8B_47='\[\e[38;5;47m\]'
GREEN_8B_70='\[\e[38;5;70m\]'
GREEN_8B_82='\[\e[38;5;82m\]'
BLUE_8B_PURPLE_105='\[\e[38;5;105m\]'
WHITE_8B_255='\e[38;5;255m\]'
GRAY_8B_239='\[\e[38;5;239m\]'
GRAY_8B_240='\[\e[38;5;240m\]'
GRAY_8B_241='\[\e[38;5;241m\]'
GRAY_8B_242='\[\e[38;5;242m\]'
GRAY_8B_243='\[\e[38;5;243m\]'
GRAY_8B_244='\[\e[38;5;244m\]'
GRAY_8B_245='\[\e[38;5;245m\]'
GRAY_8B_246='\[\e[38;5;246m\]'
GRAY_8B_247='\[\e[38;5;247m\]'
GRAY_8B_248='\[\e[38;5;248m\]'
RED_8B_160='\[\e[38;5;160m\]'
RED_8B_196='\[\e[38;5;196m\]'
RED_8B_197='\[\e[38;5;197m\]'
PURPLE_8B_174='\[\e[38;5;174m\]'

USER_CWD_P=$BLUE_8B_69

# PROMPT  COLORS
prompt_color_sep=$GREEN_8B_47
prompt_color_symbol=$YELLOW
prompt_color_user=$USER_CWD_P
prompt_color_hostname=$USER_CWD_P
prompt_prompt_color=$USER_CWD_P

prompt_color_cwd=$GRAY_8B_248

git_color=$GRAY_8B_242
git_color_symbol=$BLUE_8B_45
git_files_color=$PURPLE_8B_174

# prompt_symbol_success='🟢'
# prompt_symbol_fail='🔴' 

prompt_symbol_fail='◉'
prompt_symbol_fail_color=$RED_8B_197

# symbol
# prompt_symbols+=('🧬')
prompt_symbols+=('☠︎︎')
prompt_symbols+=('🥖')
prompt_symbols+=('👾')
prompt_symbols+=('🔥')
prompt_symbols+=('🐧')
# prompt_symbols+=('◉')
# prompt_symbols+=('🖕')
prompt_symbols+=('☠')
prompt_symbols+=('👽')
prompt_symbols+=('😏')
prompt_symbols+=('🧠')
prompt_symbols+=('🤢')
prompt_symbols+=('🌐')
prompt_symbols+=('👿')
# random symbol
prompt_symbol='${prompt_symbols[$SRANDOM % ${#prompt_symbols[@]}]}'

# GIT PROMPT
git_symbols+=('𖣂︎')
git_symbols+=('𖤝')
# git_symbols+=('🌱')
git_symbols+=('')
git_symbols+=('𖦥')
git_symbols+=('')
# random symbol
git_symbol='${git_symbols[SRANDOM % ${#git_symbols[@]}]}'

# using var $last used to return user cmd
git_inside='$(git rev-parse --is-inside-work-tree 2>/dev/null)'

git_branch='$(last=$?;'$git_inside' && git -P branch 2>/dev/null| { while read -r b ; do [[ $b =~ ^\* ]] && printf " ${b##\* }"; done; }; exit $last)'
git_branch="$git_color$git_branch"

git_files_change='$('$git_inside' && git status -s -uno 2>/dev/null|wc -l|| printf 0)'
git=$git_branch'$(last=$?; (( '$git_files_change' != 0 )) && printf "'$git_color_symbol' '$git_symbol' '$git_files_color$git_files_change$git_color'"; exit $last)'

# LAST COMMAND EXIT STATUS
last_cmd_status='$(last=$?; (( last == 0)) && printf "'$prompt_symbol_success'" || { 
		printf "'$prompt_symbol_fail$prompt_symbol_fail_color' $last '$prompt_color_sep$prompt_symbol_fail' ";
		exit $last
	}
)'

# [[ "$EUID" -eq 0 ]] && { # Change prompt colors for root user
#         prompt_color='\[\e[;94m\]'
#         prompt_color_info='\[\e[1;31m\]'
# }

# show max 2 directories 
PROMPT_DIRTRIM=2

 PS1=$prompt_color_sep'┌──('
PS1+=$prompt_color_user'\u'
PS1+=$prompt_color_symbol$prompt_symbol
PS1+=$prompt_color_hostname'\h'
PS1+=$prompt_color_sep')'
PS1+=$prompt_color_sep'['
PS1+=$prompt_color_cwd'\w'
PS1+=$prompt_color_sep']'
PS1+=$git
PS1+='\n'
PS1+=$prompt_color_sep'└─'
PS1+=$last_cmd_status
PS1+=$prompt_prompt_color'\$ '
PS1+=$RESET

# DISPLAY before prompt
PROMPT_COMMAND=( 'printf "\n"' )
PROMPT_COMMAND+=( 'printf "\e[0;35m─\e[0m%.0s" $(seq -s" " 1 $(( COLUMNS-1)) )' )
PROMPT_COMMAND+=( 'printf "\n"' )

# enable color support of ls, less and man
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	export LS_COLORS="$LS_COLORS:ow=30;44:" # fix ls color for folders with 777 permissions
fi

# less options/colors
# -i ignore case unless Upper appear in pattern search
# -I same as -i but ignore Upper in pattern search
export LESS='-i --incsearch --use-color --color=S232.195'

# vim as line editor
export VISUAL="$(which vim)"
FCEDIT=vim


# PATH
[[ -d ~/.local/bin ]] && PATH=~/.local/bin:$PATH

# ALIASES
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

# fzf
fzf_profile=~/.config/fzf/.fzf_profile
[[ -f $fzf_profile ]] && . $fzf_profile

# my tools / func
# convert hex to dec
hex2dec() { [[ $1 ]] && (( 16#$1 != 0 )) && echo $(( 16#$1 )); }

# ghidra
# create project, include file,analyse and open ghidra
gh_prj() { 
	(( $# < 2 )) && { 
		echo "gh_prj <project_name> <file_name_to_import>";
			return 1;
		};
	/usr/bin/ghidra-analyzeHeadless $PWD "$1"  -import "$2" && /usr/bin/ghidra "$(pwd)/$1.gpr";
}
# minus same value to all XXYYZZ. ex. 8899AA 01 => 8899AA - 010101
hexminux(){ (( $# < 2 )) && return; printf "%06X\n" $(( 16#$1 - 16#$2$2$2 )); }

