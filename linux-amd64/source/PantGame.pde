//Módulo PantGame 
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 30 de septiembre de 2022
//fecha de ultima modificación: 14 de octubre de 2022
//comentario: Implementa la clase PantGame, la cual controla las acciones del 
//juego.
class PantGame{

  Punto2D bg[];

  Punto2D fg[];

  Punto2D per;
  boolean dir;
  
  PantGame()
  {

    bg=new Punto2D[2];

    creaP2DArray(bg,400,400,800,0);

    fg=new Punto2D[4];

    creaP2DArray(fg,50,700,200,0);

    per=new Punto2D(240,600);
    dir=true;
  }
  
  void display()
  {
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

    graficarPlano(bg,800,800);

  }
  
  void planoNivel()
  {
    ellipseMode(RADIUS);
    stroke(0,120,0);
    fill(0,200,0);
    circle(per.getX(),per.getY(),75);
  }
  
  void planoFrente()
  {
    rectMode(CENTER);
    stroke(0);
    fill(200,200,0);
    graficarPlano(fg,50,200);
  }
  
  void planoHUD()
  {
    rectMode(CENTER);
    stroke(0);
    fill(220,220,220);
    rect(400,60,800,120);
  }
  
  void gameProgress()
  {

    muevePlano(bg,cf.velocidadHorizontalFondo,cf.velocidadVerticalFondo,-400,-1200);

    muevePlano(fg,cf.velocidadHorizontalFrente,cf.velocidadVerticalFrente,-25,825);

    per.move(((dir)?cf.velocidadHorizontalAscendentePersonaje:cf.velocidadVerticalAscendentePersonaje),((dir)?cf.velocidadHorizontalDescendenteFrente:cf.velocidadVerticalDescendenteFrente));

    if(per.getY()==500 || per.getY()==700) dir=!dir;  
  }

  void creaP2DArray(Punto2D p[], int xi, int yi, int dx, int dy)
  {
    for(int i=0;i<p.length;i++) p[i]=new Punto2D(xi+i*dx,yi+i*dy);
  }

  void muevePlano(Punto2D p[], int dx, int dy, int li,int ld)
  {
    for(int i=0;i<p.length;i++) 
    {
      p[i].move(dx,dy);
      
      if(p[i].getX()<li) p[i].setX(ld);
    }
  }

  void graficarPlano(Punto2D p[], int x, int y)
  {
    for(int i=0;i<p.length;i++) rect(p[i].getX(),p[i].getY(),x,y);
  }


}
