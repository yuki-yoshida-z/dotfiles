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

-- 外部変更を自動で読むことを許可
vim.opt.autoread = true

-- キーマッピング
vim.keymap.set("n", "<C-k>", ":Files<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", ":Rg<CR>", { silent = true })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "nvim-tree: Toggle" })
vim.keymap.set("n", "<leader>a", "<cmd>NvimTreeFocus<cr>", { desc = "nvim-tree: Focus" })

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
-- njkファイルをnunjucksとして認識させる
vim.filetype.add({
  extension = {
    njk = 'html',
  },
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

-- Go用の保存時自動処理（gofmt & goimports）
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    -- インポートの整理(goimports相当)
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
        else
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end
    -- コード整形(gofmt相当)
    vim.lsp.buf.format({async = false})
  end,
})

-- Normal モードでカーソル停止時に checktime
vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    vim.cmd("checktime")
  end,
})

-- フォーカス復帰・バッファ移動時にも checktime
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  pattern = "*",
  callback = function()
    vim.cmd("checktime")
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
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false
        },
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
local servers = { "solargraph", "ts_ls", "html", "cssls", "terraformls", "gopls" }
for _, server in ipairs(servers) do
  vim.lsp.config(server, {})
  vim.lsp.enable({ server })
end

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
