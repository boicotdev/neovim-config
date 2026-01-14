return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
          },
        },
      })

      vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")
    end,
  },

  -- 🔗 Autopairs
  {
    "windwp/nvim-autopairs",
    config = true,
  },

  -- 💬 Comentarios
  {
    "numToStr/Comment.nvim",
    config = true,
  },

  -- 📐 Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
}
