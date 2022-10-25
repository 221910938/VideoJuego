//Proyecto  
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 26 de septiembre de 2022
//fecha de ultima modificación: 10 de octubre de 2022
//comentario: Contiene los procesos iniciales del juego, adicionalmente envia a
//los objetos de control las operaciones de entrada/salida básica

class Dado
{
    int numeroCaras;
    int tirada;

    Dado(int n)
    {
        numeroCaras=n;
    }

    int tirar()
    {
        tirada=int(random(1,numeroCaras+1));
        return tirada;
    }
}