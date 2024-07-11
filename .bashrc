PS1=' ↳$(if [ $? -eq 0 ]; then echo -e "\e[32m0\e[0m"; else echo -e "\e[31m$?\e[0m"; fi)\n[\[\e[38;5;45m\]\u\[\e[38;5;31m\]@\[\e[38;5;45m\]\h\[\e[38;5;31m\]:\[\e[38;5;74m\]\W\[\e[0m\]]\\$ '


eval "$(zoxide init bash)"
