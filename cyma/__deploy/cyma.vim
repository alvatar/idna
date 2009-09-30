" Quick settings
let g:projectPath = "/data/projects/idna/cyma/"
let g:programName = "Cyma"
let makeString = "./build.sh"

" Paths and global variables for custom functions
execute "cd ".g:projectPath."__deploy"
" Load Session before loading custom configuration
source Session.vim
let CTags_CScope_Top_Dir = g:projectPath."__deploy"
let CTags_CScope_Dir_List = g:projectPath.".."
let Make_Dir = g:projectPath."__deploy"
execute "set path+=".g:projectPath."**"

" Make command (used previously for make string formatting)
" let formatedMakeString = substitute(makeString, " ", "\\\\ ", "g")
" execute "set makeprg=".formatedMakeString
execute "set makeprg=".makeString

" Clean Xfbuilds' excrements
function! CleanXfBuild()
	execute "cd ".g:projectPath."__deploy"
	execute "!./clean.sh"
endfunction

" View imports graph
function! ViewImportsGraph()
	execute "cd ".g:projectPath."__deploy"
	execute "!./graph.sh"
endfunction

" Shortcuts
nnoremap <F3> :vimgrep /<C-R><C-W>/ **<CR>
noremap <F8> :call ViewImportsGraph()<CR>
execute "nmap <F9> :!bin/".g:programName." <CR>"
noremap <F10> :call CleanXfBuild()<CR>
noremap <F11> :call Compile(1)<CR>
inoremap <F11> <ESC>:call Compile(1)<CR>
nnoremap <F12> :call BuildCTagsAndCSCopeDatabase("d")<CR>
