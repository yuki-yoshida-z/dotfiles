-- init.lua

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
vim.opt.smartindent = true
vim.opt.autoindent = true
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

-- キーマッピング
vim.keymap.set("n", "<C-e>", ":NERDTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", ":Files<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", ":Rg<CR>", { silent = true })

-- プラグイン設定
vim.g.NERDTreeShowLineNumbers = 1
vim.g.NERDTreeMinimalMenu = 1   -- Neovim 0.8.0 の不具合対策
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
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = "MyXML",
  pattern = "*.es6",
  command = "set filetype=javascript",
})

-- カラースキーム
vim.cmd("colorscheme molokai")

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

  -- ステータスラインのカラーリング
  { "itchyny/lightline.vim" },

  -- ディレクトリ表示
  { "scrooloose/nerdtree" },

  -- git blame表示
  { "APZelos/blamer.nvim" },

  -- インデントを可視化
  { "Yggdroot/indentLine" },

  -- 行末のスペースを可視化
  { "bronson/vim-trailing-whitespace" },

  -- コメントアウトの効率化
  { "tomtom/tcomment_vim" },

  -- ファイル検索 (fzf 本体)
  { "junegunn/fzf", build = "./install --all" },

  -- fzf.vim (fzf を Neovim で使うためのプラグイン)
  { "junegunn/fzf.vim" },

  -- 閉じ括弧補完
  { "cohama/lexima.vim" },

  -- シンタックス関連
  { "slim-template/vim-slim" },
  { "MaxMEllon/vim-jsx-pretty" },
  { "posva/vim-vue" },
  { "leafOfTree/vim-vue-plugin" },
  { "leafgarland/typescript-vim" },
  { "digitaltoad/vim-pug" },
  { "wavded/vim-stylus" },
  { "chr4/nginx.vim" },

  -- LSP 基盤
  { "neovim/nvim-lspconfig" },

  -- LSP 補完エンジン
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" }

})

-- LSP 設定
local lspconfig = require("lspconfig")

-- Ruby (Solargraph)
lspconfig.solargraph.setup{}

-- JavaScript / TypeScript
lspconfig.ts_ls.setup{}

-- HTML, CSS
lspconfig.html.setup{}
lspconfig.cssls.setup{}

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
