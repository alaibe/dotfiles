set autoread                    " Load file from disk, ie for git reset
set nocompatible		            " Not concerned with vi compatibility
set lazyredraw                  " Don't update while executing macros
set history=1000  		          " Remember last 1000 commands
set scrolloff=4                 " Keep at least 4 lines below cursor
set expandtab                   " Convert <tab> to spaces (2 or 4)
set shiftwidth=2
set softtabstop=2
set secure                      " Limit what modelines and autocmds can do
set autowrite                   " write for me when I take any action
set laststatus=2
set noshowmode
set nu
set backspace=indent,eol,start  " make backspaces deletejsensibly
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set smartcase
set ignorecase
set grepprg=ack

let g:grep_cmd_opts = '--noheading'
let mapleader = ' '

" Quick shortcuts and mappings
inoremap jj <Esc>
nnoremap Q :qa! <CR>
nnoremap qq :q! <CR>

" Quick toggle between two files
nnoremap <leader><leader> <C-^>

" Easy navigation for editing and cding
nmap <Leader>ec :e ~/code/
nmap <Leader>eh :e ~/
nnoremap <leader>er :e <C-r>=escape(expand("%:p:h"), ' ')<cr>/

"Make Y yank to end of line (like D, or C)
nmap Y y$

" easy access to the start of the line
nnoremap 0 ^

" leader-; to enter command mode. No more holding shift!
nnoremap <leader>; :
vnoremap <leader>; :

" Quickly open a second window to view files side by side
nmap <LEADER>vn :split<CR>
nmap <LEADER>vs :vsplit<CR>

" Move one line at a time, aka 'fine ajdustment'
nnoremap j gj
nnoremap k gk

" Go to position of last edit. Mnem: 'Go to Edit'
nnoremap ge `.

" copy
nnoremap yy Y

" quick replace
nnoremap <Leader>sub :%s///g<left><left><left>
vnoremap <Leader>sub :s///g<left><left><left>
nnoremap <leader>wub :%s//<C-r><C-w>/g<cr>

" Clipboard for macOS
set clipboard=unnamed

" Enable GUI colors and icons
if has('termguicolors')
  set termguicolors
endif
set encoding=utf-8
set t_Co=256

" Telescope keybindings
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-t> <cmd>Telescope oldfiles<cr>
nnoremap <silent> <Leader>f <cmd>Telescope live_grep<cr>
nnoremap <Leader>fb <cmd>Telescope buffers<cr>
nnoremap <Leader>fh <cmd>Telescope help_tags<cr>
nnoremap <Leader>fc <cmd>Telescope commands<cr>

" Git keybindings
nnoremap <Leader>gs <cmd>Git<cr>
nnoremap <Leader>gd <cmd>Gdiff<cr>
nnoremap <Leader>gb <cmd>Git blame<cr>
nnoremap <Leader>lg <cmd>LazyGit<cr>
nnoremap <Leader>gh <cmd>Gitsigns preview_hunk<cr>
nnoremap <Leader>gp <cmd>Gitsigns prev_hunk<cr>
nnoremap <Leader>gn <cmd>Gitsigns next_hunk<cr>

" File tree keybindings
nnoremap <Leader>e <cmd>NvimTreeToggle<cr>
nnoremap <Leader>o <cmd>NvimTreeFocus<cr>

" LSP and diagnostics keybindings
nnoremap <Leader>xx <cmd>TroubleToggle<cr>
nnoremap <Leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <Leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <Leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <Leader>xl <cmd>TroubleToggle loclist<cr>

" Session management keybindings
nnoremap <Leader>ss <cmd>lua require("persistence").load()<cr>
nnoremap <Leader>sl <cmd>lua require("persistence").load({ last = true })<cr>
nnoremap <Leader>sd <cmd>lua require("persistence").stop()<cr>

" Clojure REPL keybindings (Conjure)
nnoremap <Leader>ce <cmd>ConjureEval<cr>
vnoremap <Leader>ce <cmd>ConjureEval<cr>
nnoremap <Leader>cf <cmd>ConjureEvalFile<cr>
nnoremap <Leader>cb <cmd>ConjureEvalBuf<cr>
nnoremap <Leader>cl <cmd>ConjureLogSplit<cr>
nnoremap <Leader>ct <cmd>ConjureRunTests<cr>

" Structural editing keybindings (vim-sexp)
" These work with vim-sexp-mappings-for-regular-people
" <Leader>w - wrap in parens
" <Leader>W - unwrap
" <Leader>s - splice (remove current parens but keep content)
" >( / <( - slurp/barf right
" >) / <) - slurp/barf left

" Parinfer toggle
nnoremap <Leader>pt <cmd>ParinferToggleMode<cr>

" LuaSnip configuration (replaces UltiSnips)
" Keybindings will be configured in Lua section

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" You will load your plugin here
Plug 'tomtom/tcomment_vim'

" Leader C is the prefix for code related mappîngs
noremap <silent> <Leader>cc :TComment<CR>

" Modern fuzzy finder - Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Treesitter for better syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'editorconfig/editorconfig-vim'

Plug 'godlygeek/tabular'
vnoremap <silent> <Leader>cee    :Tabularize /=
vnoremap <silent> <Leader>cet    :Tabularize /#
vnoremap <silent> <Leader>ce     :Tabularize /

Plug 'vim-scripts/vim-auto-save'

let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

Plug 'christoomey/vim-tmux-navigator'

Plug 'skwp/greplace.vim'

" Which-key for keybinding help
Plug 'folke/which-key.nvim'

" Git integration
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'

" File tree
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'

" LSP Enhancements
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'folke/trouble.nvim'

" Session Management
Plug 'folke/persistence.nvim'

" Better status line
Plug 'nvim-lualine/lualine.nvim'

" Clojure development
Plug 'Olical/conjure', {'tag': 'v4.49.0'}  " Interactive REPL
Plug 'guns/vim-sexp'                        " S-expression editing
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'gpanders/nvim-parinfer'              " Parinfer for automatic paren management
Plug 'luochen1990/rainbow'                 " Rainbow parentheses
Plug 'windwp/nvim-autopairs'               " Auto-close brackets

" Neovim specific plugins
Plug 'williamboman/mason.nvim', { 'branch': 'main' }
Plug 'williamboman/mason-lspconfig.nvim', { 'branch': 'main' }
Plug 'neovim/nvim-lspconfig', { 'branch': 'main' }
Plug 'hrsh7th/cmp-nvim-lsp', { 'branch': 'main' }
Plug 'hrsh7th/cmp-buffer', { 'branch': 'main' }
Plug 'hrsh7th/cmp-path', { 'branch': 'main' }
Plug 'hrsh7th/cmp-cmdline', { 'branch': 'main' }
Plug 'hrsh7th/nvim-cmp', { 'branch': 'main' }
" Removed vsnip - using UltiSnips instead

" Code snippets - LuaSnip (no Python dependency)
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

" Initialize plugin system
call plug#end()

lua << EOF
  require("mason").setup()
  require("mason-lspconfig").setup {
    ensure_installed = { "gopls", "ts_ls", "intelephense", "nim_langserver", "tailwindcss", "html", "cssls", "clojure_lsp" }
  }
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- Using LuaSnip as snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  local lspconfig = require('lspconfig')
  local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

  lspconfig.vimls.setup({
    capabilities = lsp_capabilities,
  })
  lspconfig.ts_ls.setup({
    capabilities = lsp_capabilities,
  })
  lspconfig.tailwindcss.setup({
    capabilities = lsp_capabilities,
  })
  lspconfig.cssls.setup({
    capabilities = lsp_capabilities,
  })
  lspconfig.html.setup({
    capabilities = lsp_capabilities,
  })
  lspconfig.jsonls.setup({
    capabilities = lsp_capabilities,
  })
  lspconfig.eslint.setup({
    capabilities = lsp_capabilities,
  })
  lspconfig.gopls.setup({
    capabilities = lsp_capabilities,
  })
  lspconfig.intelephense.setup({
    capabilities = lsp_capabilities,
  })
  lspconfig.nimls.setup({
    capabilities = lsp_capabilities,
  })
  lspconfig.clojure_lsp.setup({
    capabilities = lsp_capabilities,
    filetypes = { "clojure", "clojurescript", "edn" },
    init_options = {
      ["ignore-classpath-directories"] = true
    }
  })

  -- Telescope setup
  require('telescope').setup({
    defaults = {
      file_ignore_patterns = {"node_modules", ".git/"},
      mappings = {
        i = {
          ["<C-u>"] = false,
          ["<C-d>"] = false,
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      }
    }
  })
  require('telescope').load_extension('fzf')

  -- Treesitter setup
  require('nvim-treesitter.configs').setup({
    ensure_installed = { "lua", "vim", "javascript", "typescript", "go", "php", "python", "rust", "json", "yaml", "clojure" },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true
    },
  })

  -- Which-key setup
  require('which-key').setup({
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
    },
  })

  -- Gitsigns setup
  require('gitsigns').setup({
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    current_line_blame = false,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol',
      delay = 1000,
    },
  })

  -- Nvim-tree setup
  require('nvim-tree').setup({
    disable_netrw = true,
    hijack_netrw = true,
    view = {
      width = 30,
      side = 'left',
    },
    renderer = {
      add_trailing = false,
      group_empty = false,
      highlight_git = false,
      full_name = false,
      highlight_opened_files = "none",
      root_folder_modifier = ":~",
      indent_width = 2,
      indent_markers = {
        enable = false,
        inline_arrows = true,
        icons = {
          corner = "└",
          edge = "│",
          item = "│",
          none = " ",
        },
      },
      icons = {
        webdev_colors = true,
        git_placement = "before",
        padding = " ",
        symlink_arrow = " ➛ ",
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
        glyphs = {
          default = "",
          symlink = "",
          bookmark = "",
          folder = {
            arrow_closed = "",
            arrow_open = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
          git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
    filters = {
      dotfiles = false,
      custom = { '.DS_Store', '.git' },
    },
    git = {
      enable = true,
      ignore = false,
      timeout = 500,
    },
  })

  -- Null-ls setup for formatting and linting
  require('null-ls').setup({
    sources = {
      -- Formatters
      require('null-ls').builtins.formatting.prettier,
      require('null-ls').builtins.formatting.black,
      require('null-ls').builtins.formatting.gofmt,
      require('null-ls').builtins.formatting.rustfmt,

      -- Linters
      require('null-ls').builtins.diagnostics.eslint,
      require('null-ls').builtins.diagnostics.flake8,
    },
  })

  -- Trouble.nvim setup
  require('trouble').setup({
    icons = true,
    auto_open = false,
    auto_close = true,
  })

  -- Session management setup
  require('persistence').setup({
    dir = vim.fn.expand(vim.fn.stdpath('state') .. '/sessions/'),
    options = { 'buffers', 'curdir', 'tabpages', 'winsize' }
  })

  -- Lualine setup (better status line)
  require('lualine').setup({
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
  })

  -- Rainbow parentheses setup (using vim script syntax in lua)
  vim.cmd([[
    let g:rainbow_active = 1
    let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \     '*': {},
    \     'clojure': {
    \       'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta', 'lightred'],
    \     }
    \   }
    \ }
  ]])

  -- Parinfer setup
  vim.g.parinfer_mode = "smart"  -- "indent", "paren", or "smart"
  vim.g.parinfer_force_balance = false
  vim.g.parinfer_comment_chars = {";"}

  -- Auto-pairs setup
  require('nvim-autopairs').setup({
    disable_filetype = { "TelescopePrompt" , "vim" },
    disable_in_macro = false,
    disable_in_visualblock = false,
    disable_in_replace_mode = true,
    ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]],"%s+", ""),
    enable_moveright = true,
    enable_afterquote = true,
    enable_check_bracket_line = true,
    check_ts = false,
    map_cr = true,
    map_bs = true,
    map_c_h = false,
    map_c_w = false,
  })

  -- LuaSnip setup
  local luasnip = require('luasnip')

  -- Load friendly-snippets
  require("luasnip.loaders.from_vscode").lazy_load()

  -- Custom snippet directories
  require("luasnip.loaders.from_snipmate").lazy_load({paths = {vim.fn.stdpath("config") .. "/custom-snippets"}})

  -- LuaSnip keybindings
  vim.keymap.set({"i"}, "<C-K>", function() luasnip.expand() end, {silent = true})
  vim.keymap.set({"i", "s"}, "<C-L>", function() luasnip.jump( 1) end, {silent = true})
  vim.keymap.set({"i", "s"}, "<C-J>", function() luasnip.jump(-1) end, {silent = true})

  vim.keymap.set({"i", "s"}, "<C-E>", function()
    if luasnip.choice_active() then
      luasnip.change_choice(1)
    end
  end, {silent = true})
EOF
