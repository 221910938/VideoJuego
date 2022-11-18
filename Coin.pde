//Módulo Coin
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 10 de octubre de 2022
//fecha de ultima modificación: 29 de octubre de 2022
//comentario: Coin

class Coin{

    Punto2D pos;
    boolean active;
    int rot;
    boolean dir;

    Coin(int x, int y){
        pos = new Punto2D(x, y);
        active = true;
        rot=0;
        dir=true;
    }

    void display()
    {
        imageMode(CENTER);
        ellipseMode(CENTER);
        if (active) {
            if (cf.gmode) {
                //image(imgcoin,pos.getX(),pos.getY(),75-rot,75);
            }else{
                fill(0);
                stroke(0);
                circle(pos.getX(),pos.getY(),75);
            }
        }
    }
}
