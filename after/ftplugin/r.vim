set shiftwidth=2

for mapcmd in ['ino', 'tno']
  exec  mapcmd . ' ;s $'
  exec  mapcmd . ' ;; <-'
  exec  mapcmd . ' ;n \|>'
  exec  mapcmd . ' ;m %>%'
  exec  mapcmd . ' ;in %in%'
  exec  mapcmd . ' ;r %%'
  exec  mapcmd . ' ;l ->'
endfor
