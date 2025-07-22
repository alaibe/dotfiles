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

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" You will load your plugin here
Plug 'tomtom/tcomment_vim'

" Leader C is the prefix for code related mappîngs
noremap <silent> <Leader>cc :TComment<CR>

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :GFiles<CR>
nnoremap <C-t> :History<CR>
nnoremap <silent> <Leader>f :Rg<CR>

Plug 'itchyny/lightline.vim'

Plug 'sheerun/vim-polyglot'

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

" Neovim specific plugins
Plug 'williamboman/mason.nvim', { 'branch': 'main' }
Plug 'williamboman/mason-lspconfig.nvim', { 'branch': 'main' }
Plug 'neovim/nvim-lspconfig', { 'branch': 'main' }
Plug 'hrsh7th/cmp-nvim-lsp', { 'branch': 'main' }
Plug 'hrsh7th/cmp-buffer', { 'branch': 'main' }
Plug 'hrsh7th/cmp-path', { 'branch': 'main' }
Plug 'hrsh7th/cmp-cmdline', { 'branch': 'main' }
Plug 'hrsh7th/nvim-cmp', { 'branch': 'main' }
Plug 'hrsh7th/cmp-vsnip', { 'branch': 'main' }
Plug 'hrsh7th/vim-vsnip', { 'branch': 'main' }

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
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
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
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
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
EOF