install viewer:

-> Tenir OPEN_GL 3.30

-> Install Qt (version 5.X): http://wiki.qt.io/Install_Qt_5_on_Ubuntu

->Executa qmake: ..../Qt5.7.0/5.7/gcc_64/bin/qmake <- buscar el qmake del Qt que hagis installat (estara on l'hagis instalat, potser no exactament a aquest path)

-> Afegir: export LD_LIBRARY_PATH=$PWD/viewer/bin

-> Descomentar al "viewer/app/main.cpp" la linea: glFormat.setVersion( 3, 3);

-> Hacer lo que pone en el documento "MacInstallation"

