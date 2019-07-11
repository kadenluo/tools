filetype on
filetype plugin on
filetype indent on
set showcmd         " �����������ʾ�������������Щ  
set autochdir
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "״̬����ʾ������  
set laststatus=1    " ������ʾ״̬��(1),������ʾ״̬��(2)  
set foldenable      " �����۵�  
set foldmethod=indent   " �ֶ��۵�  
set foldlevel=1000
set fenc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
" ӳ��ȫѡ+���� ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
"ȥ����  
nnoremap <F2> :g/^\s*$/d<CR> 
"�г���ǰĿ¼�ļ�  
map <F3> :tabnew .<CR>  
"set makeprg=make\ install
"map <C-m> :make<CR>
"����״�ļ�Ŀ¼  
map <C-F3> \be  
"���������  
set clipboard+=unnamed 
"�Ӳ�����  
"set nobackup
"�Զ�����
set autowrite
set ruler                   " ��״̬�����
set cursorline              " ͻ����ʾ��ǰ��
set nocompatible
set smartcase
" �﷨����
syntax on
" �ڴ���δ�����ֻ���ļ���ʱ�򣬵���ȷ��
set confirm
" �Զ�����
set autoindent
set cindent
" Tab���Ŀ��
set tabstop=4
" ͳһ����Ϊ4
set softtabstop=4
set shiftwidth=4
" ��Ҫ�ÿո�����Ʊ��
set expandtab
" ���кͶο�ʼ��ʹ���Ʊ��
set smarttab
" ��ʾ�к�
set number
" ��ʷ��¼��
set history=1000
set wildmenu
"��ֹ������ʱ�ļ�
"set noswapfile
"�������ַ�����
set hlsearch
set incsearch
"�����滻
set gdefault
"��������
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"��������
set langmenu=zh_CN.UTF-8
set helplang=cn
set laststatus=2
set cmdheight=2
" �������·��ŵĵ��ʲ�Ҫ�����зָ�
set iskeyword+=_,$,@,%,#,-
" �ַ���������������Ŀ
set linespace=0
" ʹ�ظ����backspace����������indent, eol, start��
set backspace=2
" ����backspace�͹�����Խ�б߽�
set whichwrap+=<,>,h,l
set report=0
set fillchars=vert:\ ,stl:\ ,stlnc:\
" ������ʾƥ�������
set showmatch
" ƥ�����Ÿ�����ʱ�䣨��λ��ʮ��֮һ�룩
set matchtime=1
" ����ƶ���buffer�Ķ����͵ײ�ʱ����3�о���
set scrolloff=3
" ΪC�����ṩ�Զ�����
set smartindent
set completeopt=longest,menu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags���趨  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Sort_Type = "name"    " ������������  
let Tlist_Compart_Format = 1    " ѹ����ʽ  
let Tlist_Exist_OnlyWindow = 1  " ���ֻ��һ��buffer��kill����Ҳkill��buffer  
let Tlist_File_Fold_Auto_Close = 0  " ��Ҫ�ر������ļ���tags  
let Tlist_Enable_Fold_Column = 0    " ��Ҫ��ʾ�۵���  
""Ĭ�ϴ�Taglist 
set tags=tags  
"autocmd FileType h,cpp,cc,c set tags+=D:\tools\cpp\tags  
let Tlist_Auto_Open=1 
let Tlist_Ctags_Cmd = '/usr/bin/ctags' 
let Tlist_Show_One_File = 1 "��ͬʱ��ʾ����ļ���tag��ֻ��ʾ��ǰ�ļ��� 
let Tlist_Exit_OnlyWindow = 1 "���taglist���������һ�����ڣ����˳�vim 
let Tlist_Use_Right_Window = 1 "���Ҳര������ʾtaglist����
" minibufexpl�����һ������
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
map <F10> <ESC>:lvim /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>
map <F12> <ESC>:lvim /<c-r>=expand("<cword>")<cr>/ *.*<cr>:lw<cr>
augroup filetype
    autocmd! BufRead,BufNewFile BUILD set filetype=blade
augroup end
