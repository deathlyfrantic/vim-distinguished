" Author: Zandr Martin <zandrmartin+vim@gmail.com>
" Source repository: https://github.com/deathlyfrantic/vim-distinguished
"
" Original theme by:
" Author: Kim Silkebækken <kim.silkebaekken+vim@gmail.com>
" Source repository: https://github.com/Lokaltog/vim-distinguished

" Palette {{{
" reference: http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
" don't pay too much attention the names of the groups,
" they're very approximate
let s:black = [16, '#000000']
let s:white = [231, '#ffffff']
" red {{{
let s:red = [
    \ [ 52, '#5f0000'],
    \ [ 88, '#870000'],
    \ [124, '#af0000'],
    \ [160, '#d70000'],
    \ [196, '#ff0000'],
    \ ]
" }}}
" orange {{{
let s:orange = [
    \ [ 94, '#875f00'],
    \ [130, '#af5f00'],
    \ [166, '#d75f00'],
    \ [172, '#d78700'],
    \ [202, '#ff5f00'],
    \ [208, '#ff8700'],
    \ [214, '#ffaf00'],
    \ [215, '#ffaf5f'],
    \ ]
" }}}
" yellow {{{
let s:yellow = [
    \ [186, '#d7d787'],
    \ [220, '#ffd700'],
    \ [221, '#ffd75f'],
    \ [222, '#ffd787'],
    \ [227, '#ffff5f'],
    \ [228, '#ffff87'],
    \ ]
" }}}
" green {{{
let s:green = [
    \ [ 22, '#005f00'],
    \ [ 65, '#5f875f'],
    \ [112, '#87d700'],
    \ [149, '#afd75f'],
    \ [150, '#afd787'],
    \ ]
" }}}
" blue {{{
let s:blue = [
    \ [ 25, '#005faf'],
    \ [ 31, '#0087af'],
    \ [ 66, '#5f8787'],
    \ [ 67, '#5f87af'],
    \ [ 68, '#5f87d7'],
    \ [ 74, '#5fafd7'],
    \ [109, '#87afaf'],
    \ [152, '#afd7d7'],
    \ ]
" }}}
" pink {{{
let s:pink = [
    \ [131, '#af5f5f'],
    \ [137, '#af875f'],
    \ [138, '#af8787'],
    \ [143, '#afaf5f'],
    \ [173, '#d7875f'],
    \ [179, '#d7af5f'],
    \ [180, '#d7af87'],
    \ [187, '#d7d7af'],
    \ [209, '#ff875f'],
    \ ]
" }}}
" gray {{{
let s:gray = [
    \ [232, '#080808'],
    \ [233, '#121212'],
    \ [234, '#1c1c1c'],
    \ [235, '#262626'],
    \ [236, '#303030'],
    \ [237, '#3a3a3a'],
    \ [238, '#444444'],
    \ [239, '#4e4e4e'],
    \ [240, '#585858'],
    \ [242, '#666666'],
    \ [243, '#767676'],
    \ [244, '#808080'],
    \ [245, '#8a8a8a'],
    \ [246, '#949494'],
    \ [247, '#9e9e9e'],
    \ [248, '#a8a8a8'],
    \ [145, '#afafaf'],
    \ [249, '#b2b2b2'],
    \ [250, '#bcbcbc'],
    \ [253, '#dadada'],
    \ [255, '#eeeeee'],
    \ ]
" }}}
" }}}

" initialization {{{
let g:colors_name = 'distinguished'

if !has('gui_running') && !has('nvim')
    if &t_Co != 256
        echoe 'The ' . g:colors_name . ' color scheme requires gvim or a 256-color terminal'
        finish
    endif
endif

set background=dark

highlight  clear
if exists('syntax_on')
    syntax reset
endif

" set option defaults {{{
let s:options = [
    \ 'g:distinguished_transparent_background',
    \ 'g:distinguished_rainbow_parens',
    \ 'g:distinguished_nerdtree_highlight',
    \ ]
for s:opt in s:options
    if !exists(s:opt)
        exec 'let ' . s:opt . ' = 0'
    endif
endfor
" }}}

" transparent background {{{
if g:distinguished_transparent_background
    let s:bg = ['NONE', 'NONE']
else
    let s:bg = deepcopy(s:black)
endif
" }}}

" rainbow parentheses {{{
if g:distinguished_rainbow_parens
    let g:rbpt_colorpairs = [
        \ [ s:green[4][0],  s:green[4][1]],
        \ [s:yellow[5][0], s:yellow[5][1]],
        \ [s:orange[7][0], s:orange[7][1]],
        \ [   s:red[4][0],    s:red[4][1]],
        \ [  s:pink[0][0],   s:pink[0][1]],
        \ [  s:blue[0][0],   s:blue[0][1]],
        \ [ s:green[0][0],  s:green[0][1]],
        \ [s:yellow[0][0], s:yellow[0][1]],
        \ [s:orange[0][0], s:orange[0][1]],
        \ [   s:red[2][0],    s:red[2][1]],
        \ [  s:pink[4][0],   s:pink[4][1]],
        \ [  s:blue[3][0],   s:blue[3][1]],
        \ [ s:green[2][0],  s:green[2][1]],
        \ [s:yellow[3][0], s:yellow[3][1]],
        \ [s:orange[3][0], s:orange[3][1]],
        \ [   s:red[3][0],    s:red[3][1]],
        \ ]
endif
" }}}

" NERDTree {{{
" file highlighting idea from https://github.com/scrooloose/nerdtree/issues/433
if g:distinguished_nerdtree_highlight
    let s:nerdtree_dict = {
        \ 'c'       : [s:red[3]     , ''],
        \ 'coffee'  : [s:orange[0]  , ''],
        \ 'conf'    : [s:orange[2]  , ''],
        \ 'config'  : [s:orange[2]  , ''],
        \ 'css'     : [s:green[1]   , ''],
        \ 'csv'     : [s:gray[10]   , ''],
        \ 'db'      : [s:gray[12]   , ''],
        \ 'django'  : [s:blue[7]    , ''],
        \ 'el'      : [s:yellow[5]  , ''],
        \ 'h'       : [s:red[2]     , ''],
        \ 'html'    : [s:blue[7]    , ''],
        \ 'ini'     : [s:yellow[1]  , ''],
        \ 'js'      : [s:blue[2]    , ''],
        \ 'json'    : [s:blue[2]    , ''],
        \ 'mako'    : [s:blue[7]    , ''],
        \ 'md'      : [s:blue[4]    , ''],
        \ 'php'     : [s:pink[1]    , ''],
        \ 'py'      : [s:pink[0]    , ''],
        \ 'rs'      : [s:pink[4]    , ''],
        \ 'sass'    : [s:green[2]   , ''],
        \ 'scss'    : [s:green[2]   , ''],
        \ 'sh'      : [s:green[0]   , ''],
        \ 'sql'     : [s:gray[12]   , ''],
        \ 'txt'     : [s:gray[15]   , ''],
        \ 'vim'     : [s:orange[6]  , ''],
        \ 'yml'     : [s:green[4]   , ''],
        \ }
    for [ext, var] in items(s:nerdtree_dict)
        exec 'autocmd FileType nerdtree highlight nerdtree-file-' . ext
            \ . ' ctermfg=' . (type(var[0]) == type([]) ? var[0][0] : 'NONE')
            \ . ' ctermbg=' . (type(var[1]) == type([]) ? var[1][0] : 'NONE')
            \ . '   guifg=' . (type(var[0]) == type([]) ? var[0][1] : 'NONE')
            \ . '   guibg=' . (type(var[1]) == type([]) ? var[1][1] : 'NONE')
        exec 'autocmd FileType nerdtree syn match nerdtree-file-' . ext .' #^\s\+.*' . ext . '$#'
    endfor
endif
" }}}
" }}}

" color dict {{{
"     | Highlight group      | FG          | BG         | Attribute |
"     |----------------------|-------------|------------|-----------|
let s:color_list = [
    \ ['Normal'               , s:white    , s:bg       , ''       ],
    \ ['Visual'               , s:white    , s:blue[0]  , ''       ],
    \
    \ ['Cursor'               , ''         , ''         , ''       ],
    \ ['lCursor'              , ''         , ''         , ''       ],
    \
    \ ['CursorLine'           , ''         , s:gray[4]  , ''       ],
    \ ['CursorLineNr'         , s:white    , s:gray[8]  , ''       ],
    \ ['CursorColumn'         , s:white    , s:gray[5]  , ''       ],
    \
    \ ['Folded'               , s:gray[17] , s:gray[2]  , ''       ],
    \ ['FoldColumn'           , s:gray[10] , s:gray[2]  , ''       ],
    \ ['SignColumn'           , s:white    , s:gray[3]  , 'bold'   ],
    \ ['ColorColumn'          , ''         , s:gray[1]  , ''       ],
    \
    \ ['StatusLine'           , s:white    , s:gray[4]  , 'bold'   ],
    \ ['StatusLineNC'         , s:gray[11] , s:gray[0]  , ''       ],
    \
    \ ['LineNr'               , s:gray[10] , s:gray[3]  , ''       ],
    \ ['VertSplit'            , s:gray[8]  , ''         , ''       ],
    \
    \ ['WildMenu'             , s:gray[2]  , s:white    , ''       ],
    \ ['Directory'            , s:pink[3]  , ''         , 'bold'   ],
    \ ['Underlined'           , s:orange[1], ''         , ''       ],
    \
    \ ['Question'             , s:blue[5]  , ''         , 'bold'   ],
    \ ['MoreMsg'              , s:orange[6], ''         , 'bold'   ],
    \ ['WarningMsg'           , s:orange[4], ''         , 'bold'   ],
    \ ['ErrorMsg'             , s:red[4]   , ''         , 'bold'   ],
    \
    \ ['Comment'              , s:gray[10] , ''         , 'italic' ],
    \ ['vimCommentTitleLeader', s:gray[18] , ''         , 'italic' ],
    \ ['vimCommentTitle'      , s:gray[18] , ''         , 'italic' ],
    \ ['vimCommentString'     , s:gray[12] , ''         , 'italic' ],
    \
    \ ['TabLine'              , s:white    , s:gray[6]  , ''       ],
    \ ['TabLineSel'           , s:gray[20] , ''         , 'bold'   ],
    \ ['TabLineFill'          , s:gray[8]  , s:gray[6]  , ''       ],
    \ ['TabLineNumber'        , s:red[3]   , s:gray[6]  , 'bold'   ],
    \ ['TabLineClose'         , s:gray[12] , s:gray[6]  , 'bold'   ],
    \
    \ ['SpellCap'             , s:white    , s:blue[1]  , 'bold'   ],
    \
    \ ['SpecialKey'           , s:gray[7]  , ''         , ''       ],
    \ ['NonText'              , s:red[1]   , s:bg       , ''       ],
    \ ['MatchParen'           , s:white    , s:blue[0]  , 'bold'   ],
    \
    \ ['Constant'             , s:pink[1]  , ''         , 'bold'   ],
    \ ['Special'              , s:green[4] , ''         , ''       ],
    \ ['Identifier'           , s:blue[2]  , ''         , 'bold'   ],
    \ ['Statement'            , s:yellow[0], ''         , 'bold'   ],
    \ ['PreProc'              , s:gray[14] , ''         , ''       ],
    \ ['Type'                 , s:blue[3]  , ''         , 'bold'   ],
    \ ['String'               , s:pink[3]  , ''         , ''       ],
    \ ['Number'               , s:pink[4]  , ''         , ''       ],
    \ ['Define'               , s:pink[4]  , ''         , ''       ],
    \ ['Error'                , s:orange[5], s:red[2]   , ''       ],
    \ ['Function'             , s:pink[5]  , ''         , ''       ],
    \ ['Include'              , s:pink[4]  , ''         , ''       ],
    \ ['PreCondit'            , s:pink[4]  , ''         , ''       ],
    \ ['Keyword'              , s:pink[4]  , ''         , ''       ],
    \ ['Search'               , s:white    , s:pink[0]  , ''       ],
    \ ['Title'                , s:white    , ''         , ''       ],
    \ ['Delimiter'            , s:gray[13] , ''         , ''       ],
    \ ['StorageClass'         , s:pink[7]  , ''         , ''       ],
    \ ['Operator'             , s:pink[6]  , ''         , ''       ],
    \
    \ ['TODO'                 , s:yellow[5], s:orange[0], 'bold'   ],
    \
    \ ['SyntasticWarning'     , s:yellow[1], s:orange[0], ''       ],
    \ ['SyntasticError'       , s:orange[4], s:red[0]   , ''       ],
    \
    \ ['Pmenu'                , s:gray[10] , s:gray[3]  , ''       ],
    \ ['PmenuSel'             , s:white    , s:gray[8]  , ''       ],
    \ ['PmenuSbar'            , s:gray[10] , s:gray[8]  , ''       ],
    \ ['PmenuThumb'           , ''         , s:gray[12] , ''       ],
    \
    \ ['phpEOL'               , s:gray[12] , ''         , ''       ],
    \ ['phpStringDelim'       , s:orange[0], ''         , ''       ],
    \ ['phpDelimiter'         , s:red[3]   , ''         , ''       ],
    \ ['phpFunctions'         , s:yellow[2], ''         , 'bold'   ],
    \ ['phpBoolean'           , s:orange[3], ''         , 'bold'   ],
    \ ['phpOperator'          , s:orange[7], ''         , ''       ],
    \ ['phpMemberSelector'    , s:pink[2]  , ''         , 'bold'   ],
    \ ['phpParent'            , s:yellow[4], ''         , ''       ],
    \
    \ ['PHPClassTag'          , s:gray[19] , ''         , ''       ],
    \ ['PHPInterfaceTag'      , s:gray[19] , ''         , ''       ],
    \ ['PHPFunctionTag'       , s:yellow[3], ''         , 'bold'   ],
    \
    \ ['pythonDocString'      , s:gray[8]  , ''         , ''       ],
    \ ['pythonDocStringTitle' , s:gray[12] , ''         , ''       ],
    \ ['pythonDot'            , s:pink[2]  , ''         , 'bold'   ],
    \ ['pythonRun'            , s:green[1] , ''         , ''       ],
    \ ['pythonBuiltinObj'     , s:blue[3]  , ''         , 'bold'   ],
    \ ['pythonSelf'           , s:gray[18] , ''         , 'bold'   ],
    \ ['pythonFunction'       , s:pink[5]  , ''         , 'bold'   ],
    \ ['pythonClass'          , s:yellow[2], ''         , 'bold'   ],
    \ ['pythonExClass'        , s:orange[1], ''         , ''       ],
    \ ['pythonException'      , s:orange[1], ''         , 'bold'   ],
    \ ['pythonOperator'       , s:yellow[0], ''         , ''       ],
    \ ['pythonPreCondit'      , s:blue[7]  , ''         , 'bold'   ],
    \ ['pythonDottedName'     , s:orange[2], ''         , ''       ],
    \ ['pythonDecorator'      , s:red[2]   , ''         , 'bold'   ],
    \
    \ ['PythonInterfaceTag'   , s:blue[6]  , ''         , ''       ],
    \ ['PythonClassTag'       , s:yellow[2], ''         , ''       ],
    \ ['PythonFunctionTag'    , s:blue[6]  , ''         , ''       ],
    \ ['PythonVariableTag'    , s:gray[19] , ''         , ''       ],
    \ ['PythonMemberTag'      , s:gray[16] , ''         , ''       ],
    \
    \ ['CTagsImport'          , s:blue[6]  , ''         , ''       ],
    \ ['CTagsClass'           , s:yellow[2], ''         , ''       ],
    \ ['CTagsFunction'        , s:blue[6]  , ''         , ''       ],
    \ ['CTagsGlobalVariable'  , s:gray[19] , ''         , ''       ],
    \ ['CTagsMember'          , s:gray[16] , ''         , ''       ],
    \
    \ ['xmlTag'               , s:green[3] , ''         , 'bold'   ],
    \ ['xmlTagName'           , s:gray[18] , ''         , ''       ],
    \ ['xmlEndTag'            , s:pink[8]  , ''         , 'bold'   ],
    \
    \ ['cssImportant'         , s:orange[2], ''         , 'bold'   ],
    \
    \ ['DiffAdd'              , s:green[2] , s:green[0] , ''       ],
    \ ['DiffChange'           , s:yellow[1], s:orange[0], ''       ],
    \ ['DiffDelete'           , s:red[3]   , ''         , ''       ],
    \ ['DiffText'             , s:yellow[1], s:orange[0], 'reverse'],
    \
    \ ['GitGutterAdd'         , s:green[2] , s:gray[3]  , ''       ],
    \ ['GitGutterChange'      , s:yellow[4], s:gray[3]  , ''       ],
    \ ['GitGutterDelete'      , s:red[4]   , s:gray[3]  , ''       ],
    \ ['GitGutterChangeDelete', s:yellow[4], s:gray[3]  , ''       ],
    \
    \ ['diffLine'             , s:blue[4]  , ''         , 'bold'   ],
    \ ['diffFile'             , s:gray[9]  , ''         , ''       ],
    \ ['diffNewFile'          , s:gray[9]  , ''         , ''       ],
    \ ]
" }}}

for var in s:color_list
    exec 'hi ' . var[0]
        \ . ' ctermfg=' . (type(var[1]) == type([]) ? var[1][0] : 'NONE')
        \ . ' ctermbg=' . (type(var[2]) == type([]) ? var[2][0] : 'NONE')
        \ . '   cterm=' . (     var[3]  !=      ''  ? var[3]    : 'NONE')
        \ . '   guifg=' . (type(var[1]) == type([]) ? var[1][1] : 'NONE')
        \ . '   guibg=' . (type(var[2]) == type([]) ? var[2][1] : 'NONE')
        \ . '     gui=' . (     var[3]  !=      ''  ? var[3]    : 'NONE')
endfor

hi link Conceal            Comment

hi link htmlTag            xmlTag
hi link htmlTagName        xmlTagName
hi link htmlEndTag         xmlEndTag

hi link phpCommentTitle    vimCommentTitle
hi link phpDocTags         vimCommentString
hi link phpDocParam        vimCommentTitle

hi link diffAdded          DiffAdd
hi link diffChanged        DiffChange
hi link diffRemoved        DiffDelete
" vim: foldmethod=marker
