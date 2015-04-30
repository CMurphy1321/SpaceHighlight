if !exists("s:tabhi_color")
    let s:tabhi_color="ctermbg=red guibg=red"
endif

function! s:TabHi()
    syntax match hiTab /\t/ containedin=ALL
    execute("highlight hiTab " . s:tabhi_color)
    let b:tabhi = 1
endfunction

function! s:NoTabHi()
    syntax clear hiTab
    let b:tabhi = 0
endfunction

function! s:ToggleTabHi()
    if exists("b:tabhi") && b:tabhi
        call s:NoTabHi()
        echo "Don't highlight tabs"
    else
        call s:TabHi()
        echo "Highlight tabs"
    endif
endfunction

if !exists("s:spacehi_spacecolor")
    let s:spacehi_spacecolor="ctermbg=white guibg=white"
endif

function! s:SpaceHi()
    syntax match spacehiTrailingSpace /\s\+$/ containedin=ALL
    execute("highlight spacehiTrailingSpace " . s:spacehi_spacecolor)

    let b:spacehi = 1
endfunction

function! s:NoSpaceHi()
    syntax clear spacehiTrailingSpace
    let b:spacehi = 0
endfunction

function! s:ToggleSpaceHi()
    if exists("b:spacehi") && b:spacehi
        call s:NoSpaceHi()
        echo "Don't highlight whitespace"
    else
        call s:SpaceHi()
        echo "Highlight whitespace"
    endif
endfunction

"Call space highlighting
com! SpaceHi call s:SpaceHi()
com! NoSpaceHi call s:NoSpaceHi()
com! ToggleSpaceHi call s:ToggleSpaceHi()

"Call tab highlighting
com! TabHi call s:TabHi()
com! NoTabHi call s:NoTabHi()
com! ToggleTabHi call s:ToggleTabHi()
