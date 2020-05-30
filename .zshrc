export ZSH="/Users/deepakpenmetsa/.oh-my-zsh"
ZSH_THEME="miloshadzic"
plugins=(git)
source $ZSH/oh-my-zsh.sh
export FZF_DEFAULT_COMMAND="fd"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
