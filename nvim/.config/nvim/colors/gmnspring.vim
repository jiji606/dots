" Vim colour file
"
" This colour file is meant for GUI use.
"

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="gmnspring"


hi Normal        guifg=#969896  guibg=#121212 gui=none
hi Title         guifg=white
hi Cursor        guibg=#ffffff
hi LineNr        guifg=#6a6a6a  guibg=#232323
hi CursorLineNr  guifg=#6a6a6a  guibg=#2c2a28  gui=none
hi Visual        guibg=#2c2a28
hi NonText       guifg=#181818  guibg=#121212
hi StatusLine    guifg=#e6e6e6  guibg=#2c2a28  gui=none
hi StatusLineNC  guifg=#6a6a6a  guibg=#2c2a28  gui=none
hi VertSplit     guifg=#2c2a28  guibg=#2c2a28  gui=none
hi ModeMsg       guifg=#6a6a6a  guibg=#181818  gui=none
hi ErrorMsg      guifg=#181818  guibg=#FF242D  gui=none
hi Error         guifg=#FF242D  guibg=#181818  gui=none
hi Folded        guifg=#6a6a6a  guibg=#2c2a28
hi FoldColumn    guibg=#181818  guifg=#181818  gui=none
hi TabLineSel    guifg=#3c3f41  guibg=#181818  gui=none
hi TabLine       guifg=#3c3f41  guibg=#232323  gui=none
hi TabLineFill   guifg=#3c3f41  guibg=#232323  gui=none
hi SpecialKey    guifg=#3c3f41
hi MatchParen  guibg=#3c3f41  gui=none
hi Pmenu       guifg=#6a6a6a  guibg=#232323  gui=none
hi PmenuSel    guifg=#232323  guibg=#969896  gui=none
hi PmenuSbar   guifg=#232323  guibg=#6a6a6a  gui=bold
hi PmenuThumb  guifg=#6a6a6a  guibg=#232323  gui=bold
hi Search      guifg=#4F1220  guibg=#CC91A3  gui=underline
hi IncSearch   guifg=#f0c674  guibg=#ddaa44  gui=underline
hi CursorLine  guibg=#232323  gui=none
hi CursorColumn guibg=#202020 gui=none
hi ColorColumn guibg=#161616  gui=none
hi SpellBad    guisp=#990000
hi SpellCap    guisp=#990000
hi SpellLocal  guisp=#990000
hi SpellRare   guisp=#990000

" Syntax highlighting 
hi Comment       guifg=#6a6a6a  gui=italic
hi Todo          guifg=#D85774  gui=italic
hi Operator      guifg=#e6e6e6  gui=none
hi Identifier    guifg=#CC91A3  gui=none
hi Statement     guifg=#D85774  gui=none
hi Type          guifg=#D85774  gui=none
hi Constant      guifg=#CC91A3  gui=none
hi Conditional   guifg=#CC91A3  gui=none
hi Delimiter     guifg=#e6e6e6  gui=none
hi PreProc       guifg=#D85774  gui=none
hi Special       guifg=#CC91A3  gui=bold
hi Keyword       guifg=#CC91A3  gui=none
hi Function      guifg=#CC91A3
hi Include       guifg=#D85774
hi Define        guifg=#CC91A3  gui=bold
hi Typedef       guifg=#CC91A3
hi Number        guifg=#e6e6e6
hi Character     guifg=#e6e6e6
hi Macro         guifg=#D85774
hi StorageClass  guifg=#e6e6e6

hi def cCustomFunc guifg=#e6e6e6
hi def cCustomParen guifg=#e6e6e6
hi def cCustomScope guifg=#e6e6e6
hi def cCustomClass guifg=#D85774

hi link String          Constant
hi link Boolean         Constant
hi link Float           Number
hi link Repeat          Conditional
hi link Label           Statement
hi link Exception       Statement
hi link Define          Type
hi link PreCondit       PreProc
hi link Structure       Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special

" Test the actual colorscheme
syn match Comment      "\"__Comment.*"
syn match Constant     "\"__Constant.*"
syn match Cursor       "\"__Cursor.*"
syn match CursorLine   "\"__CursorLine.*"
syn match DiffAdd      "\"__DiffAdd.*"
syn match DiffChange   "\"__DiffChange.*"
syn match DiffText     "\"__DiffText.*"
syn match DiffDelete   "\"__DiffDelete.*"
syn match Folded       "\"__Folded.*"
syn match Function     "\"__Function.*"
syn match Identifier   "\"__Identifier.*"
syn match IncSearch    "\"__IncSearch.*"
syn match NonText      "\"__NonText.*"
syn match Normal       "\"__Normal.*"
syn match Pmenu        "\"__Pmenu.*"
syn match PreProc      "\"__PreProc.*"
syn match Search       "\"__Search.*"
syn match Special      "\"__Special.*"
syn match SpecialKey   "\"__SpecialKey.*"
syn match Statement    "\"__Statement.*"
syn match StatusLine   "\"__StatusLine.*"
syn match StatusLineNC "\"__StatusLineNC.*"
syn match String       "\"__String.*"
syn match Todo         "\"__Todo.*"
syn match Type         "\"__Type.*"
syn match Underlined   "\"__Underlined.*"
syn match VertSplit    "\"__VertSplit.*"
syn match Visual       "\"__Visual.*"

syn match Braces display '[{}()\[\]]'
syn match Operators "?\|+\|-\|\*\|;\|:\|,\|<\|>\|&\||\|!\|\~\|%\|=\|)\|(\|{\|}\|\.\|\[\|\]\|/\(/\|*\)\@!"
hi Braces guifg=#F59BB0
hi Operators guifg=#F59BB0

"__Comment              /* this is a comment */
"__Constant             var = SHBLAH
"__Cursor               char under the cursor?
"__CursorLine           Line where the cursor is
"__DiffAdd              +line added from file.orig
"__DiffChange           line changed from file.orig
"__DiffText             actual changes on this line
"__DiffDelete           -line removed from file.orig
"__Folded               +--- 1 line : Folded line ---
"__Function             function sblah()
"__Identifier           Never ran into that actually...
"__IncSearch            Next search term
"__NonText              This is not a text, move on
"__Normal               Typical text goes like this
"__Pmenu                Currently selected menu item
"__PreProc              #define SHBLAH true
"__Search               This is what you're searching for
"__Special              true false NULL SIGTERM
"__SpecialKey           Never ran into that either
"__Statement            if else return for switch
"__StatusLine           Statusline of current windows
"__StatusLineNC         Statusline of other windows
"__String               "Hello, World!"
"__Todo                 TODO: remove todos from source
"__Type                 int float char void unsigned uint32_t
"__Underlined           Anything underlined
"__VertSplit            :vsplit will only show ' | '
"__Visual               Selected text looks like this
