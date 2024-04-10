if exists('g:colors_name')
    highlight clear
endif

let g:colors_name = 'gruvbones'

let s:italics = (&t_ZH != '' && &t_ZH != '[7m') || has('gui_running') || has('nvim')

if &background ==# 'dark'
    " dark start
    " This codeblock is auto-generated by shipwright.nvim
    let g:terminal_color_0 = '#282828'
    let g:terminal_color_1 = '#FB4C36'
    let g:terminal_color_2 = '#B7BA26'
    let g:terminal_color_3 = '#F9BD30'
    let g:terminal_color_4 = '#83A598'
    let g:terminal_color_5 = '#D2859A'
    let g:terminal_color_6 = '#82C07B'
    let g:terminal_color_7 = '#EBDCB4'
    let g:terminal_color_8 = '#3C3836'
    let g:terminal_color_9 = '#FC7369'
    let g:terminal_color_10 = '#C2C524'
    let g:terminal_color_11 = '#FDC65F'
    let g:terminal_color_12 = '#82B9A5'
    let g:terminal_color_13 = '#E296AA'
    let g:terminal_color_14 = '#7FCE75'
    let g:terminal_color_15 = '#EBDCB4'
    highlight Normal guifg=#EBDCB4 guibg=#282828 guisp=NONE gui=NONE cterm=NONE
    highlight Bold guifg=NONE guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight BufferVisible guifg=#F0E4CA guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight BufferVisibleIndex guifg=#F0E4CA guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight BufferVisibleSign guifg=#F0E4CA guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight CocMarkdownLink guifg=#82C07B guibg=NONE guisp=NONE gui=underline cterm=underline
    highlight ColorColumn guifg=NONE guibg=#F4EDB1 guisp=NONE gui=NONE cterm=NONE
    highlight! link LspReferenceRead ColorColumn
    highlight! link LspReferenceText ColorColumn
    highlight! link LspReferenceWrite ColorColumn
    highlight Comment guifg=#727272 guibg=NONE guisp=NONE gui=italic cterm=italic
    highlight Conceal guifg=#A19576 guibg=NONE guisp=NONE gui=bold,italic cterm=bold,italic
    highlight Constant guifg=#AFA280 guibg=NONE guisp=NONE gui=italic cterm=italic
    highlight! link TroubleSource Constant
    highlight! link WhichKeyValue Constant
    highlight! link helpOption Constant
    highlight Cursor guifg=#282828 guibg=#EEE2C3 guisp=NONE gui=NONE cterm=NONE
    highlight! link TermCursor Cursor
    highlight CursorLine guifg=NONE guibg=#2E2E2E guisp=NONE gui=NONE cterm=NONE
    highlight! link CocMenuSel CursorLine
    highlight! link CursorColumn CursorLine
    highlight CursorLineNr guifg=#EBDCB4 guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight Delimiter guifg=#848484 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link markdownLinkTextDelimiter Delimiter
    highlight! link NotifyERRORIcon DiagnosticError
    highlight! link NotifyERRORTitle DiagnosticError
    highlight DiagnosticHint guifg=#D2859A guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link NotifyDEBUGIcon DiagnosticHint
    highlight! link NotifyDEBUGTitle DiagnosticHint
    highlight! link NotifyTRACEIcon DiagnosticHint
    highlight! link NotifyTRACETitle DiagnosticHint
    highlight DiagnosticInfo guifg=#83A598 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link NotifyINFOIcon DiagnosticInfo
    highlight! link NotifyINFOTitle DiagnosticInfo
    highlight DiagnosticOk guifg=#B7BA26 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight DiagnosticSignError guifg=#FB4C36 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link CocErrorSign DiagnosticSignError
    highlight DiagnosticSignHint guifg=#D2859A guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link CocHintSign DiagnosticSignHint
    highlight DiagnosticSignInfo guifg=#83A598 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link CocInfoSign DiagnosticSignInfo
    highlight DiagnosticSignOk guifg=#B7BA26 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight DiagnosticSignWarn guifg=#F9BD30 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link CocWarningSign DiagnosticSignWarn
    highlight DiagnosticUnderlineError guifg=NONE guibg=NONE guisp=#FB4C36 gui=undercurl cterm=undercurl
    highlight! link CocErrorHighlight DiagnosticUnderlineError
    highlight DiagnosticUnderlineHint guifg=NONE guibg=NONE guisp=#D2859A gui=undercurl cterm=undercurl
    highlight! link CocHintHighlight DiagnosticUnderlineHint
    highlight DiagnosticUnderlineInfo guifg=NONE guibg=NONE guisp=#83A598 gui=undercurl cterm=undercurl
    highlight! link CocInfoHighlight DiagnosticUnderlineInfo
    highlight DiagnosticUnderlineOk guifg=NONE guibg=NONE guisp=#B7BA26 gui=undercurl cterm=undercurl
    highlight DiagnosticUnderlineWarn guifg=NONE guibg=NONE guisp=#F9BD30 gui=undercurl cterm=undercurl
    highlight! link CocWarningHighlight DiagnosticUnderlineWarn
    highlight DiagnosticVirtualTextError guifg=#FB4C36 guibg=#372E2E guisp=NONE gui=NONE cterm=NONE
    highlight! link CocErrorVirtualText DiagnosticVirtualTextError
    highlight DiagnosticVirtualTextHint guifg=#D2859A guibg=#372E30 guisp=NONE gui=NONE cterm=NONE
    highlight DiagnosticVirtualTextInfo guifg=#83A598 guibg=#2E3130 guisp=NONE gui=NONE cterm=NONE
    highlight DiagnosticVirtualTextOk guifg=#B7BA26 guibg=#30302E guisp=NONE gui=NONE cterm=NONE
    highlight DiagnosticVirtualTextWarn guifg=#F9BD30 guibg=#32302E guisp=NONE gui=NONE cterm=NONE
    highlight! link CocWarningVirtualText DiagnosticVirtualTextWarn
    highlight! link DiagnosticDeprecated DiagnosticWarn
    highlight! link DiagnosticUnnecessary DiagnosticWarn
    highlight! link NotifyWARNIcon DiagnosticWarn
    highlight! link NotifyWARNTitle DiagnosticWarn
    highlight DiffAdd guifg=NONE guibg=#3A3A25 guisp=NONE gui=NONE cterm=NONE
    highlight DiffChange guifg=NONE guibg=#273E35 guisp=NONE gui=NONE cterm=NONE
    highlight DiffDelete guifg=NONE guibg=#52302E guisp=NONE gui=NONE cterm=NONE
    highlight DiffText guifg=#EBDCB4 guibg=#3B5B4F guisp=NONE gui=NONE cterm=NONE
    highlight Directory guifg=NONE guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight Error guifg=#FB4C36 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link DiagnosticError Error
    highlight! link ErrorMsg Error
    highlight FlashBackdrop guifg=#727272 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight FlashLabel guifg=#EBDCB4 guibg=#4E635B guisp=NONE gui=NONE cterm=NONE
    highlight FloatBorder guifg=#848484 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight FoldColumn guifg=#6A6A6A guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight Folded guifg=#ABABAB guibg=#424242 guisp=NONE gui=NONE cterm=NONE
    highlight Function guifg=#bdae93 guibg=NONE guisp=NONE gui=bold cterm=NONE
    highlight! link TroubleNormal Function
    highlight! link TroubleText Function
    highlight GitSignsAdd guifg=#B7BA26 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link GitGutterAdd GitSignsAdd
    highlight GitSignsChange guifg=#83A598 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link GitGutterChange GitSignsChange
    highlight GitSignsDelete guifg=#FB4C36 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link GitGutterDelete GitSignsDelete
    highlight IblIndent guifg=#373737 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight IblScope guifg=#505050 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight Identifier guifg=#C9BA94 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight IncSearch guifg=#282828 guibg=#DBA1B0 guisp=NONE gui=bold cterm=bold
    highlight! link CurSearch IncSearch
    highlight Italic guifg=NONE guibg=NONE guisp=NONE gui=italic cterm=italic
    highlight LineNr guifg=#6A6A6A guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link CocCodeLens LineNr
    highlight! link LspCodeLens LineNr
    highlight! link SignColumn LineNr
    highlight MoreMsg guifg=#B7BA26 guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight! link Question MoreMsg
    highlight! link NnnNormalNC NnnNormal
    highlight! link NnnVertSplit NnnWinSeparator
    highlight NonText guifg=#616161 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link EndOfBuffer NonText
    highlight! link Whitespace NonText
    highlight NormalFloat guifg=NONE guibg=#393939 guisp=NONE gui=NONE cterm=NONE
    highlight Number guifg=#EBDCB4 guibg=NONE guisp=NONE gui=italic cterm=italic
    highlight! link Boolean Number
    highlight Pmenu guifg=NONE guibg=#393939 guisp=NONE gui=NONE cterm=NONE
    highlight PmenuSbar guifg=NONE guibg=#666666 guisp=NONE gui=NONE cterm=NONE
    highlight PmenuSel guifg=NONE guibg=#505050 guisp=NONE gui=NONE cterm=NONE
    highlight PmenuThumb guifg=NONE guibg=#8B8B8B guisp=NONE gui=NONE cterm=NONE
    highlight PreProc guifg=#ebdbb2 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight Search guifg=#EBDCB4 guibg=#93455D guisp=NONE gui=NONE cterm=NONE
    highlight! link CocSearch Search
    highlight! link MatchParen Search
    highlight! link Sneak Search
    highlight SneakLabelMask guifg=#D2859A guibg=#D2859A guisp=NONE gui=NONE cterm=NONE
    highlight Special guifg=#d5c4a1 guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight! link WhichKeyGroup Special
    highlight SpecialComment guifg=#727272 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link markdownUrl SpecialComment
    highlight SpecialKey guifg=#616161 guibg=NONE guisp=NONE gui=italic cterm=italic
    highlight SpellBad guifg=#E46258 guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
    highlight! link CocSelectedText SpellBad
    highlight SpellCap guifg=#E46258 guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
    highlight! link SpellLocal SpellCap
    highlight SpellRare guifg=#E46258 guibg=NONE guisp=NONE gui=undercurl cterm=undercurl
    highlight Statement guifg=#ebdbb2 guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight! link WhichKey Statement
    highlight StatusLine guifg=#EBDCB4 guibg=#3E3E3E guisp=NONE gui=NONE cterm=NONE
    highlight! link TabLine StatusLine
    highlight StatusLineNC guifg=#F0E4CA guibg=#323232 guisp=NONE gui=NONE cterm=NONE
    highlight! link TabLineFill StatusLineNC
    highlight TabLineSel guifg=NONE guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight! link BufferCurrent TabLineSel
    highlight Title guifg=#EBDCB4 guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight Todo guifg=NONE guibg=NONE guisp=NONE gui=bold,underline cterm=bold,underline
    highlight Type guifg=#ebdbb2 guibg=NONE guisp=NONE gui=italic cterm=NONE
    highlight! link helpSpecial Type
    highlight! link markdownCode Type
    highlight Underlined guifg=NONE guibg=NONE guisp=NONE gui=underline cterm=underline
    highlight Visual guifg=NONE guibg=#555041 guisp=NONE gui=NONE cterm=NONE
    highlight WarningMsg guifg=NONE guibg=#3c3836 guisp=NONE gui=NONE cterm=NONE
    highlight! link DiagnosticWarn WarningMsg
    highlight! link gitcommitOverflow WarningMsg
    highlight WhichKeySeparator guifg=#6A6A6A guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight WildMenu guifg=#282828 guibg=#D2859A guisp=NONE gui=NONE cterm=NONE
    highlight! link SneakLabel WildMenu
    highlight WinSeparator guifg=#6A6A6A guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link VertSplit WinSeparator
    highlight diffAdded guifg=#B7BA26 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight diffChanged guifg=#83A598 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight diffFile guifg=#F9BD30 guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight diffIndexLine guifg=#F9BD30 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight diffLine guifg=#D2859A guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight diffNewFile guifg=#B7BA26 guibg=NONE guisp=NONE gui=italic cterm=italic
    highlight diffOldFile guifg=#FB4C36 guibg=NONE guisp=NONE gui=italic cterm=italic
    highlight diffRemoved guifg=#FB4C36 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight helpHyperTextEntry guifg=#9E9E9E guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight helpHyperTextJump guifg=#C9BA94 guibg=NONE guisp=NONE gui=underline cterm=underline
    highlight lCursor guifg=#282828 guibg=#998D6F guisp=NONE gui=NONE cterm=NONE
    highlight! link TermCursorNC lCursor
    highlight markdownLinkText guifg=#C9BA94 guibg=NONE guisp=NONE gui=underline cterm=underline
    " dark end

    if !s:italics
        " no italics dark start
        " This codeblock is auto-generated by shipwright.nvim
        highlight Boolean gui=NONE cterm=NONE
        highlight Comment gui=NONE cterm=NONE
        highlight Constant gui=NONE cterm=NONE
        highlight Number gui=NONE cterm=NONE
        highlight SpecialKey gui=NONE cterm=NONE
        highlight TroubleSource gui=NONE cterm=NONE
        highlight WhichKeyValue gui=NONE cterm=NONE
        highlight diffNewFile gui=NONE cterm=NONE
        highlight diffOldFile gui=NONE cterm=NONE
        highlight helpOption gui=NONE cterm=NONE
        " no italics dark end
    endif
else
    " light start
    " This codeblock is auto-generated by shipwright.nvim
    let g:terminal_color_0 = '#f9f5d7'
    let g:terminal_color_1 = '#9C0003'
    let g:terminal_color_2 = '#7A750E'
    let g:terminal_color_3 = '#B67616'
    let g:terminal_color_4 = '#086576'
    let g:terminal_color_5 = '#903F71'
    let g:terminal_color_6 = '#427B58'
    let g:terminal_color_7 = '#3C3836'
    let g:terminal_color_8 = '#EBDCB4'
    let g:terminal_color_9 = '#860002'
    let g:terminal_color_10 = '#656106'
    let g:terminal_color_11 = '#97610D'
    let g:terminal_color_12 = '#055565'
    let g:terminal_color_13 = '#812E63'
    let g:terminal_color_14 = '#306646'
    let g:terminal_color_15 = '#3C3836'
    highlight Normal guifg=#3C3836 guibg=#f9f5d7 guisp=NONE gui=NONE cterm=NONE
    highlight Bold guifg=NONE guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight BufferVisible guifg=#706966 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight BufferVisibleIndex guifg=#706966 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight BufferVisibleSign guifg=#706966 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight CocMarkdownLink guifg=#427B58 guibg=NONE guisp=NONE gui=underline cterm=underline
    highlight ColorColumn guifg=NONE guibg=#F4EDB1 guisp=NONE gui=NONE cterm=NONE
    highlight! link LspReferenceRead ColorColumn
    highlight! link LspReferenceText ColorColumn
    highlight! link LspReferenceWrite ColorColumn
    highlight Comment guifg=#959277 guibg=NONE guisp=NONE gui=italic cterm=italic
    highlight Conceal guifg=#66605C guibg=NONE guisp=NONE gui=bold,italic cterm=bold,italic
    highlight Constant guifg=#6B6461 guibg=NONE guisp=NONE gui=italic cterm=italic
    highlight! link TroubleSource Constant
    highlight! link WhichKeyValue Constant
    highlight! link helpOption Constant
    highlight Cursor guifg=#f9f5d7 guibg=#3C3836 guisp=NONE gui=NONE cterm=NONE
    highlight! link TermCursor Cursor
    highlight CursorLine guifg=NONE guibg=#F4EDB1 guisp=NONE gui=NONE cterm=NONE
    highlight! link CocMenuSel CursorLine
    highlight! link CursorColumn CursorLine
    highlight CursorLineNr guifg=#3C3836 guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight Delimiter guifg=#8C8764 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link markdownLinkTextDelimiter Delimiter
    highlight! link NotifyERRORIcon DiagnosticError
    highlight! link NotifyERRORTitle DiagnosticError
    highlight DiagnosticHint guifg=#903F71 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link NotifyDEBUGIcon DiagnosticHint
    highlight! link NotifyDEBUGTitle DiagnosticHint
    highlight! link NotifyTRACEIcon DiagnosticHint
    highlight! link NotifyTRACETitle DiagnosticHint
    highlight DiagnosticInfo guifg=#086576 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link NotifyINFOIcon DiagnosticInfo
    highlight! link NotifyINFOTitle DiagnosticInfo
    highlight DiagnosticOk guifg=#7A750E guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight DiagnosticSignError guifg=#9C0003 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link CocErrorSign DiagnosticSignError
    highlight DiagnosticSignHint guifg=#903F71 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link CocHintSign DiagnosticSignHint
    highlight DiagnosticSignInfo guifg=#086576 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link CocInfoSign DiagnosticSignInfo
    highlight DiagnosticSignOk guifg=#7A750E guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight DiagnosticSignWarn guifg=#B67616 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link CocWarningSign DiagnosticSignWarn
    highlight DiagnosticUnderlineError guifg=NONE guibg=NONE guisp=#9C0003 gui=undercurl cterm=undercurl
    highlight! link CocErrorHighlight DiagnosticUnderlineError
    highlight DiagnosticUnderlineHint guifg=NONE guibg=NONE guisp=#903F71 gui=undercurl cterm=undercurl
    highlight! link CocHintHighlight DiagnosticUnderlineHint
    highlight DiagnosticUnderlineInfo guifg=NONE guibg=NONE guisp=#086576 gui=undercurl cterm=undercurl
    highlight! link CocInfoHighlight DiagnosticUnderlineInfo
    highlight DiagnosticUnderlineOk guifg=NONE guibg=NONE guisp=#7A750E gui=undercurl cterm=undercurl
    highlight DiagnosticUnderlineWarn guifg=NONE guibg=NONE guisp=#B67616 gui=undercurl cterm=undercurl
    highlight! link CocWarningHighlight DiagnosticUnderlineWarn
    highlight DiagnosticVirtualTextError guifg=#9C0003 guibg=#F2E5E5 guisp=NONE gui=NONE cterm=NONE
    highlight! link CocErrorVirtualText DiagnosticVirtualTextError
    highlight DiagnosticVirtualTextHint guifg=#903F71 guibg=#F2E5EB guisp=NONE gui=NONE cterm=NONE
    highlight DiagnosticVirtualTextInfo guifg=#086576 guibg=#DAEBF2 guisp=NONE gui=NONE cterm=NONE
    highlight DiagnosticVirtualTextOk guifg=#7A750E guibg=#EFEBB0 guisp=NONE gui=NONE cterm=NONE
    highlight DiagnosticVirtualTextWarn guifg=#B67616 guibg=#F2E6DE guisp=NONE gui=NONE cterm=NONE
    highlight! link CocWarningVirtualText DiagnosticVirtualTextWarn
    highlight! link DiagnosticDeprecated DiagnosticWarn
    highlight! link DiagnosticUnnecessary DiagnosticWarn
    highlight! link NotifyWARNIcon DiagnosticWarn
    highlight! link NotifyWARNTitle DiagnosticWarn
    highlight DiffAdd guifg=NONE guibg=#E8E4BD guisp=NONE gui=NONE cterm=NONE
    highlight DiffChange guifg=NONE guibg=#D5E5EB guisp=NONE gui=NONE cterm=NONE
    highlight DiffDelete guifg=NONE guibg=#EEDFDF guisp=NONE gui=NONE cterm=NONE
    highlight DiffText guifg=#3C3836 guibg=#A6C6D1 guisp=NONE gui=NONE cterm=NONE
    highlight Directory guifg=NONE guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight Error guifg=#9C0003 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link DiagnosticError Error
    highlight! link ErrorMsg Error
    highlight FlashBackdrop guifg=#959277 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight FlashLabel guifg=#3C3836 guibg=#2EDBFE guisp=NONE gui=NONE cterm=NONE
    highlight FloatBorder guifg=#777354 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight FoldColumn guifg=#A19C74 guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight Folded guifg=#56533C guibg=#D1CB97 guisp=NONE gui=NONE cterm=NONE
    highlight Function guifg=#665c54 guibg=NONE guisp=NONE gui=bold cterm=NONE
    highlight! link TroubleNormal Function
    highlight! link TroubleText Function
    highlight GitSignsAdd guifg=#7A750E guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link GitGutterAdd GitSignsAdd
    highlight GitSignsChange guifg=#086576 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link GitGutterChange GitSignsChange
    highlight GitSignsDelete guifg=#9C0003 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link GitGutterDelete GitSignsDelete
    highlight IblIndent guifg=#EAE4B7 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight IblScope guifg=#BFBA95 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight Identifier guifg=#57514F guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight IncSearch guifg=#f9f5d7 guibg=#D771AE guisp=NONE gui=bold cterm=bold
    highlight! link CurSearch IncSearch
    highlight Italic guifg=NONE guibg=NONE guisp=NONE gui=italic cterm=italic
    highlight LineNr guifg=#A19C74 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link CocCodeLens LineNr
    highlight! link LspCodeLens LineNr
    highlight! link SignColumn LineNr
    highlight MoreMsg guifg=#7A750E guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight! link Question MoreMsg
    highlight! link NnnNormalNC NnnNormal
    highlight! link NnnVertSplit NnnWinSeparator
    highlight NonText guifg=#B8B284 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link EndOfBuffer NonText
    highlight! link Whitespace NonText
    highlight NormalFloat guifg=NONE guibg=#E6DFA6 guisp=NONE gui=NONE cterm=NONE
    highlight Number guifg=#3C3836 guibg=NONE guisp=NONE gui=italic cterm=italic
    highlight! link Boolean Number
    highlight Pmenu guifg=NONE guibg=#E0D9A2 guisp=NONE gui=NONE cterm=NONE
    highlight PmenuSbar guifg=NONE guibg=#AFAA7E guisp=NONE gui=NONE cterm=NONE
    highlight PmenuSel guifg=NONE guibg=#C6C08F guisp=NONE gui=NONE cterm=NONE
    highlight PmenuThumb guifg=NONE guibg=#FCFAEC guisp=NONE gui=NONE cterm=NONE
    highlight PreProc guifg=#1d2021 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight Search guifg=#3C3836 guibg=#EABDD5 guisp=NONE gui=NONE cterm=NONE
    highlight! link CocSearch Search
    highlight! link MatchParen Search
    highlight! link Sneak Search
    highlight SneakLabelMask guifg=#903F71 guibg=#903F71 guisp=NONE gui=NONE cterm=NONE
    highlight Special guifg=#504945 guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight! link WhichKeyGroup Special
    highlight SpecialComment guifg=#959277 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link markdownUrl SpecialComment
    highlight SpecialKey guifg=#B8B284 guibg=NONE guisp=NONE gui=italic cterm=italic
    highlight SpellBad guifg=#8B2627 guibg=NONE guisp=#9C0003 gui=undercurl cterm=undercurl
    highlight! link CocSelectedText SpellBad
    highlight SpellCap guifg=#8B2627 guibg=NONE guisp=#BC0004 gui=undercurl cterm=undercurl
    highlight! link SpellLocal SpellCap
    highlight SpellRare guifg=#8B2627 guibg=NONE guisp=#B67616 gui=undercurl cterm=undercurl
    highlight Statement guifg=#3c3836 guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight! link WhichKey Statement
    highlight StatusLine guifg=#3C3836 guibg=#DAD39D guisp=NONE gui=NONE cterm=NONE
    highlight! link TabLine StatusLine
    highlight StatusLineNC guifg=#706966 guibg=#EBE4AA guisp=NONE gui=NONE cterm=NONE
    highlight! link TabLineFill StatusLineNC
    highlight TabLineSel guifg=NONE guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight! link BufferCurrent TabLineSel
    highlight Title guifg=#3C3836 guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight Todo guifg=NONE guibg=NONE guisp=NONE gui=bold,underline cterm=bold,underline
    highlight Type guifg=#1d2021 guibg=NONE guisp=NONE gui=italic cterm=NONE
    highlight! link helpSpecial Type
    highlight! link markdownCode Type
    highlight Underlined guifg=NONE guibg=NONE guisp=NONE gui=underline cterm=underline
    highlight Visual guifg=NONE guibg=#E0DCDA guisp=NONE gui=NONE cterm=NONE
    highlight WarningMsg guifg=NONE guibg=#ebdbb2 guisp=NONE gui=NONE cterm=NONE
    highlight! link DiagnosticWarn WarningMsg
    highlight! link gitcommitOverflow WarningMsg
    highlight WhichKeySeparator guifg=#A19C74 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight WildMenu guifg=#f9f5d7 guibg=#903F71 guisp=NONE gui=NONE cterm=NONE
    highlight! link SneakLabel WildMenu
    highlight WinSeparator guifg=#A19C74 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight! link VertSplit WinSeparator
    highlight diffAdded guifg=#7A750E guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight diffChanged guifg=#086576 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight diffFile guifg=#B67616 guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight diffIndexLine guifg=#B67616 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight diffLine guifg=#903F71 guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight diffNewFile guifg=#7A750E guibg=NONE guisp=NONE gui=italic cterm=italic
    highlight diffOldFile guifg=#9C0003 guibg=NONE guisp=NONE gui=italic cterm=italic
    highlight diffRemoved guifg=#9C0003 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    highlight helpHyperTextEntry guifg=#5E5A3A guibg=NONE guisp=NONE gui=bold cterm=bold
    highlight helpHyperTextJump guifg=#57514F guibg=NONE guisp=NONE gui=underline cterm=underline
    highlight lCursor guifg=#f9f5d7 guibg=#615B58 guisp=NONE gui=NONE cterm=NONE
    highlight! link TermCursorNC lCursor
    highlight markdownLinkText guifg=#57514F guibg=NONE guisp=NONE gui=underline cterm=underline
    " light end

    if !s:italics
        " no italics light start
        " This codeblock is auto-generated by shipwright.nvim
        highlight Boolean gui=NONE cterm=NONE
        highlight Comment gui=NONE cterm=NONE
        highlight Constant gui=NONE cterm=NONE
        highlight Number gui=NONE cterm=NONE
        highlight SpecialKey gui=NONE cterm=NONE
        highlight TroubleSource gui=NONE cterm=NONE
        highlight WhichKeyValue gui=NONE cterm=NONE
        highlight diffNewFile gui=NONE cterm=NONE
        highlight diffOldFile gui=NONE cterm=NONE
        highlight helpOption gui=NONE cterm=NONE
        " no italics light end
    endif
endif

if has('terminal')
    highlight! link StatusLineTerm StatusLine
    highlight! link StatusLineTermNC StatusLineNC
    let g:terminal_ansi_colors = [
                \ g:terminal_color_0,
                \ g:terminal_color_1,
                \ g:terminal_color_2,
                \ g:terminal_color_3,
                \ g:terminal_color_4,
                \ g:terminal_color_5,
                \ g:terminal_color_6,
                \ g:terminal_color_7,
                \ g:terminal_color_8,
                \ g:terminal_color_9,
                \ g:terminal_color_10,
                \ g:terminal_color_11,
                \ g:terminal_color_12,
                \ g:terminal_color_13,
                \ g:terminal_color_14,
                \ g:terminal_color_15
                \ ]
endif
