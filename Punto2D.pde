//Módulo Punto2D
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 30 de septiembre de 2022
//comentario: Implementa la clase PantGame, la cual controla las acciones del 
//juego.

class Punto2D
{
    int x;
    int y;

    Punto2D(int x, int y)
    {
        this.x = x;
        this.y = y;
    }

    int getX()
    {
        return x;
    }

    int getY()
    {
        return y;
    }

    void setX(int x)
    {
        this.x = x;
    }

    void setY(int y)
    {
        this.y = y;
    }

    void move(int dx,int dy)
    {
        x += dx;
        y += dy;
    }
}