require("chatgpt").setup({
    -- api_key_cmd = "gpg --decrypt --quiet $HOME/.config/openai/api_key.txt.gpg"
    api_key_cmd = "cat $HOME/.config/openai/api_key.txt"
})

