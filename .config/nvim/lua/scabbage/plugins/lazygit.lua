return {
    "kdheepak/lazygit.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
    config = function(_)
        require("telescope").load_extension("lazygit")
    end,
}
