//Módulo Personaje
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 30 de septiembre de 2022
//fecha de ultima modificación: 31 de octubre de 2022
//comentario: Personaje

class Personaje
{
    SpriteSet sspr;
    Punto2D per;
    PImage imglbr;
    PImage imghpc;
    int hp;
    int hpmax;

    Personaje()
    {
        sspr=new SpriteSet("sprites/per/mov/run/","per",".png",cf.nprc,cf.prfc,true,0);
        per=new Punto2D(150,700);
        hp=hpmax=cf.hpmax;
        imglbr=loadImage("sprites/per/lifebar/lbrbg.png");
        imghpc=loadImage("sprites/per/lifebar/hpc.png");

    }

    void display()
    {
      ellipseMode(RADIUS);
      imageMode(CENTER);

    if(cf.gmode)
      sspr.display(per.getX(),per.getY(),200,200);
    else{
      stroke(0,120,0);
      fill(0,200,0);
      circle(per.getX(),per.getY(),75);
    }
      drawLifeBar(230,50);
    }

    void drawLifeBar(int x,int y)
    {
        rectMode(CENTER);
        //corner para la barra de vida a un lado
        imageMode(CENTER);
        if(cf.gmode)
        {
            image(imghpc,x,y,int(200*(hp*1.0/hpmax)),30);
            image(imghpc,x,y,200,30);
        }else{
            fill(0);
            stroke(0);
            rect(x,y,200,30);

            fill(150,0,0);
            stroke(100,0,0);
            rect(x,y,int(196*(hp*1.0/hpmax)),26);
        }
    }

    void saltar()
    {

    }

    void disparar()
    {

    }

    void herir()
    {

    }

    void morir()
    {

    }
}

