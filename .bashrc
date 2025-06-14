#
# ~/.bashrc
#
#	topklean v 1.0 2025-06-03 
#
#		organisation in function
#		call main to run all the script
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return 

# USER setup
# change to false or true

init_user_choices() {
	 nbsp_disable=true
	 prompt_colors_want_i=true
	 prompt_git_want_i=true
	 prompt_status_want_i=true
}


init_shell() {
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
#     setxkbmap -option "nbsp:none"
# set -x
#     [[ $XDG_SESSION_TYPE =~ [xX](11|[oO][rR][gG]) && $nbsp_disable == true ]] && setxkbmap -option "nbsp:none"
#     set +x

}


init_extra() {
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

# git
export GIT_COMPLETION_SHOW_ALL=1
}

init_path() {
# PATH
	[[ -d ~/.local/bin ]] && PATH=~/.local/bin:$PATH
}

init_sources() {
	# prompt
	[[ -f ~/.config/bash/promptrc ]] && . ~/.config/bash/promptrc


	# ALIASES
	[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

	# fzf
	fzf_profile=~/.config/fzf/.fzf_profile
	[[ -f $fzf_profile ]] && . $fzf_profile
}

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
hexminux() {
	(( $# < 2 )) && return; printf "%06X\n" $(( 16#$1 - 16#$2$2$2 ));
}


main() {
	init_user_choices
	init_shell
	init_extra
	init_path
	init_sources
	init_prompt
	prompt_clean
}

main
