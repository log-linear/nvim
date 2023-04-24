set shiftwidth=2

for mapcmd in ['ino', 'tno']
  exec  mapcmd . ' ;s $'
  exec  mapcmd . ' ;; <-'
  exec  mapcmd . ' ;n \|>'
  exec  mapcmd . ' ;m %>%'
  exec  mapcmd . ' ;in %in%'
  exec  mapcmd . ' ;r %%'
  exec  mapcmd . ' ;v <space>\|> vd()'
  exec  mapcmd . ' ;V <space>\|> View()'
  exec  mapcmd . ' ;c <space>\|> colnames()'
  exec  mapcmd . ' ;o objs()'
  exec  mapcmd . ' ;l ->'
endfor
