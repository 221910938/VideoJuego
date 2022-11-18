//Módulo PantGame 
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 30 de septiembre de 2022
//fecha de ultima modificación: 14 de noviembre de 2022
//comentario: Implementa la clase PantGame, la cual controla las acciones del 
//juego.
class PantGame{
  Punto2D bg[];
  Punto2D fg[];
  int fbg[];
  int ffg[];
  SpriteSet ssbg;
  SpriteSet ssfg;
  Personaje per;
  Coin coin;
  PImage imghud;
  Dado dbg;
  Dado dfg;
  Dado dcoin;
  Reloj rlj;
  boolean dir;
  boolean rst;
  
  PantGame(){
    dbg=new Dado(cf.nbg);
    bg=new Punto2D[cf.nbg];
    fbg=new int[cf.nbg];
    creaP2DArray(bg,fbg,dbg,400,400,800,0);

    dfg=new Dado(cf.nfg);
    fg=new Punto2D[cf.nfg];
    ffg=new int[cf.nfg];
    creaP2DArray(fg,ffg,dfg,100,700,500,0);

    ssbg=new SpriteSet("sprites/bg/","bg",".png",cf.nbg,2,false,0);
    ssfg=new SpriteSet("sprites/fg/","fg",".png",cf.nfg,2,false,0);
    imghud=loadImage("sprites/HUD/hud.png");

    per=new Personaje();
    coin=new Coin(500,700);
    dcoin=new Dado(3);
    rlj=new Reloj();
    rlj.iniciaReloj();
    dir=true;
    rst=false;
  }
  
  void display(){
    music();
    if(rst){
      resetGame();
      rst=false;
    }
    planoFondo();
    planoNivel();
    planoFrente();
    planoHUD();
    gameProgress();
  }
  
  void planoFondo(){
    rectMode(CENTER);
    imageMode(CENTER);
    stroke(0);
    fill(128,128,0);
    graficaPlano(bg,ssbg,fbg,800,800,false);
  }
  
  void planoNivel(){
    per.display();
    displayMonedas();
    //coin.display();
  }
  
  void planoFrente(){
    rectMode(CENTER);
    imageMode(CENTER);
    stroke(0);
    fill(200,200,0);
    graficaPlano(fg,ssfg,ffg,100,50,true);
  }
  
  void planoHUD(){
    rectMode(CENTER);
    imageMode(CENTER);
    if(cf.gmode){
      image(imghud,400,60);
    }
    else{
      stroke(0);
      fill(220,220,220);
      rect(400,60,800,120);
    }  
    per.drawLifeBar(230,50);
    per.drawScore(450,50);
    rlj.display(720,50);
  }
  
  void gameProgress(){
    muevePlano(bg,fbg,dbg,cf.bgdx,cf.bgdy,cf.bgli,cf.bgld);  
    muevePlano(fg,ffg,dfg,cf.fgdx,cf.fgdy,cf.fgli,cf.fgld); 
    coin.move();
    revisaColisiones();
    rlj.controlReloj();
    //per.move(((dir)?cf.prdxu:cf.prdxd),((dir)?cf.prdyu:cf.prdyd));
    //if(per.getY()==500 || per.getY()==700) dir=!dir;  
  }

  void revisaColisiones(){
    if(per.cls.isColision(coin.cls)){
      per.incrScore();
      coin.toggleActive();
      coin=new Coin(900,((dcoin.tirar()==1)?400:700));
    }
  }
  
  void creaP2DArray(Punto2D p[],int f[],Dado d,int xi,int yi,int dx,int dy){
    for(int i=0;i<p.length;i++){
      p[i]=new Punto2D(xi+i*dx,yi+i*dy);
      f[i]=d.tirar()-1;
    }  
  }
  
  void muevePlano(Punto2D p[],int f[],Dado d,int dx,int dy,int li,int ld){
    for(int i=0;i<p.length;i++){
      p[i].move(dx,dy);
      if(p[i].getX()<li){
        p[i].setX(ld);
        f[i]=d.tirar()-1;
      }  
    }
  }
  
  void graficaPlano(Punto2D p[],SpriteSet s,int f[],int x,int y,boolean t){
    for(int i=0;i<p.length;i++)
      if(cf.gmode){
        if(t && p[i].getX()<=300 && p[i].getY()>=0) tint(255,128);
        image(s.getSprite(f[i]),p[i].getX(),p[i].getY());
        if(t && p[i].getX()<=300 && p[i].getY()>=0) noTint();
      }  
      else{
        rect(p[i].getX(),p[i].getY(),x,y);  
      }
  }
  
  void resetGame(){
    rlj.resetReloj();
    rlj.iniciaReloj();
  }
  
  void mouseControl(int x,int y,int b){
    rlj.detenReloj();
    rst=true;
    gc.musicManager(MSCOFF);
    gc.setPantAct(PNINT);
  }

  void displayMonedas(){
   coin.display();
  }
}
