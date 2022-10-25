//Módulo PantGame 
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 30 de septiembre de 2022
//fecha de ultima modificación: 20 de octubre de 2022
//comentario: Implementa la clase PantGame, la cual controla las acciones del 
//juego.

class PantGame{
  Punto2D bg[];
  Punto2D fg[];
  SpriteSet ssbg;
  SpriteSet ssfg;
  Punto2D per;
  boolean dir;
  int ffg[];
  int fbg[];
  Dado dbg;
  Dado dfg;
  
  PantGame()
  {
    bg=new Punto2D[cf.nbg];
    fbg=new int[cf.nbg];
    dbg= new Dado(cf.nbg);
    creaP2DArray(bg,fbg,dbg,400,400,800,0);

    fg=new Punto2D[cf.nfg];
    ffg=new int[cf.nfg];
    dfg=new Dado(cf.nfg);
    creaP2DArray(fg,ffg,dfg,50,700,200,0);

    ssbg=new SpriteSet("sprites/bg/","bg",".png",cf.nbg,6,false,0);
    ssfg=new SpriteSet("sprites/fg/","fg",".png",cf.nfg,6,false,0);
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
    imageMode(CENTER);
    stroke(0);
    fill(128,128,0);
    graficaPlano(bg,ssbg,fbg,800,800);
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
    imageMode(CENTER);
    stroke(0);
    fill(200,200,0);
    graficaPlano(fg,ssfg,ffg,100,200);
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
    muevePlano(bg,fbg,dbg,cf.bgdx,cf.bgdy,cf.bgli,cf.bgld);  
    muevePlano(fg,ffg,dfg,cf.fgdx,cf.fgdy,cf.fgli,cf.fgld); 
    per.move(((dir)?cf.prdxu:cf.prdxd),((dir)?cf.prdyu:cf.prdyd));
    if(per.getY()==500 || per.getY()==700) dir=!dir;  
  }
  
  void creaP2DArray(Punto2D p[],int f[],Dado d,int xi,int yi,int dx,int dy)
  {

    for(int i=0;i<p.length;i++)
    {
      p[i]=new Punto2D(xi+i*dx,yi+i*dy);
      f[i]=d.tirar()-1;
    } 

  }
  
  void muevePlano(Punto2D p[],int f[],Dado d,int dx,int dy,int li,int ld)
  {
    for(int i=0;i<p.length;i++)
    {
      p[i].move(dx,dy);
      if(p[i].getX()<li) 
      {
        p[i].setX(ld);
        f[i]=d.tirar()-1;
      }
    }
  }
  
  void graficaPlano(Punto2D p[],SpriteSet s,int f[],int x,int y)
  {
    for(int i=0;i<p.length;i++)
    {
      if(cf.gmode)
      {
        image(s.getSprite(f[i]),p[i].getX(),p[i].getY());
      }else{
        rect(p[i].getX(),p[i].getY(),x,y);
      }

    }  
  }
}
