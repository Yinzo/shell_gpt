# Shell-GPT integration BASH v0.2
_sgpt_bash() {
if [[ -n "$READLINE_LINE" ]]; then
	READLINE_LINE=$(sgpt --shell <<< "$READLINE_LINE")
    READLINE_POINT=${#READLINE_LINE}
fi
}
bind -x '"\C-l": _sgpt_bash'

_sgpt_bash_desc() {
if [[ -n "$READLINE_LINE" ]]; then
    echo $(sgpt --describe-shell <<< "$READLINE_LINE")
fi
}
bind -x '"\C-x": _sgpt_bash_desc'

# Shell-GPT integration BASH v0.2
