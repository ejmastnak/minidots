" Based on Option C of `:help ftdetect` 
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  " Configuration
  au BufNewFile,BufRead *.conf set filetype=conf

  " VIFM
  au BufNewFile,BufRead *.vifm set filetype=vim
  au BufNewFile,BufRead vifmrc set filetype=vim
augroup END
