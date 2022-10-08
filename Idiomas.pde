//Proyecto de videojuego 2022 IDGS102
//Elaborado por: Angel Palacios Mirafuentes
//26 de septiembre de 2022

class Idiomas
{
    String idiomas [][];
    String file [];
    int idiomaActivo;
    int numeroMensajes;


    Idiomas(int lenguaje,int numMens)
    {
        idiomaActivo=lenguaje;
        numeroMensajes=numMens;
        idiomas = new String [numeroMensajes][2];
        cargaIdioma(IDIOMAESP);
        cargaIdioma(IDIOMAENG);
    }

    void cargaIdioma(int i)
    {
        int n;

        file=loadStrings((i==IDIOMAESP) ? "esp.lang":"eng.lang");

        for (n = 0; n < numeroMensajes; ++n) {
            idiomas[n][i]= split(file[n], '=')[1];
        }
    }

    void setIdioma(int i)
    {
        idiomaActivo = i;
    }

    int getIdioma()
    {
        return idiomaActivo;
    }

    String mensaje(int i)
    {
        return idiomas[i][idiomaActivo];
    }
}