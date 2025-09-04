-- init.lua

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- ファイルタイプ/インデント/シンタックス
vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")

-- 文字コード
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- 表示系
vim.opt.number = true              -- 行番号表示
vim.opt.cursorline = true          -- カーソル行ハイライト
vim.opt.cursorcolumn = true        -- カーソル列ハイライト
vim.opt.virtualedit = "onemore"    -- 行末の1文字先まで移動可

-- インデント
vim.opt.smartindent = false
vim.opt.autoindent = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- クリップボード
vim.opt.clipboard = "unnamed"

-- 不可視文字表示
vim.opt.list = true
vim.opt.listchars = { eol = "↲", extends = "»", precedes = "«", nbsp = "%" }

-- 数値フォーマット
vim.opt.nrformats = {}

-- Leader をスペースに設定
vim.g.mapleader = " "

-- キーマッピング
vim.keymap.set("n", "<C-k>", ":Files<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", ":Rg<CR>", { silent = true })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "nvim-tree: Toggle" })
vim.keymap.set("n", "<Leader>a", ":AvanteToggle<CR>", { silent = true })
vim.keymap.set("n", "<Leader>s", ":AvanteAsk<CR>", { silent = true })
vim.keymap.set("n", "<leader>cl", "<cmd>AvanteSwitchProvider claude<cr>", { desc = "Switch to Claude" })
vim.keymap.set("n", "<leader>ge", "<cmd>AvanteSwitchProvider gemini<cr>", { desc = "Switch to Gemini" })
vim.keymap.set("n", "<leader>cle", "<cmd>AvanteClear<cr>", { desc = "AvanteClear executed" })

-- プラグイン設定
vim.g.fzf_layout = { down = "40%" }
vim.g.blamer_enabled = 1

-- 自動コマンド
vim.api.nvim_create_augroup("MyXML", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "MyXML",
  pattern = { "xml", "html", "eruby" },
  callback = function()
    vim.keymap.set("i", "</", "</<C-x><C-o>", { buffer = true })
  end,
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = "MyXML",
  pattern = "*.jbuilder",
  command = "set filetype=ruby",
})

-- nvim-treeのカラーカスタマイズ
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#E6DB74" })
    vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderIcon", { fg = "#A6E22E" })
    vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#F92672" })
    vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = "#A6E22E" })
  end,
})
-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- カラースキーマ
  { 'sainnhe/sonokai' },

  -- シンタックス関連
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "ruby", "javascript", "typescript", "html", "css", "vue", "bash", "go", "java", "json", "yaml", "markdown", "nginx", "pug", "python", "scala", "scss", "slim", "sql", "terraform", "xml"
       },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },

  -- ステータスラインのカラーリング
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- ディレクトリ表示
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },

  -- git blame表示
  { "APZelos/blamer.nvim" },

  -- インデントを可視化
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  -- 行末のスペースを可視化
  { "bronson/vim-trailing-whitespace" },

  -- コメントアウトの効率化
  { "numToStr/Comment.nvim" },

  -- ファイル検索 (fzf 本体)
  { "junegunn/fzf", build = "./install --all" },

  -- fzf.vim (fzf を Neovim で使うためのプラグイン)
  { "junegunn/fzf.vim" },

  -- 閉じ括弧補完
  { "cohama/lexima.vim" },

  -- LSP 基盤
  { "neovim/nvim-lspconfig" },

  -- LSP 補完エンジン
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },

  -- Copilot
  { "github/copilot.vim" },

  -- Avante
  {
    "yetone/avante.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = { file_types = { "Avante" } },
        ft = { "Avante" },
      },
    },
    build = "make",
    config = function()
      require("avante").setup({
        -- providerは各端末毎に設定すること
        -- provider = "copilot",
        provider = "gemini",
        providers = {
          gemini = {
            api_key = os.getenv("GEMINI_API_KEY"),
            endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
            model = "gemini-2.0-flash"
          },
          claude = {
            name = "claude",
            endpoint = "https://api.anthropic.com",
            api_key = os.getenv("ANTHROPIC_API_KEY"),
            model = "claude-3-haiku-20240307",
            headers = {
              ["anthropic-version"] = "2023-06-01",
            },
            extra_request_body = {
              temperature = 0.2,
              max_tokens = 4096
            }
          }
        }
      })
    end
  }
})
vim.g.sonokai_transparent_background = false
vim.cmd("colorscheme sonokai")

require('lualine').setup({
  options = { theme  = 'molokai' }
})
require("ibl").setup()
require('Comment').setup()
require("nvim-tree").setup({
  -- netrwを完全に無効化（重要）
  disable_netrw = true,
  hijack_netrw = true,
  -- カーソルハイジャック無効化（パフォーマンス向上）
  hijack_cursor = false,
  -- ディレクトリ変更時の動作
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
})
-- LSP 設定
local lspconfig = require("lspconfig")
lspconfig.solargraph.setup{}
lspconfig.ts_ls.setup{}
lspconfig.html.setup{}
lspconfig.cssls.setup{}
lspconfig.terraformls.setup{}

-- nvim-cmp
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "buffer" },
  })
})
