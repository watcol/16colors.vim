" Name: palette.vim
" Author: watcol
" License: MIT

" Setup
hi clear
syntax reset
let g:colors_name = 'palette'

" Load Configurations
let s:light = &background is# 'light'
let s:default_config = {
\ 'italic': 1,
\ 'colors': {
\   'fg': {'cterm': '', 'gui': s:light ? '#000000' : '#ffffff'},
\   'bg': {'cterm': '', 'gui': s:light ? '#ffffff' : '#000000'},
\   'fg_gray': {'cterm': s:light ? '7' : '8', 'gui': s:light ? '#555555' : '#aaaaaa'},
\   'bg_gray': {'cterm': s:light ? '15' : '0', 'gui': s:light ? '#aaaaaa' : '#555555'},
\   'cursor_gray': {'cterm': s:light ? '15' : '0', 'gui': s:light ? '#dddddd' : '#222222'},
\   'red': {'cterm': '1', 'gui': '#aa0000'},
\   'green': {'cterm': '2', 'gui': '#00aa00'},
\   'brown': {'cterm': '3', 'gui': '#aa5500'},
\   'blue': {'cterm': '4', 'gui': '#0000aa'},
\   'purple': {'cterm': '5', 'gui': '#aa00aa'},
\   'cyan': {'cterm': '6', 'gui': '#00aaaa'},
\   'yellow': {'cterm': '11', 'gui': '#ffff55'},
\ }
\}

" TODO: Load g:palette

" Colors
let s:reset = 'none'
let s:black = '0'
let s:red = '1'
let s:green = '2'
let s:yellow = '3'
let s:blue = '4'
let s:purple = '5'
let s:cyan = '6'
let s:white = '7'
let s:bright_black = '8'
let s:bright_red = '9'
let s:bright_green = '10'
let s:bright_yellow = '11'
let s:bright_blue = '12'
let s:bright_purple = '13'
let s:bright_cyan = '14'
let s:bright_white = '15'

if &background == "light"
  let s:fg = s:black
  let s:fg_grey = s:white
  let s:bg_grey = s:bright_white
else
  let s:fg = s:white
  let s:fg_grey = s:bright_black
  let s:bg_grey = s:black
endif

" Utility function
function! s:h(group, fg, bg, attr)
  let l:cmd = "hi " . a:group
  if !empty(a:fg)
    let l:cmd = l:cmd . ' ctermfg=' . a:fg
  endif
  if !empty(a:bg)
    let l:cmd = l:cmd . ' ctermbg=' . a:bg
  endif
  if !empty(a:attr)
    let l:cmd = l:cmd . ' cterm=' . a:attr
  endif
  if !empty(a:fg) || !empty(a:bg) || !empty(a:attr)
    execute l:cmd
  end
endfunction

" Editor colors
call s:h('Normal',       '',        '',             '')
call s:h('ColorColumn',  '',        s:bg_grey,      '')
call s:h('Conceal',      s:fg_grey, '',             '')
call s:h('Cursor',       '',        s:fg_grey,      '')
call s:h('CursorIM',     '',        s:fg_grey,      '')
call s:h('CursorColumn', '',        s:bg_grey,      '')
call s:h('CursorLine',   '',        s:bg_grey,      'none')
call s:h('LineNr',       s:fg_grey, '',             '')
call s:h('CursorLineNr', s:reset,   s:bg_grey,      '')
call s:h('VertSplit',    s:bg_grey, s:bg_grey,      '')
call s:h('Folded',       s:fg_grey, s:reset,        'none')
call s:h('FoldColumn',   s:fg_grey, s:bg_grey,      '')
call s:h('Search',       s:yellow,  s:bg_grey,      'none')
call s:h('IncSearch',    s:yellow,  s:bg_grey,      'none')
call s:h('MatchParen',   s:red,     s:reset,        'underline')
call s:h('ModeMsg',      '',        '',             '')
call s:h('ErrorMsg',     s:red,     s:reset,        'none')
call s:h('WarningMsg',   s:yellow,  s:reset,        'none')
call s:h('Question',     s:blue,    '',             '')
call s:h('Title',        s:red,     '',             '')
call s:h('MoreMsg',      s:blue,    '',             '')
call s:h('NonText',      s:bg_grey, '',             '')
call s:h('SpecialKey',   s:bg_grey, '',             'none')
call s:h('Whitespace',   s:bg_grey, '',             'none')
call s:h('Visual',       '',        s:bg_grey,      'none')
call s:h('VisualNOS',    '',        s:bg_grey,      'none')
call s:h('WildMenu',     '',        s:bg_grey,      'none')
call s:h('SignColumn',   '',        s:reset,        'none')
call s:h('Directory',    s:cyan,    '',             'none')

" Popup Menu
call s:h('Pmenu',      s:reset, s:bg_grey, 'none')
call s:h('PmenuSel',   s:reset, s:fg_grey, 'none')
call s:h('PmenuSbar',  '',      s:bg_grey, 'none')
call s:h('PmenuThumb', '',      s:reset,   'reverse')

" Status Line
call s:h('StatusLine',   s:reset,   '',        'none')
call s:h('StatusLineNC', s:fg_grey, '',        'none')
call s:h('TabLine',      s:fg_grey, '',        'none')
call s:h('TabLineSel',   s:reset,   s:bg_grey, 'none')
call s:h('TabLineFill',  s:reset,   '',        'none')

" Standard Syntax
call s:h('Comment',    s:fg_grey,       '',     'italic')
call s:h('Constant',   s:green,         '',      '')
call s:h('String',     s:green,         '',      '')
call s:h('Character',  s:green,         '',      '')
call s:h('Number',     s:yellow,        '',      '')
call s:h('Boolean',    s:yellow,        '',      '')
call s:h('Float',      s:yellow,        '',      '')
call s:h('Identifier', s:bright_yellow, '',      'none')
call s:h('Function',   s:blue,          '',      '')
call s:h('Statement',  s:purple,        '',      '')
call s:h('Operator',   s:blue,          '',      '')
call s:h('Keyword',    s:red,           '',      '')
call s:h('Preproc',    s:purple,        '',      '')
call s:h('Include',    s:blue,          '',      '')
call s:h('PreCondit',  s:yellow,        '',      '')
call s:h('Type',       s:bright_yellow, '',      'none')
call s:h('Special',    '',              '',      '')
call s:h('Delimiter',  s:reset,         '',      '')
call s:h('Underlined', s:blue,          '',      'underline')
call s:h('Ignore',     '',              '',      '')
call s:h('Error',      s:red,           s:reset, 'bold')
call s:h('Todo',       s:purple,        s:reset, '')

" Spell Check
call s:h('SpellBad',   s:red,    s:reset, 'underline')
call s:h('SpellLocal', s:yellow, s:reset, 'underline')
call s:h('SpellCap',   s:yellow, s:reset, 'underline')
call s:h('SpellRare',  s:yellow, s:reset, 'underline')

" Diff highlight
call s:h('DiffAdd',     s:green,         s:reset, '')
call s:h('DiffChange',  s:bright_yellow, s:reset, 'none')
call s:h('DiffDelete',  s:red,           s:reset, '')
call s:h('DiffText',    s:blue,          '',      '')
call s:h('DiffAdded',   s:green,         '',      '')
call s:h('DiffFile',    s:red,           '',      '')
call s:h('DiffNewFile', s:green,         '',      '')
call s:h('DiffLine',    s:blue,          '',      '')
call s:h('DiffRemoved', s:red,           '',      '')

" Gitcommit highlights
call s:h('gitcommitBranch',        s:purple,  '', '')
call s:h('gitcommitHeader',        s:yellow,  '', '')
call s:h('gitcommitSummary',       s:reset,   '', '')
call s:h('gitcommitOverflow',      s:red,     '', '')
call s:h('gitcommitUntrackedFile', s:cyan,    '', '')
call s:h('gitcommitDiscardedFile', s:red,     '', '')
call s:h('gitcommitSelectedFile',  s:green,   '', '')
call s:h('gitcommitUnmergedFile',  s:yellow,  '', '')

" signify, gitgutter, gitsigns
call s:h('SignifySignAdd',    s:green,         '', '')
call s:h('SignifySignChange', s:bright_yellow, '', 'none')
call s:h('SignifySignDelete', s:red,           '', '')
hi link GitGutterAdd    SignifySignAdd
hi link GitGutterChange SignifySignChange
hi link GitGutterDelete SignifySignDelete
hi link GitSignsAdd    SignifySignAdd
hi link GitSignsChange SignifySignChange
hi link GitSignsDelete SignifySignDelete

" ALE
call s:h('ALEError',   s:red,           '', 'underline')
call s:h('ALEWarning', s:bright_yellow, '', 'underline')
call s:h('ALEInfo',    s:green,         '', 'underline')

" vim-lsp
call s:h('LspError',                  s:red,           '',        '')
call s:h('LspErrorText',              s:red,           '',        '')
call s:h('LspErrorHighlight',         s:red,           '',        'underline')
call s:h('LspErrorVirtualText',       s:red,           s:bg_grey, '')
call s:h('LspWarning',                s:bright_yellow, '',        'none')
call s:h('LspWarningText',            s:bright_yellow, '',        'none')
call s:h('LspWarningHighlight',       s:bright_yellow, '',        'underline')
call s:h('LspWarningVirtualText',     s:bright_yellow, s:bg_grey, 'none')
call s:h('LspInformation',            s:cyan,          '',        '')
call s:h('LspInformationText',        s:cyan,          '',        '')
call s:h('LspInformationHighlight',   s:cyan,          '',        'underline')
call s:h('LspInformationVirtualText', s:cyan,          s:bg_grey, '')
call s:h('LspHint',                   s:green,         '',        '')
call s:h('LspHintText',               s:green,         '',        '')
call s:h('LspHintHighlight',          s:green,         '',        'underline')
call s:h('LspHintVirtualText',        s:green,         s:bg_grey, '')
call s:h('LspCodeActionText',         s:purple,        '',        '')

" Neovim built-in LSP
call s:h('LspDiagnosticsDefaultError',          s:red,           '', '')
call s:h('LspDiagnosticsDefaultWarning',        s:bright_yellow, '', 'none')
call s:h('LspDiagnosticsDefaultInformation',    s:cyan,          '', '')
call s:h('LspDiagnosticsDefaultHint',           s:green,         '', '')
call s:h('LspDiagnosticsUnderlinedError',       s:red,           '', 'underline')
call s:h('LspDiagnosticsUnderlinedWarning',     s:bright_yellow, '', 'underline')
call s:h('LspDiagnosticsUnderlinedInformation', s:cyan,          '', 'underline')
call s:h('LspDiagnosticsUnderlinedHint',        s:green,         '', 'underline')

" Tree-sitter
call s:h('TSAnnotation',         s:red,           '', '')
call s:h('TSAttribute',          s:bright_yellow, '', '')
call s:h('TSBoolean',            s:yellow,        '', '')
call s:h('TSCharacter',          s:green,         '', '')
call s:h('TSComment',            s:fg_grey,       '', 'italic')
call s:h('TSConditional',        s:purple,        '', '')
call s:h('TSConstBuiltin',       s:bright_yellow, '', '')
call s:h('TSConstMacro',         s:cyan,          '', '')
call s:h('TSConstant',           s:green,         '', '')
call s:h('TSConstructor',        s:reset,         '', '')
call s:h('TSEmphasis',           s:reset,         '', 'bold')
call s:h('TSError',              s:red,           '', '')
call s:h('TSException',          s:purple,        '', '')
call s:h('TSField',              s:reset,         '', '')
call s:h('TSFloat',              s:yellow,        '', '')
call s:h('TSFuncBuiltin',        s:cyan,          '', '')
call s:h('TSFuncMacro',          s:purple,        '', '')
call s:h('TSFunction',           s:blue,          '', '')
call s:h('TSInclude',            s:red,           '', '')
call s:h('TSKeyword',            s:red,           '', '')
call s:h('TSKeywordFunction',    s:red,           '', '')
call s:h('TSLabel',              s:purple,        '', '')
call s:h('TSMethod',             s:blue,          '', '')
call s:h('TSNamespace',          s:reset,         '', '')
call s:h('TSNumber',             s:yellow,        '', '')
call s:h('TSOperator',           s:blue,          '', '')
call s:h('TSParameter',          s:reset,         '', '')
call s:h('TSParameterReference', s:reset,         '', '')
call s:h('TSProperty',           s:red,           '', '')
call s:h('TSPunctBracket',       s:reset,         '', '')
call s:h('TSPunctDelimiter',     s:reset,         '', '')
call s:h('TSPunctSpecial',       s:bright_yellow, '', '')
call s:h('TSRepeat',             s:purple,        '', '')
call s:h('TSString',             s:green,         '', '')
call s:h('TSStringEscape',       s:blue,          '', '')
call s:h('TSStringRegex',        s:blue,          '', '')
call s:h('TSStructure',          s:red,           '', '')
call s:h('TSTag',                s:red,           '', '')
call s:h('TSTagDelimiter',       s:purple,        '', '')
call s:h('TSText',               s:green,         '', '')
call s:h('TSType',               s:bright_yellow, '', '')
call s:h('TSTypeBuiltin',        s:bright_yellow, '', '')
call s:h('TSUnderline',          '',              '', 'underline')
call s:h('TSURI',                s:blue,          '', 'underline')
call s:h('TSVariable',           s:reset,         '', '')
call s:h('TSVariableBuiltin',    s:green,         '', '')
