class PantHistoria{
  SpriteSet ssload;
  //SpriteSet ssMama;//animación del corredor
  PImage ssMama;
  Temporizador tmpidle;  //tiempo de espera tras el final de la carga
  int msg;               //mensaje específico de progreso
  boolean loading;       //indica si la carga está en proceso
  Boton btnret;
  int cont=1;
  
  //Constructor: carga la animación del corredor y prepara la carga de recursos
  PantHistoria(){
    ssload=new SpriteSet("sprites/per/movement/run/","per",".png",cf.nprc,cf.prfc,true,0);
    //ssMama=new SpriteSet("sprites/per/movement/run/","per2",".png",cf.nprc,cf.prfc,true,0);
     ssMama=loadImage("sprites/per/movement/run/mama.png");
    tmpidle=new Temporizador(180);
    loading=true;
    btnret=new Boton(400,500,150,30,26);
  }
  
  //muestra el estado actual del proceso de carga
  void display(){
    if(cf.gmode) background(gc.imgCasa);
    else background(150,0,0);
    stroke(255);
    textAlign(CENTER,CENTER); fill(0,0,0);
    fill(0,0,0);
    text("Pantalla de historia",400,100);
    imageMode(CENTER);
    ssload.display(110,450,200,200);
    image(ssMama,650,450,200,200);
    //text(idi.mensaje(msg),400,600);
    btnret.display();
    
    if(!loading && !tmpidle.isActive())
      tmpidle.activate();
    if(tmpidle.isActive())
      tmpidle.coolingDown();
    if(tmpidle.isOff())
      gc.setPantAct(PNINT);
  }

 void mouseControl(int x,int y,int b){
    //Regresar al juego
    if(btnret.isClicked(x,y,b)){
      mscgame.loop();
      //gc.setPantAct(PNSELP);
        //delay(5000);
        cont=cont+1;
        switch(cont){
            case 1: 
            text("Madre: Ve por tortillas",450,300);
            //delay(5000);
            break;
            case 2: 
            text("Hija: Estoy jugando Fornite",250,350);
            //delay(5000);
            break;
            case 3: 
            text("Mama: Ve o te apago el nientiendo",450,300);
            //delay(5000);
            break;
            case 4: 
            text("Hija esta bien ya voy!!! >:c",250,350);
            //delay(5000);
            break;
            case 5: 
            gc.setPantAct(PNSELP);
            break;
        }
    }  
    
  }
  
  //Control del cursor, sobre botones
  void mouseControl(int x,int y){
    cursor((btnret.isOver(x,y))?HAND:ARROW);  
  }


}
