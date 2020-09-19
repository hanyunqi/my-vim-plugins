
func SetTitle()
    if &filetype == 'sh'
        call setline(1, "#!/bin/bash")
        call append(line("."), "")
    elseif &filetype == 'python'
        call setline(1, "#!/usr/bin/env python")
        call append(line("."), "# coding=utf-8")
        call append(line(".")+1, "")
    else
        call setline(1,          "/*")
        call append(line("."),   " * ".expand("%"))
        call append(line(".")+1, " *")
        call append(line(".")+2, " *  Created on: ".strftime("%c"))
        call append(line(".")+3, " *      Author: hanyunqi")
        call append(line(".")+4, " */")
        call append(line(".")+5, "")
    endif

    if expand("%:e") == 'h'
        let name = toupper(expand("%:gs?/?_?:r:."))."_H_"
        call append(line(".")+6, "#ifndef ".name)
        call append(line(".")+7, "#define ".name)
        call append(line(".")+8, "")
        call append(line(".")+9, "#endif  // ".name)
    elseif expand("%:e") == "c" || expand("%:e") == "cpp"
        call append(line(".")+6, "#include \"".expand("%:t:r").".h\"")
        call append(line(".")+7, "")
    endif
endfunc

autocmd BufNewFile *.cpp,*.[ch],*.sh,*py exec ":call SetTitle()"
