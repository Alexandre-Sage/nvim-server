vim.opt.termguicolors = true

vim.cmd([[
	au BufRead,BufNewFile *.jq setfiletype jq
	colorscheme darkvoid
    	syntax off
    	set number
    	set shiftwidth=0
    	set noswapfile
    	set relativenumber
	set showtabline=0
]])
