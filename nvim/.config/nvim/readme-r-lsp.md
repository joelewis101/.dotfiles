To get rid of the rmarksdown lsp error

edit
/opt/homebrew/Cellar/neovim/0.9.1/share/nvim/runtime/lua/vim/diagnostic.lua

add
        if type(d.col) ~= "number" then d.col = -1 end 
        if type(d.end_col) ~= "number" then d.end_col = -1 end 

at line 400 and 401
