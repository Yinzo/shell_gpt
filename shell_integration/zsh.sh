# Shell-GPT integration ZSH v0.2
_sgpt_zsh() {
if [[ -n "$BUFFER" ]]; then
    _sgpt_prev_cmd=$BUFFER
    BUFFER+="⌛"
    zle -I && zle redisplay
    BUFFER=$(sgpt --shell <<< "$_sgpt_prev_cmd")
    zle end-of-line
fi
}
zle -N _sgpt_zsh
bindkey ^l _sgpt_zsh


_sgpt_describe_zsh() {
    if [[ -n "$BUFFER" ]]; then
        local _sgpt_prev_cmd=$BUFFER
        BUFFER+="⌛"
        zle -I && zle redisplay

        local _sgpt_output=$(sgpt --describe-shell <<< "$_sgpt_prev_cmd")

        # Display SGPT output without altering the buffer
        echo "$_sgpt_output"
        echo
        zle -I && zle redisplay
        BUFFER=$_sgpt_prev_cmd
        CURSOR=$#BUFFER  # Restore cursor position to the end of the buffer
        zle end-of-line
    fi
}
zle -N _sgpt_describe_zsh
bindkey "^x" _sgpt_describe_zsh

# Shell-GPT integration ZSH v0.2
