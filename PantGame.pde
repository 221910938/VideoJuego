//Módulo PantGame 
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 30 de septiembre de 2022
//comentario: Implementa la clase PantGame, la cual controla las acciones del 
//juego.

class PantGame
{
    Punto2D background1;
    Punto2D background2;
    Punto2D fg1;
    Punto2D fg2;
    Punto2D fg3;
    Punto2D fg4;
    Punto2D per;
    boolean dir; 

  PantGame()
  {
    background1 = new Punto2D(400, 400);
    background2 = new Punto2D(1200, 400);
    fg1 = new Punto2D(50, 700);
    fg2 = new Punto2D(250, 700);
    fg3 = new Punto2D(450, 700);
    fg4 = new Punto2D(650, 700);
    per = new Punto2D(120, 600);
    dir=true;
  }
  
  void display(){
    // background(color(0,0,150));
    // stroke(color(255,255,255));
    // textAlign(CENTER,CENTER);
    // text(idi.mensaje(9),400,400);
    planoFondo();
    planoNivel();
    planoFrente();
    planoHUD();
    gameProgress();
  }

  void planoFondo()
  {
    rectMode(CENTER);
    stroke(0);
    fill(128,128,0);
    rect(background1.getX(), background1.getY(), 800, 800);
    fill(128,0,128);
    rect(background2.getX(), background2.getY(), 800, 800);
  }

  void planoNivel()
  {
     ellipseMode(RADIUS);
     stroke(0,120,0);
     fill(0,255,0);
     circle(per.getX(),per.getY(),75);
  }

  void planoFrente()
  {
    rectMode(CENTER);
    stroke(0);
    fill(200,200,0);
    rect(fg1.getX(), background1.getY(), 50, 200);
    fill(200,0,200);
    rect(fg2.getX(), background2.getY(), 50, 200);
    fill(200,200,0);
    rect(fg3.getX(), background1.getY(), 50, 200);
    fill(200,0,200);
    rect(fg4.getX(), background2.getY(), 50, 200);
  }

  void planoHUD()
  {
    rectMode(CENTER);
    stroke(0);
    fill(220, 220, 220);
    rect(400,60,800,120);
  }

  void gameProgress()
  {
    background1.move(-1, 0);
    background2.move(-1, 0);

    if (background1.getX() < -400) background1.setX(1200);
    if (background2.getX() < -400) background2.setX(1200);

    fg1.move(-2, 0);
    fg2.move(-2, 0);
    fg3.move(-2, 0);
    fg4.move(-2, 0);

    if (fg1.getX() < -25) fg1.setX(825);
    if (fg2.getX() < -25) fg2.setX(825);
    if (fg3.getX() < -25) fg3.setX(825);
    if (fg4.getX() < -25) fg4.setX(825);
    per.move(0,((dir)?-2:1));
    if(per.getY()==500|| per.getY()==700) dir=!dir;
    
  }
}
