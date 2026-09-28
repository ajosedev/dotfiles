local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.filetype.add({
  extension = {
    jsonc = "jsonc",
  },
  filename = {
    ["tsconfig.json"] = "jsonc",
    ["tsconfig.app.json"] = "jsonc",
    ["tsconfig.node.json"] = "jsonc",
  },
})

local lsp_servers = {
  "lua_ls",
  "jsonls",
  "yamlls",
  "vtsls",
  "eslint",
  "html",
  "cssls",
  "tailwindcss",
  "marksman",
  "bashls",
}

require("lazy").setup({
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
  {
    "romainl/vim-cool",
    event = "VeryLazy"
  },
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        yml = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        markdown = { "prettier" },
        mdx = { "prettier" },
        lua = { "stylua" },
      },
      format_on_save = {
        timeout_ms = 1000,
        lsp_format = "fallback",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = lsp_servers,
      automatic_enable = false,
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      for _, server in ipairs(lsp_servers) do
        local config = {}

        if server == "jsonls" then
          config.filetypes = { "json", "jsonc" }
        end

        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end,
  }
}, opts)

vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

vim.opt.number = true
vim.cmd.syntax("on")
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.clipboard = "unnamedplus"
