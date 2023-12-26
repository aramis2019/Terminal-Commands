


# Server











# Client

nssm install GOST

nssm set GOST Application c:\Tools\gost\gost-windows-386.exe
nssm set GOST AppDirectory c:\Tools\gost\
nssm set GOST AppParameters  -L=socks://:5500 -L=:5501 -F=ss://chacha20:BISGSucks@45.132.50.100:1085



#
gost-windows-386.exe -L=:3128 -F=ss://chacha20:BISGSucks@45.132.50.100:1085