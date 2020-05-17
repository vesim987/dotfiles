let b:current_syntax = ''
unlet b:current_syntax
syntax include @LUA syntax/lua.vim

syntax region luaCode start=/lua\W*<<\z\(\w\+\)/ end=/^\z1$/ contains=@LUA
