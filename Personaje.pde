//Módulo Personaje
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 14 de noviembre de 2022
//fecha de ultima modificación: 25 de noviembre de 2022
//comentario: se implementa la clase Personaje con el propósito de organizar los
//datos y procesos inherentes al mismo
class Personaje{
  SpriteSet sspr;
  SpriteSet ssjp;
  SpriteSet ssfl;
  SpriteSet ssht;
  SpriteSet ssdd;
  Punto2D per;
  Colisionador cls;
  PImage imglbr;
  PImage imghpc;
  boolean arma;
  int hp;
  int hpmax;
  int score;
  int state;
  boolean onjmp;
  boolean onfal;
  boolean onhit;
  int maxhg;
  
  Personaje(){
    per=new Punto2D(150,700);
    sspr=new SpriteSet("sprites/per/movement/run/","per",".png",23,1,true,0);
    ssjp=new SpriteSet("sprites/per/movement/run/","per",".png",23,1,true,0);
    ssfl=new SpriteSet("sprites/per/movement/run/","per",".png",23,1,true,0);
    ssht=new SpriteSet("sprites/per/movement/run/","per",".png",23,1,true,0);
    ssdd=new SpriteSet("sprites/per/movement/run/","per",".png",23,1,true,0);
    hp=hpmax=cf.hpmax;
    score=0;
    state=STRUN;
    maxhg=200;
    cls=new Colisionador(per,100,new Punto2D(0,0),new Punto2D(250,800));
    imglbr=loadImage("sprites/per/lifebar/lbrbg.png");
    imghpc=loadImage("sprites/per/lifebar/hpc.png");
    onjmp=false;
    onfal=false;
    onhit=false;
  }
  
  void display(){
    println(per.getX(),per.getY());
    ellipseMode(RADIUS);
    imageMode(CENTER);
    if(cf.gmode)
      animationStatus();
    else{
      stroke(0,120,0);
      fill(0,200,0);
      circle(per.getX(),per.getY(),75);
    }
      cls.drawAreaColision();
      cls.drawRangoColision();
      stroke(255);
      //line(0,maxhg,800,maxhg);
      stroke(255,255,0);
      line(0,200,800,200);
    
  }

  void changeArma() {
    arma = !arma;
  }
  
  void animationStatus(){
    switch(state){
      case STRUN: hitControl(sspr);
                  break;
      case STJMP: hitControl(ssjp);
                  break;
      case STFAL: hitControl(ssfl);
                  break;
      case STDIE: if(!ssdd.isEndOnTime())
                    ssdd.display(per.getX(),per.getY(),200,200);
                  else{
                    image(ssdd.getSprite(0),per.getX(),per.getY(),200,200);
                    gc.pngme.rst=true;
                    cursor(HAND);
                    gc.musicManager(MSCOFF);
                    gc.setPantAct(PNINT);
                  } 
    }
  }
  
  void drawLifeBar(int x,int y){
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
  
  void hitControl(SpriteSet ssa){
    if(onhit){
      if(!ssht.isEndOnTime())
        ssht.display(per.getX(),per.getY(),200,200);
      else
        onhit=false;
    }else{
        ssa.display(per.getX(),per.getY(),200,200);
    }
  }
  
  void controlMov(){
    switch(state){
      case STJMP: 
                if(onjmp){ 
                    per.move(0,-10); 
                    cls.moverCol(per);
                  }
                   if(per.getY()<=300){ 
                     caer();
                   }
                    
                  break;
      case STFAL: if(onfal){ 
                    per.move(0,200); 
                    cls.moverCol(per);
                  }  

                  if(per.getY()>=500) {
                    state=STRUN;
                    onfal=false;
                    onjmp=false;
                    maxhg=200;
                  }  

                  if(per.getY()>=700) {
                   per.setY(700);
                  }
                  break;
      case STHIT:
                  break;
      case STDIE:
                  break;
      case STRUN: if(per.getY()<200){ 
                    caer();
                  }
    }
  }
  
  void saltar(){
    onjmp=true;
    onfal=false;
    state=STJMP;
  }
  
  void caer(){
    onjmp=false; 
    onfal=true;
    state=STFAL;
  }
  
  void disparar(){}
  
  void herir(){
    hp-=250;
    onhit=true;
    ssht.activateOneTime();
    if(hp<=0){
      hp=0;
      morir();
    }
  }
  
  void morir(){
    state=STDIE;
    cls.deactivate();
    ssdd.activateOneTime();
  }
  
  void incrScore(){
    score+=20;
  }
  
  void drawScore(int x,int y){
    textAlign(RIGHT,CENTER);
    fill(0);
    stroke(0);
    textSize(20);
    text(score,x,y);
    textSize(cf.fntstd);
  }
  
  void resetPer(){
    score=0;
    hp=hpmax;
    state=STRUN;
    cls.activate();
    per=new Punto2D(150,700);
    cls.moverCol(per);
    onjmp=onfal=onhit=false;
  }

  void incrLife(int incr){
    hp+=incr;
    if(hp<=hpmax)
      hp=hpmax;
  }
  
  void curar(){
    hp=(hp+200>=hpmax)?hpmax:hp+200;
  }
  
  boolean isDead(){
    return hp<=0;
  }
}
