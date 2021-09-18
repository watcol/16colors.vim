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
\ },
\ 'highlights': {
  \ 'Normal': {'fg': 'NormalFg', 'bg': 'NormalBg'},
  \ 'ColorColumn': {'bg': 'Background'},
  \ 'Conceal': {'fg': 'Quiet'},
  \ 'Cursor': {'bg': 'Background'},
  \ 'CursorIM': {'bg': 'Background'},
  \ 'CursorColumn': {'bg': 'Cursor'},
  \ 'CursorLine': {'bg': 'Cursor', 'attrs': ['none']},
  \ 'LineNr': {'fg': 'Quiet', 'bg': 'NormalBg'},
  \ 'CursorLineNr': {'fg': 'NormalFg', 'bg': 'Cursor'},
  \ 'VertSplit': {'fg': 'Cursor', 'bg': 'Cursor'},
  \ 'Folded': {'fg': 'Quiet', 'bg': 'NormalBg', 'attrs': ['italic']},
  \ 'FoldColumn': {'fg': 'Quiet', 'bg': 'Background'},
  \ 'Search': {'fg': 'Search', 'bg': 'Background', 'attrs': ['none']},
  \ 'IncSearch': {'fg': 'Search', 'bg': 'Background', 'attrs': ['none']},
  \ 'MatchParen': {'fg': 'Emphasis', 'bg': 'NormalBg', 'attrs': ['underline']},
  \ 'ErrorMsg': {'fg': 'Error', 'bg': 'NormalBg', 'attrs': ['none']},
  \ 'WarningMsg': {'fg': 'Warning', 'bg': 'NormalBg', 'attrs': ['none']},
  \ 'Question': {'fg': 'Information'},
  \ 'Title': {'fg': 'Header'},
  \ 'MoreMsg': {'fg': 'Information'},
  \ 'NonText': {'fg': 'VeryQuiet'},
  \ 'SpecialKey': {'fg': 'VeryQuiet', 'attrs': ['none']},
  \ 'Whitespace': {'fg': 'VeryQuiet', 'attrs': ['none']},
  \ 'Visual': {'bg': 'Background', 'attrs': ['none']},
  \ 'VisualNOS': {'bg': 'Background', 'attrs': ['none']},
  \ 'WildMenu': {'bg': 'Background', 'attrs': ['none']},
  \ 'SignColumn': {'bg': 'NormalBg', 'attrs': ['none']},
  \ 'Directory': {'fg': 'Directory', 'attrs': ['none']},
  \ 'Pmenu': {'fg': 'NormalFg', 'bg': 'Background', 'attrs': ['none']},
  \ 'PmenuSel': {'fg': 'NormalFg', 'bg': 'Selected', 'attrs': ['none']},
  \ 'PmenuSbar': {'bg': 'Background', 'attrs': ['none']},
  \ 'PmenuThumb': {'bg': 'NormalBg', 'attrs': ['reverse']},
  \ 'StatusLine': {'fg': 'NormalFg', 'attrs': ['none']},
  \ 'StatusLineNC': {'fg': 'Quiet', 'attrs': ['none']},
  \ 'TabLine': {'fg': 'Quiet', 'attrs': ['none']},
  \ 'TabLineSel': {'fg': 'Quiet', 'bg': 'Background', 'attrs': ['none']},
  \ 'TabLineFill': {'fg': 'NormalFg', 'attrs': ['none']},
  \ 'Comment': {'fg': 'Quiet', 'attrs': ['italic']},
  \ 'Constant': {'fg': 'Constant'},
  \ 'String': {'fg': 'String'},
  \ 'Character': {'fg': 'String'},
  \ 'Number': {'fg': 'Literal'},
  \ 'Boolean': {'fg': 'Literal'},
  \ 'Float': {'fg': 'Literal'},
  \ 'Identifier': {'fg': 'Variable'},
  \ 'Function': {'fg': 'Function'},
  \ 'Statement': {'fg': 'Statement'},
  \ 'Operator': {'fg': 'Operator'},
  \ 'Keyword': {'fg': 'Keyword'},
  \ 'Preproc': {'fg': 'Macro'},
  \ 'Type': {'fg': 'Type'},
  \ 'Delimiter': {'fg': 'NormalFg'},
  \ 'Underlined': {'fg': 'Emphasis', 'attrs': ['underline']},
  \ 'Error': {'fg': 'Error', 'bg': 'NormalBg', 'attrs': ['bold']},
  \ 'Todo': {'fg': 'Marker', 'bg': 'NormalBg'},
  \ 'SpellBad': {'fg': 'Error', 'bg': 'NormalBg', 'attrs': ['underline']},
  \ 'SpellLocal': {'fg': 'Warning', 'bg': 'NormalBg', 'attrs': ['underline']},
  \ 'SpellCap': {'fg': 'Warning', 'bg': 'NormalBg', 'attrs': ['underline']},
  \ 'SpellRare': {'fg': 'Warning', 'bg': 'NormalBg', 'attrs': ['underline']},
  \ 'DiffAdd': {'fg': 'Add', 'bg': 'NormalBg'},
  \ 'DiffChange': {'fg': 'Change', 'bg': 'NormalBg'},
  \ 'DiffDelete': {'fg': 'Delete', 'bg': 'NormalBg'},
  \ 'DiffText': {'fg': 'Information',},
  \ 'DiffAdded': {'fg': 'Add'},
  \ 'DiffFile': {'fg': 'Emphasis'},
  \ 'DiffNewFile': {'fg': 'Add'},
  \ 'DiffLine': {'fg': 'Information'},
  \ 'DiffRemoved': {'fg': 'Delete'},
  \ 'gitcommitBranch': {'fg': 'Marker'},
  \ 'gitcommitHeader': {'fg': 'Header'},
  \ 'gitcommitSummary': {'fg': 'NormalFg'},
  \ 'gitcommitOverflow': {'fg': 'Emphasis'},
  \ 'gitcommitUntrackedFile': {'fg': 'Warning'},
  \ 'gitcommitDiscardedFile': {'fg': 'Emphasis'},
  \ 'gitcommitSelectedFile': {'fg': 'Information'},
  \ 'gitcommitUnmergedFile': {'fg': 'Warning'},
  \ 'SignifySignAdd': {'fg': 'Add'},
  \ 'SignifySignChange': {'fg': 'Change'},
  \ 'SignifySignDelete': {'fg': 'Delete'},
  \ 'GitGutterAdd': {'fg': 'Add'},
  \ 'GitGutterChange': {'fg': 'Change'},
  \ 'GitGutterDelete': {'fg': 'Delete'},
  \ 'GitSignsAdd': {'fg': 'Add'},
  \ 'GitSignsChange': {'fg': 'Change'},
  \ 'GitSignsDelete': {'fg': 'Delete'},
  \ 'ALEError': {'fg': 'Error', 'attrs': ['underline']},
  \ 'ALEWarning': {'fg': 'Warning', 'attrs': ['underline']},
  \ 'ALEInfo': {'fg': 'Information', 'attrs': ['underline']},
  \ 'LspError': {'fg': 'Error', 'attrs': ['']},
  \ 'LspErrorText': {'fg': 'Error', 'attrs': ['']},
  \ 'LspErrorHighlight': {'fg': 'Error', 'attrs': ['underline']},
  \ 'LspErrorVirtualText': {'fg': 'Error', 'bg': 'Background'},
  \ 'LspWarning': {'fg': 'Warning'},
  \ 'LspWarningText': {'fg': 'Warning'},
  \ 'LspWarningHighlight': {'fg': 'Warning', 'attrs': ['underline']},
  \ 'LspWarningVirtualText': {'fg': 'Warning', 'bg': 'Background'},
  \ 'LspInformation': {'fg': 'Information'},
  \ 'LspInformationText': {'fg': 'Information'},
  \ 'LspInformationHighlight': {'fg': 'Information', 'attrs': ['underline']},
  \ 'LspInformationVirtualText': {'fg': 'Information', 'bg': 'Background'},
  \ 'LspHint': {'fg': 'Hint'},
  \ 'LspHintText': {'fg': 'Hint'},
  \ 'LspHintHighlight': {'fg': 'Hint', 'attrs': ['underline']},
  \ 'LspHintVirtualText': {'fg': 'Hint', 'bg': 'Background'},
  \ 'LspCodeActionText': {'fg': 'Marker'},
  \ 'LspDiagnosticsDefaultError': {'fg': 'Error'},
  \ 'LspDiagnosticsDefaultWarning': {'fg': 'Warning'},
  \ 'LspDiagnosticsDefaultInformation': {'fg': 'Information'},
  \ 'LspDiagnosticsDefaultHint': {'fg': 'Hint'},
  \ 'LspDiagnosticsUnderlinedError': {'fg': 'Error', 'attrs': ['underline']},
  \ 'LspDiagnosticsUnderlinedWarning': {'fg': 'Warning', 'attrs': ['underline']},
  \ 'LspDiagnosticsUnderlinedInformation': {'fg': 'Information', 'attrs': ['underline']},
  \ 'LspDiagnosticsUnderlinedHint': {'fg': 'Hint', 'attrs': ['underline']},
  \ 'TSAnnotation': {'fg': 'Keyword'},
  \ 'TSAttribute': {'fg': 'Macro'},
  \ 'TSBoolean': {'fg': 'Literal'},
  \ 'TSCharacter': {'fg': 'String'},
  \ 'TSComment': {'fg': 'Quiet', 'attrs': ['italic']},
  \ 'TSConditional': {'fg': 'Statement'},
  \ 'TSConstBuiltin': {'fg': 'Constant'},
  \ 'TSConstMacro': {'fg': 'Macro',},
  \ 'TSConstant': {'fg': 'Constant'},
  \ 'TSConstructor': {'fg': 'NormalFg'},
  \ 'TSEmphasis': {'attrs': ['bold']},
  \ 'TSError': {'fg': 'Error'},
  \ 'TSException': {'fg': 'Statement'},
  \ 'TSField': {'fg': 'NormalFg'},
  \ 'TSFloat': {'fg': 'Literal'},
  \ 'TSFuncBuiltin': {'fg': 'Macro'},
  \ 'TSFuncMacro': {'fg': 'Macro'},
  \ 'TSFunction': {'fg': 'Function'},
  \ 'TSInclude': {'fg': 'Macro'},
  \ 'TSKeyword': {'fg': 'Keyword'},
  \ 'TSKeywordFunction': {'fg': 'Keyword'},
  \ 'TSLabel': {'fg': 'Statement'},
  \ 'TSMethod': {'fg': 'Function'},
  \ 'TSNamespace': {'fg': 'NormalFg'},
  \ 'TSNumber': {'fg': 'Literal'},
  \ 'TSOperator': {'fg': 'Operator'},
  \ 'TSParameter': {'fg': 'NormalFg'},
  \ 'TSParameterReference': {'fg': 'NormalFg'},
  \ 'TSProperty': {'fg': 'NormalFg'},
  \ 'TSPunctBracket': {'fg': 'NormalFg'},
  \ 'TSPunctDelimiter': {'fg': 'NormalFg'},
  \ 'TSPunctSpecial': {'fg': 'NormalFg'},
  \ 'TSRepeat': {'fg': 'Statement'},
  \ 'TSString': {'fg': 'String'},
  \ 'TSStringEscape': {'fg': 'Escape'},
  \ 'TSStringRegex': {'fg': 'Escape'},
  \ 'TSStructure': {'fg': 'Keyword'},
  \ 'TSTag': {'fg': 'Keyword'},
  \ 'TSTagDelimiter': {'fg': 'NormalFg'},
  \ 'TSText': {'fg': 'String'},
  \ 'TSType': {'fg': 'Type'},
  \ 'TSTypeBuiltin': {'fg': 'Type'},
  \ 'TSUnderline': {'attrs': ['underline']},
  \ 'TSURI': {'fg': 'Emphasis', 'attrs': ['underline']},
  \ 'TSVariable': {'fg': 'Variable'},
  \ 'TSVariableBuiltin': {'fg': 'Constant'},
\ },
\}

function! s:merge(default, override) abort
  let l:new = copy(a:default)
  for [l:k, l:v] in items(a:override)
    if type(l:v) is v:t_dict && type(get(l:new, l:k)) is v:t_dict
      let l:new[l:k] = s:merge(l:new[l:k], l:v)
    else
      let l:new[l:k] = l:v
    endif
  endfor
  return l:new
endfunction

function! s:h(group, props)
  let l:cmd = "hi " . a:group
  let l:fg = get(a:props, 'fg', '')
  let l:bg = get(a:props, 'bg', '')
  let l:attr = join(map(get(a:props, 'attrs', []), { -> v:val is# 'italic' ? s:italic : v:val }), ',')
  if !empty(l:fg)
    let l:fg = s:config.colors[s:config.categories[l:fg]]
    let l:cmd = l:cmd . ' ctermfg=' . l:fg.cterm . ' guifg=' . l:fg.gui
  endif
  if !empty(l:bg)
    let l:bg = s:config.colors[s:config.categories[l:bg]]
    let l:cmd = l:cmd . ' ctermbg=' . l:bg.cterm . ' guibg=' . l:bg.gui
  endif
  if !empty(l:attr)
    let l:cmd = l:cmd . ' cterm=' . l:attr . ' gui=' . l:attr
  endif
  if !empty(l:fg) || !empty(l:bg) || !empty(l:attr)
    execute l:cmd
  end
endfunction

let s:config = s:merge(s:default_config, get(g:, 'palette', {}))
let s:italic = s:config.italic ? 'italic' : ''

for [group, hl] in items(s:config.highlights)
  call s:h(group, hl)
endfor
