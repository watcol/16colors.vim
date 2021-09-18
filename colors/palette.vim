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
\   'fg': {'cterm': 'none', 'gui': s:light ? '#000000' : '#ffffff'},
\   'bg': {'cterm': 'none', 'gui': s:light ? '#ffffff' : '#000000'},
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
\ },
\ 'categories': {
\   'NormalFg': 'fg',
\   'NormalBg': 'bg',
\   'Cursor': 'cursor_gray',
\   'Background': 'bg_gray',
\   'Selected': 'fg_gray',
\   'Quiet': 'fg_gray',
\   'VeryQuiet': 'bg_gray',
\   'Emphasis': 'red',
\   'Search': 'brown',
\   'Error': 'red',
\   'Warning': 'yellow',
\   'Information': 'cyan',
\   'Hint': 'green',
\   'Add': 'green',
\   'Change': 'yellow',
\   'Delete': 'red',
\   'String': 'green',
\   'Escape': 'blue',
\   'Literal': 'brown',
\   'Constant': 'green',
\   'Variable': 'fg',
\   'Function': 'blue',
\   'Keyword': 'red',
\   'Statement': 'purple',
\   'Operator': 'blue',
\   'Macro': 'purple',
\   'Type': 'yellow',
\   'Variant': 'green',
\   'Directory': 'cyan',
\   'Header': 'brown',
\   'Marker': 'purple',
\ }
\}

" TODO: Load g:palette
let s:config = s:default_config
let s:italic = s:config.italic ? 'italic' : ''

" Utility function
function! s:h(group, fg, bg, attr)
  let l:cmd = "hi " . a:group
  if !empty(a:fg)
    let l:fg = s:config.colors[s:config.categories[a:fg]]
    let l:cmd = l:cmd . ' ctermfg=' . l:fg.cterm . ' guifg=' . l:fg.gui
  endif
  if !empty(a:bg)
    let l:bg = s:config.colors[s:config.categories[a:bg]]
    let l:cmd = l:cmd . ' ctermbg=' . l:bg.cterm . ' guibg=' . l:bg.gui
  endif
  if !empty(a:attr)
    let l:cmd = l:cmd . ' cterm=' . a:attr . ' gui=' . a:attr
  endif
  if !empty(a:fg) || !empty(a:bg) || !empty(a:attr)
    execute l:cmd
  end
endfunction

" Editor colors
call s:h('Normal',       'NormalFg',    'NormalBg',   '')
call s:h('ColorColumn',  '',            'Background', '')
call s:h('Conceal',      'Quiet',       '',           '')
call s:h('Cursor',       '',            'Background', '')
call s:h('CursorIM',     '',            'Background', '')
call s:h('CursorColumn', '',            'Cursor',     '')
call s:h('CursorLine',   '',            'Cursor',     'none')
call s:h('LineNr',       'Quiet',       'NormalBg',   '')
call s:h('CursorLineNr', 'NormalFg',    'Cursor',     '')
call s:h('VertSplit',    'Cursor',      'Cursor',     '')
call s:h('Folded',       'Quiet',       'NormalBg',   s:italic)
call s:h('FoldColumn',   'Quiet',       'Background', '')
call s:h('Search',       'Search',      'Background', 'none')
call s:h('IncSearch',    'Search',      'Background', 'none')
call s:h('MatchParen',   'Emphasis',    'NormalBg',   'underline')
call s:h('ModeMsg',      '',            '',           '')
call s:h('ErrorMsg',     'Error',       'NormalBg',   'none')
call s:h('WarningMsg',   'Warning',     'NormalBg',   'none')
call s:h('Question',     'Information', '',           '')
call s:h('Title',        'Header',      '',           '')
call s:h('MoreMsg',      'Information', '',           '')
call s:h('NonText',      'VeryQuiet',   '',           '')
call s:h('SpecialKey',   'VeryQuiet',   '',           'none')
call s:h('Whitespace',   'VeryQuiet',   '',           'none')
call s:h('Visual',       '',            'Background', 'none')
call s:h('VisualNOS',    '',            'Background', 'none')
call s:h('WildMenu',     '',            'Background', 'none')
call s:h('SignColumn',   '',            'NormalBg',   'none')
call s:h('Directory',    'Directory',   '',           'none')

" Popup Menu
call s:h('Pmenu',      'NormalFg', 'Background', 'none')
call s:h('PmenuSel',   'NormalFg', 'Selected',   'none')
call s:h('PmenuSbar',  '',         'Background', 'none')
call s:h('PmenuThumb', '',         'NormalBg',   'reverse')

" Status Line
call s:h('StatusLine',   'NormalFg', '',           'none')
call s:h('StatusLineNC', 'Quiet',    '',           'none')
call s:h('TabLine',      'Quiet',    '',           'none')
call s:h('TabLineSel',   'Quiet',    'Background', 'none')
call s:h('TabLineFill',  'NormalFg', '',           'none')

" Standard Syntax
call s:h('Comment',    'Quiet',     '',         s:italic)
call s:h('Constant',   'Constant',  '',         '')
call s:h('String',     'String',    '',         '')
call s:h('Character',  'String',    '',         '')
call s:h('Number',     'Literal',   '',         '')
call s:h('Boolean',    'Literal',   '',         '')
call s:h('Float',      'Literal',   '',         '')
call s:h('Identifier', 'Variable',  '',         'none')
call s:h('Function',   'Function',  '',         '')
call s:h('Statement',  'Statement', '',         '')
call s:h('Operator',   'Operator',  '',         '')
call s:h('Keyword',    'Keyword',   '',         '')
call s:h('Preproc',    'Macro',     '',         '')
call s:h('Type',       'Type',      '',         'none')
call s:h('Special',    '',          '',         '')
call s:h('Delimiter',  'NormalFg',  '',         '')
call s:h('Underlined', 'Emphasis',  '',         'underline')
call s:h('Ignore',     '',          '',         '')
call s:h('Error',      'Error',     'NormalBg', 'bold')
call s:h('Todo',       'Marker',    'NormalBg', '')

" Spell Check
call s:h('SpellBad',   'Error',   'NormalBg', 'underline')
call s:h('SpellLocal', 'Warning', 'NormalBg', 'underline')
call s:h('SpellCap',   'Warning', 'NormalBg', 'underline')
call s:h('SpellRare',  'Warning', 'NormalBg', 'underline')

" Diff highlight
call s:h('DiffAdd',     'Add',          'NormalBg', '')
call s:h('DiffChange',  'Change',       'NormalBg', 'none')
call s:h('DiffDelete',  'Delete',       'NormalBg', '')
call s:h('DiffText',    'Information',  '',         '')
call s:h('DiffAdded',   'Add',          '',         '')
call s:h('DiffFile',    'Emphasis',     '',         '')
call s:h('DiffNewFile', 'Add',          '',         '')
call s:h('DiffLine',    'Information',  '',         '')
call s:h('DiffRemoved', 'Delete',       '',         '')

" Gitcommit highlights
call s:h('gitcommitBranch',        'Marker',      '', '')
call s:h('gitcommitHeader',        'Header',      '', '')
call s:h('gitcommitSummary',       'NormalFg',    '', '')
call s:h('gitcommitOverflow',      'Emphasis',    '', '')
call s:h('gitcommitUntrackedFile', 'Warning',     '', '')
call s:h('gitcommitDiscardedFile', 'Emphasis',    '', '')
call s:h('gitcommitSelectedFile',  'Information', '', '')
call s:h('gitcommitUnmergedFile',  'Warning',     '', '')

" signify, gitgutter, gitsigns
call s:h('SignifySignAdd',    'Add',    '', '')
call s:h('SignifySignChange', 'Change', '', '')
call s:h('SignifySignDelete', 'Delete', '', '')
hi link GitGutterAdd    SignifySignAdd
hi link GitGutterChange SignifySignChange
hi link GitGutterDelete SignifySignDelete
hi link GitSignsAdd    SignifySignAdd
hi link GitSignsChange SignifySignChange
hi link GitSignsDelete SignifySignDelete

" ALE
call s:h('ALEError',   'Error',       '', 'underline')
call s:h('ALEWarning', 'Warning',     '', 'underline')
call s:h('ALEInfo',    'Information', '', 'underline')

" vim-lsp
call s:h('LspError',                  'Error',       '',           '')
call s:h('LspErrorText',              'Error',       '',           '')
call s:h('LspErrorHighlight',         'Error',       '',           'underline')
call s:h('LspErrorVirtualText',       'Error',       'Background', '')
call s:h('LspWarning',                'Warning',     '',           'none')
call s:h('LspWarningText',            'Warning',     '',           'none')
call s:h('LspWarningHighlight',       'Warning',     '',           'underline')
call s:h('LspWarningVirtualText',     'Warning',     'Background', '')
call s:h('LspInformation',            'Information', '',           '')
call s:h('LspInformationText',        'Information', '',           '')
call s:h('LspInformationHighlight',   'Information', '',           'underline')
call s:h('LspInformationVirtualText', 'Information', 'Background', '')
call s:h('LspHint',                   'Hint',        '',           '')
call s:h('LspHintText',               'Hint',        '',           '')
call s:h('LspHintHighlight',          'Hint',        '',           'underline')
call s:h('LspHintVirtualText',        'Hint',        'Background', '')
call s:h('LspCodeActionText',         'Marker',      '',           '')

" Neovim built-in LSP
call s:h('LspDiagnosticsDefaultError',          'Error',       '', '')
call s:h('LspDiagnosticsDefaultWarning',        'Warning',     '', '')
call s:h('LspDiagnosticsDefaultInformation',    'Information', '', '')
call s:h('LspDiagnosticsDefaultHint',           'Hint',        '', '')
call s:h('LspDiagnosticsUnderlinedError',       'Error',       '', 'underline')
call s:h('LspDiagnosticsUnderlinedWarning',     'Warning',     '', 'underline')
call s:h('LspDiagnosticsUnderlinedInformation', 'Information', '', 'underline')
call s:h('LspDiagnosticsUnderlinedHint',        'Hint',        '', 'underline')

" Tree-sitter
call s:h('TSAnnotation',         'Keyword',   '', '')
call s:h('TSAttribute',          'Macro',     '', '')
call s:h('TSBoolean',            'Literal',   '', '')
call s:h('TSCharacter',          'String',    '', '')
call s:h('TSComment',            'Quiet',     '', s:italic)
call s:h('TSConditional',        'Statement', '', '')
call s:h('TSConstBuiltin',       'Constant',  '', '')
call s:h('TSConstMacro',         'Macro',     '', '')
call s:h('TSConstant',           'Constant',  '', '')
call s:h('TSConstructor',        'NormalFg',  '', '')
call s:h('TSEmphasis',           '',          '', 'bold')
call s:h('TSError',              'Error',     '', '')
call s:h('TSException',          'Statement', '', '')
call s:h('TSField',              'NormalFg',  '', '')
call s:h('TSFloat',              'Literal',   '', '')
call s:h('TSFuncBuiltin',        'Macro',     '', '')
call s:h('TSFuncMacro',          'Macro',     '', '')
call s:h('TSFunction',           'Function',  '', '')
call s:h('TSInclude',            'Macro',     '', '')
call s:h('TSKeyword',            'Keyword',   '', '')
call s:h('TSKeywordFunction',    'Keyword',   '', '')
call s:h('TSLabel',              'Statement', '', '')
call s:h('TSMethod',             'Function',  '', '')
call s:h('TSNamespace',          'NormalFg',  '', '')
call s:h('TSNumber',             'Literal',   '', '')
call s:h('TSOperator',           'Operator',  '', '')
call s:h('TSParameter',          'NormalFg',  '', '')
call s:h('TSParameterReference', 'NormalFg',  '', '')
call s:h('TSProperty',           'NormalFg',  '', '')
call s:h('TSPunctBracket',       'NormalFg',  '', '')
call s:h('TSPunctDelimiter',     'NormalFg',  '', '')
call s:h('TSPunctSpecial',       'NormalFg',  '', '')
call s:h('TSRepeat',             'Statement', '', '')
call s:h('TSString',             'String',    '', '')
call s:h('TSStringEscape',       'Escape',    '', '')
call s:h('TSStringRegex',        'Escape',    '', '')
call s:h('TSStructure',          'Keyword',   '', '')
call s:h('TSTag',                'Keyword',   '', '')
call s:h('TSTagDelimiter',       'NormalFg',  '', '')
call s:h('TSText',               'String',    '', '')
call s:h('TSType',               'Type',      '', '')
call s:h('TSTypeBuiltin',        'Type',      '', '')
call s:h('TSUnderline',          '',          '', 'underline')
call s:h('TSURI',                'Emphasis',  '', 'underline')
call s:h('TSVariable',           'Variable',  '', '')
call s:h('TSVariableBuiltin',    'Constant',  '', '')
