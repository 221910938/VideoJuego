//Módulo Personaje
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 14 de noviembre de 2022
//fecha de ultima modificación: 14 de noviembre de 2022
//comentario: se implementa la clase Personaje con el propósito de organizar los
//datos y procesos inherentes al mismo
class Personaje{
  SpriteSet sspr;
  Punto2D per;
  Colisionador cls;
  PImage imglbr;
  PImage imghpc;
  boolean arma;
  int hp;
  int hpmax;
  int score;
  
  Personaje(){
    per=new Punto2D(150,700);
    sspr=new SpriteSet("sprites/per/mov/run/","per",".png",cf.nprc,cf.prfc,true,0);
    hp=hpmax=cf.hpmax;
    score=0;
    cls=new Colisionador(per,70,new Punto2D(0,0),new Punto2D(250,800));
    imglbr=loadImage("sprites/per/lifebar/lbrbg.png");
    imghpc=loadImage("sprites/per/lifebar/hpc.png");
  }
  
  void display(){
    ellipseMode(RADIUS);
    imageMode(CENTER);
    if(cf.gmode){
      sspr.display(per.getX(),per.getY(),200,200);
    }else{
      stroke(0,120,0);
      fill(0,200,0);
      circle(per.getX(),per.getY(),75);
    }
    cls.drawAreaColision();
    cls.drawRangoColision();
    changeArma();
  }

  void incrLife(int incr){
    hp+=incr;
    if(hp<=hpmax)
      hp=hpmax;
  }
  
  void drawLifeBar(int x,int y){
    herir(2);
    rectMode(CENTER);
    imageMode(CENTER);
    if(cf.gmode){
      image(imghpc,x,y,int(200*(hp*1.0/hpmax)),30); //longitud de vida
      image(imglbr,x,y,200,30); //fondo barra de vida
    }
    else{
      fill(0);
      stroke(0);
      rect(x,y,200,30);
      fill(150,0,0);
      stroke(100,0,0);
      rect(x,y,int(196*(hp*1.0/hpmax)),26);
    }
  }
  
  void saltar(){}
  
  void disparar(){}
  
  void herir(int x){
    hp=hp-x;
    if(hp<=0)
      hp=0;
  }
  
  void morir(){}

  void drawScore(int x,int y)
  {
    textAlign(RIGHT,CENTER);
    fill(0);
    stroke(0);
    textSize(24);
    text(score,x,y);
    textSize(24);
  }

  void incrScore()
  {
    score+=1;
  }

  void changeArma() {
   if (keyPressed) {
      if (key == 'Q'|| key == 'q') {
        arma = !arma;
        println("se presiono q");
        bit.agregaDatosLn("cambio de arma");

      } 
   }
  }

}
