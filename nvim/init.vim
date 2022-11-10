lua require('raybarrera/config')

if has('termguicolors')
	set termguicolors
endif

function! TransparentBackground()
    highlight Normal guibg=NONE ctermbg=NONE
    highlight LineNr guibg=NONE ctermbg=NONE
    highlight NonText guibg=NONE ctermbg=NONE
    highlight WinSeparator gui=NONE guibg=NONE
    highlight VertSplit gui=NONE guibg=NONE
endfunction

let g:sonokai_style = 'andromeda'
let g:sonokai_better_performance = 1
let g:sonokai_transparent_background = 1
autocmd ColorScheme * call TransparentBackground()
colorscheme sonokai

