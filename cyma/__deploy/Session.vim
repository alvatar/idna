let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <F11> :call Compile(1)
map! <S-Insert> *
cnoremap <C-Space><C-Space> vert scscope find
cnoremap <C-Space> cscope find
nnoremap <NL> /<++.\{-1,}++>c//e
map Q gq
vmap [% [%m'gv``
nmap \ihn :IHN
nmap \is :IHS:A
nmap \ih :IHS
vmap <silent> \x <Plug>VisualTraditional
vmap <silent> \c <Plug>VisualTraditionalj
nmap <silent> \x <Plug>Traditional
nmap <silent> \c <Plug>Traditionalj
vmap ]% ]%m'gv``
vmap a% [%v]%
nmap gx <Plug>NetrwBrowseX
nnoremap <F12> :call BuildCTagsAndCSCopeDatabase("d")
noremap <F11> :call Compile(1)
noremap <F10> :call CleanProgram()
noremap <F9> :call RunProgram()
nnoremap <F3> :vimgrep // **
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
noremap <Plug>VisualFirstLine :call EnhancedCommentify('', 'first',   line("'<"), line("'>"))
noremap <Plug>VisualTraditional :call EnhancedCommentify('', 'guess',   line("'<"), line("'>"))
noremap <Plug>VisualDeComment :call EnhancedCommentify('', 'decomment',   line("'<"), line("'>"))
noremap <Plug>VisualComment :call EnhancedCommentify('', 'comment',   line("'<"), line("'>"))
noremap <Plug>FirstLine :call EnhancedCommentify('', 'first')
noremap <Plug>Traditional :call EnhancedCommentify('', 'guess')
noremap <Plug>DeComment :call EnhancedCommentify('', 'decomment')
noremap <Plug>Comment :call EnhancedCommentify('', 'comment')
nmap <C-Space><C-Space>d :vert scs find d 
nmap <C-Space><C-Space>i :vert scs find i 
nmap <C-Space><C-Space>f :vert scs find f 
nmap <C-Space><C-Space>e :vert scs find e 
nmap <C-Space><C-Space>t :vert scs find t 
nmap <C-Space><C-Space>c :vert scs find c 
nmap <C-Space><C-Space>g :vert scs find g 
nmap <C-Space><C-Space>s :vert scs find s 
nmap <C-Space>d :cs find d 
nmap <C-Space>i :cs find i 
nmap <C-Space>f :cs find f 
nmap <C-Space>e :cs find e 
nmap <C-Space>t :cs find t 
nmap <C-Space>c :cs find c 
nmap <C-Space>g :cs find g 
nmap <C-Space>s :cs find s 
noremap <F8> :call ViewImportsGraph()
nnoremap <F2><F2> :!opera 
nnoremap <F2> :!opera http://www.google.es/search?q=&ie=utf-8&oe=utf-8&aq=t
inoremap <NL> /<++.\{-1,}++>c//e
imap \ihn :IHN
imap \is :IHS:A
imap \ih :IHS
imap <silent> \x <Plug>Traditional
imap <silent> \c <Plug>Traditionalji
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set backspace=2
set errorformat=%*[^\"]\"%f\"%*\\D%l:\ %m,\"%f\"%*\\D%l:\ %m,%-G%f:%l:\ (Each\ undeclared\ identifier\ is\ reported\ only\ once,%-G%f:%l:\ for\ each\ function\ it\ appears\ in.),%f:%l:%c:%m,%f(%l):%m,%f:%l:%m,\"%f\"\\,\ line\ %l%*\\D%c%*[^\ ]\ %m,%D%*\\a[%*\\d]:\ Entering\ directory\ `%f',%X%*\\a[%*\\d]:\ Leaving\ directory\ `%f',%D%*\\a:\ Entering\ directory\ `%f',%X%*\\a:\ Leaving\ directory\ `%f',%DMaking\ %*\\a\ in\ %f,%f|%l|\ %m,%f(%l):\ %m
set fileencodings=ucs-bom,utf-8,default,latin1,default
set guifont=montecarlo
set guiheadroom=0
set guioptions=ac
set helplang=en
set hlsearch
set iminsert=0
set imsearch=0
set makeprg=./build.sh
set mouse=a
set mousemodel=popup
set path=.,/usr/include,,,.**,/data/projects/idna/cyma/**
set ruler
set sessionoptions=blank,buffers,curdir,globals,folds,help,localoptions,options,tabpages,winsize
set shiftwidth=4
set showcmd
set showmatch
set spelllang=es,en
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=%03.3b]\ [HEX=%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.info,.aux,.log,.dvi,.bbl,.out,.o,.lo
set tabstop=4
set termencoding=utf-8
set wildmenu
set window=29
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
let DidEnhancedCommentify =  1 
let Tlist_Max_Submenu_Items =  20 
let Tlist_Auto_Update =  1 
let CTags_CScope_Dir_List = "/data/projects/idna/cyma/.."
let Tlist_WinWidth =  30 
let Tlist_Enable_Fold_Column =  1 
let Tlist_Close_On_Select =  1 
let Tlist_GainFocus_On_ToggleOpen =  1 
let Tlist_Use_SingleClick =  0 
let Tlist_WinHeight =  10 
let Tlist_File_Fold_Auto_Close =  0 
let Tlist_Auto_Open =  0 
let EnhCommentifyTraditionalMode = "Yes"
let Tlist_Show_One_File =  1 
let CTags_CScope_Top_Dir = "/data/projects/idna/cyma/__deploy"
let EnhCommentifyRespectIndent = "yes"
let Tlist_Inc_Winwidth =  1 
let EnhCommentifyPretty = "yes"
let Tlist_Display_Tag_Scope =  1 
let Tlist_Compact_Format =  0 
let EnhCommentifyCallbackExists = "Yes"
let TagList_title = "__Tag_List__"
let Tlist_Use_Horiz_Window =  0 
let EnhCommentifyAlignRight = "no"
let EnhCommentifyMultiPartBlocks = "yes"
let Tlist_Exit_OnlyWindow =  1 
let NetrwTopLvlMenu = "Netrw."
let Tlist_Display_Prototype =  0 
let Tlist_Ctags_Cmd = "exuberant-ctags"
let NetrwMenuPriority =  80 
let Tlist_Highlight_Tag_On_BufEnter =  1 
let Tlist_Auto_Highlight_Tag =  1 
let Tlist_Show_Menu =  0 
let Tlist_Max_Tag_Length =  10 
let Tlist_Use_Right_Window =  0 
let Make_Dir = "/data/projects/idna/cyma/__deploy"
let Tlist_Process_File_Always =  0 
let Tlist_Sort_Type = "order"
silent only
cd /data/projects/idna/cyma/__deploy
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +13 /data/projects/idna/cyma/model/Model.d
badd +39 /data/projects/idna/cyma/application/Main.d
badd +72 /data/projects/idna/cyma/view/Drawer.d
badd +24 /data/projects/idna/cyma/model/Layer.d
badd +12 /data/projects/idna/cyma/model/Substrate.d
badd +30 /data/projects/idna/cyma/view/DrawableObject.d
badd +6 /data/projects/idna/cyma/view/Canvas.d
badd +18 /data/projects/idna/cyma/controller/DummyUi.d
badd +12 /data/projects/idna/cyma/engine/Element.d
badd +26 /data/projects/idna/cyma/controller/Ui.d
badd +28 /data/projects/idna/cyma/engine/Driver.d
badd +1 /data/projects/idna/cyma/controller/UiCreator.d
badd +13 /data/projects/idna/cyma/controller/HybridGui.d
badd +154 /data/projects/idna/cyma/controller/GlUi.d
badd +19 /data/projects/idna/cyma/controller/UiManager.d
badd +40 /data/projects/idna/cyma/engine/Command.d
badd +4 /data/projects/idna/cyma/engine/commands/DummyCommand.d
badd +1 /data/projects/idna/cyma/engine/commands/AddLine.d
badd +1 /data/projects/idna/cyma/engine/commands/All.d
badd +7 /data/projects/idna/cyma/model/RasterSubstrate.d
badd +1 /data/projects/idna/cyma/model/StaticVectorSubstrate.d
badd +7 /data/projects/idna/cyma/model/DynamicVectorSubstrate.d
badd +21 /data/projects/idna/cyma/model/Node.d
badd +9 /data/projects/idna/cyma/view/GlCanvas.d
badd +6 /data/projects/idna/cyma/view/DrawActor.d
badd +10 /data/projects/idna/cyma/view/DrawContext.d
silent! argdel *
edit /data/projects/idna/cyma/view/Drawer.d
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
map <buffer> \o <Plug>OrganizeImports
map <buffer> \i <Plug>Autoimport
noremap <buffer> <Plug>OrganizeImports :OrganizeImports
noremap <buffer> <Plug>Autoimport :Autoimport =expand("<cword>")
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
set cursorline
setlocal cursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'd'
setlocal filetype=d
endif
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
set foldmethod=syntax
setlocal foldmethod=syntax
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=nroql2
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=0
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=es,en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'd'
setlocal syntax=d
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 72 - ((58 * winheight(0) + 46) / 93)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
72
normal! 03l
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
