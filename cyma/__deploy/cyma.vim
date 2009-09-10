" Load Session before loading custom configuration
source Session.vim

" Quick settings
let g:projectPath = "/data/projects/idna/cyma/"
let g:programName = "Cyma"
let g:compilerName = "dmd"
let makeString = "xfbuild ../application/Main.d +full +noop +c".g:compilerName." +obin/".g:programName." -I../../.. -I../../ext -g -debug"

" Paths and global variables for custom functions
execute "cd ".g:projectPath."__deploy"
let CTags_CScope_Top_Dir = g:projectPath."__deploy"
let CTags_CScope_Dir_List = g:projectPath.".."
let Make_Dir = g:projectPath."__deploy"
execute "set path+=".g:projectPath."**"

" Make command
let formatedMakeString = substitute(makeString, " ", "\\\\ ", "g")
execute "set makeprg=".formatedMakeString

" Clean Xfbuilds' excrements
function! CleanXfBuild()
	execute "cd ".g:projectPath."__deploy"
	execute "!if [[ -a .obj ]]; then rm -R .obj; fi;    if [[ -a .deps ]]; then rm -R .deps; fi;    if [[ `ls xfbuild* 2> /dev/null` ]]; then rm -R xfbuild*; fi;    if [[ -a bin/".g:programName." ]]; then rm -R bin/".g:programName."; fi"
endfunction

" Shortcuts
nnoremap <F3> :vimgrep /<C-R><C-W>/ **<CR>
execute "nmap <F9> :!bin/".g:programName." <CR>"
noremap <F10> :call CleanXfBuild()<CR>
noremap <F11> :call Compile(1)<CR>
inoremap <F11> <ESC>:call Compile(1)<CR>
nnoremap <F12> :call BuildCTagsAndCSCopeDatabase("d")<CR>
