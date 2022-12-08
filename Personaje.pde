//Módulo Personaje
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 14 de noviembre de 2022
//fecha de ultima modificación: 5 de diciembre de 2022
//comentario: se implementa la clase Personaje con el propósito de organizar los
//datos y procesos inherentes al mismo
class Personaje{
  SpriteSet sspr;    //animación de correr
  SpriteSet ssjp;    //animación de salto
  SpriteSet ssfl;    //animación de caida
  SpriteSet ssht;    //animación de herido
  SpriteSet ssdd;    //animación de muerte
  Temporizador tmp;  //controla el tiempo de animaciones especiales, modo básico
  Punto2D per;       //posición del personaje
  Colisionador cls;  //colisionador del personaje
  PImage imglbr;     //imagen barra de vida
  PImage imghpc;     //imagen de marco de barra de vida
  int hp;            //puntos de vida actuales del personaje
  int hpmax;         //puntos de vida máximos 
  int score;         //puntaje obtenido
  int state;         //estado del personaje para controlar la animación
  boolean onjmp;     //salto en progreso
  boolean onfal;     //caída en progreso 
  boolean onhit;     //herida en progreso
  int maxhg;         //altura de salto tope
  String scoredata;  //datos para enviar a marcadores tope
  String name;       //nombre del personaje
  int fps;
  boolean oneTime;
  
  //Constructor: se inicia todo el personaje
  Personaje(){
    per=new Punto2D(150,cf.flmax); //posición
    tmp=new Temporizador(cf.nprh*cf.prfh);
    //datos de control
    hp=hpmax=cf.hpmax;
    score=0;
    state=STRUN;
    maxhg=cf.flmax-cf.jmpsz;
    //variados
    cls=new Colisionador(per,cf.pclsz,new Punto2D(0,0),new Punto2D(250,800));
    imglbr=loadImage("sprites/per/lifebar/lbrbg.png");
    imghpc=loadImage("sprites/per/lifebar/hpc.png");
    //indicadores de estado activo
    onjmp=false;
    onfal=false;
    onhit=false;
    oneTime=true;
  }
  
  //control de graficado
  void display(){
    ellipseMode(RADIUS);
    imageMode(CENTER);
    if (oneTime) {
      cargarTexturas();
      oneTime=false;
    }
    animationStatus();
    //se grafican los datos de colisionadores
    if(cf.datad){
      cls.drawAreaColision();
      cls.drawRangoColision();
      stroke(255);
      line(0,maxhg,800,maxhg);
      stroke(255,255,0);
      line(0,cf.flmax,800,cf.flmax);
    }
  }

  void cargarTexturas(){
    if(cf.per){
      name="per";
      fps=24;
    }else{
      name="per1";
      fps=4;
    } 
    println(cf.per,name,fps);
    sspr=new SpriteSet("sprites/"+name+"/movement/run/","per",".png",fps,cf.prfc,true,0);
    ssjp=new SpriteSet("sprites/"+name+"/movement/jump/","jump",".png",fps,cf.prfj,true,0);
    ssfl=new SpriteSet("sprites/"+name+"/movement/fall/","fall",".png",fps,cf.prff,true,0);
    ssht=new SpriteSet("sprites/"+name+"/movement/hit/","hit",".png",fps,cf.prfh,true,0);
    ssdd=new SpriteSet("sprites/"+name+"/movement/die/","die",".png",fps,cf.prfd,true,0); 
  }
  
  //control de animación del personaje
  void animationStatus(){
    switch(state){
      //las primeras animaciones se controlan igual
      case STRUN: hitControl(sspr);
                  break;
      case STJMP: hitControl(ssjp);
                  break;
      case STFAL: hitControl(ssfl);
                  break;
      //la animación de muerte es la más compleja por única
      case STDIE: if(cf.gmode){
                    if(!ssdd.isEndOnTime())
                      ssdd.display(per.getX(),per.getY(),200,200);
                    else{
                      image(ssdd.getSprite(cf.nprd-1),per.getX(),per.getY(),200,200);
                      endGame();
                    }
                  }
                  else{
                    stroke(100,0,0);
                    fill(100,0,0);
                    circle(per.getX(),per.getY(),75);
                    endGame();
                  }
    }
  }
  
  //desactivado de elementos tras terminar el juego
  void endGame(){
    gc.pngme.rst=true;
    cursor(HAND);
    ts.addScore(scoredata);
    ts.saveData();
    gc.musicManager(MSCOFF);
    gc.setPantAct(PNINT);
  }
  
  //graficado de la barra de vida
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
  
  //Se controla animación de golpe o la que estuviera activa al momento de choque
  void hitControl(SpriteSet ssa){
    //animación de golpe
    if(onhit){
      if(cf.gmode){
        if(!ssht.isEndOnTime())
          ssht.display(per.getX(),per.getY(),200,200);
        else{
          onhit=false;
          cls.activate();
        }  
      }
      else{
        stroke(120,0,0);
        fill(0,200,0);
        circle(per.getX(),per.getY(),75);
        tmp.coolingDown();
        if(tmp.isOff()){
          onhit=false;
          cls.activate();
        } 
      }  
    }  
    //animación de salto, caída o correr
    else 
      if(cf.gmode)
        ssa.display(per.getX(),per.getY(),200,200);
      else{
        stroke(0,120,0);
        fill(0,200,0);
        circle(per.getX(),per.getY(),75);
      }  
  }
  
  //control de movimiento del personaje
  void controlMov(Plataforma p){
    switch(state){
      //saltando
      case STJMP: if(onjmp){ 
                    //salto base
                    per.move(0,cf.jmpsp); 
                    cls.moverCol(per);
                  }
                  if(p.isPerOver(this)){
                    //salto y se cae en plataforma
                    state=STRUN;
                    onjmp=false;
                    onfal=false;
                    maxhg-=cf.jmpsz;
                  }
                  if(per.getY()<=maxhg && !p.isPerOver(this)){ 
                    //si no se llega a la plataforma
                    caer();
                  }
                  break;
      //cayendo            
      case STFAL: if(onfal){
                    //caida básica
                    per.move(0,cf.falsp); 
                    cls.moverCol(per);
                  }
                  if(per.getY()>=cf.flmax) {
                    //al llegar al piso
                    state=STRUN;
                    onfal=false;
                    onjmp=false;
                    maxhg=cf.flmax-cf.jmpsz;
                    sfxghit.trigger();
                  }  
                  break;
      //corriendo            
      case STRUN: if(per.getY()<cf.flmax && !p.isPerOver(this)) 
                    //si se viene corriendo sobre una plataforma y termina
                    caer();
                  if(p.isPerOver(this) && onjmp)
                    //segundo salto, sobre plataforma
                    state=STJMP;  
    }
  }
  
  //accion de salto, desde la perspectiva del personaje
  void saltar(){
    onjmp=true;
    onfal=false;
    sfxjmp.trigger();
    state=STJMP;
  }
  
  //acción de caída, desde la perspectiva del personaje
  void caer(){
    onjmp=false; 
    onfal=true;
    state=STFAL;
  }
  
  //acción de recibir un golpe, desde la perspectiva del personaje
  void herir(){
    hp-=cf.hphit+gc.getDfcHit();
    onhit=true;
    ssht.activateOneTime();
    tmp.activate();
    cls.deactivate();
    if(hp<=0){
      hp=0;
      morir();
    }
    else
      sfxhit.trigger();
  }
  
  //acción de morir, desde la perspectiva del personaje
  void morir(){
    state=STDIE;
    cls.deactivate();
    ssdd.activateOneTime();
    sfxdie.trigger();
  }
  
  //incremento de puntaje
  void incrScore(){
    score+=cf.cnscr;
  }
  
  //graficado del puntaje alcanzado
  void drawScore(int x,int y){
    textAlign(RIGHT,CENTER);
    fill(0);
    stroke(0);
    textSize(cf.fntbig);
    text(score,x,y);
    textSize(cf.fntstd);
  }
  
  //reinicio del personaje
  void resetPer(){
    score=0;
    hp=hpmax;
    state=STRUN;
    cls.activate();
    per=new Punto2D(150,cf.flmax);
    cls.moverCol(per);
    onjmp=onfal=onhit=false;
  }
  
  //curación del personaje
  void curar(){
    hp=(hp+cf.hprcv+gc.getDfcCur()>=hpmax)?hpmax:hp+cf.hprcv+gc.getDfcCur();
  }
  
  //indica si el personaje ha muerto
  boolean isDead(){
    return hp<=0;
  }
  
  //devuelve el marcador
  int getScore(){
    return score;
  }
  
  //se guarda la información de puntaje
  void setScoreData(String s){
    scoredata=s;
  }
}
