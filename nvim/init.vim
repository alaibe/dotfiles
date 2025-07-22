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

" File tree keybindings  
nnoremap <Leader>e <cmd>NvimTreeToggle<cr>
nnoremap <Leader>o <cmd>NvimTreeFocus<cr>

" UltiSnips configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom-snippets"]

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

Plug 'itchyny/lightline.vim'

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

" Code snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Initialize plugin system
call plug#end()

lua << EOF
  require("mason").setup()
  require("mason-lspconfig").setup {
    ensure_installed = { "gopls", "ts_ls", "intelephense", "nim_langserver", "tailwindcss", "html", "cssls" } 
  }
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- Using UltiSnips as snippet engine
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
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
      { name = 'ultisnips' },
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
    ensure_installed = { "lua", "vim", "javascript", "typescript", "go", "php", "python", "rust", "json", "yaml" },
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
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
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
EOF