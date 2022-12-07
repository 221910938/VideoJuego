//Módulo PantCarga 
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 30 de septiembre de 2022
//fecha de ultima modificación: 5 de diciembre de 2022
//comentario: Implementa la clase PantCarga, la cual se encargará de operar la 
//pantalla de carga del juego.
class PantCarga{
  SpriteSet ssload;      //animación del corredor
  Temporizador tmpidle;  //tiempo de espera tras el final de la carga
  int msg;               //mensaje específico de progreso
  boolean loading;       //indica si la carga está en proceso
  
  //Constructor: carga la animación del corredor y prepara la carga de recursos
  PantCarga(){
    ssload=new SpriteSet("sprites/per/movement/run/","per",".png",cf.nprc,cf.prfc,true,0);
    tmpidle=new Temporizador(180);
    loading=true;
  }
  
  //muestra el estado actual del proceso de carga
  void display(){
    if(cf.gmode) background(gc.imgfondo);
    else background(150,0,0);
    stroke(255);
    textAlign(CENTER,CENTER); fill(0,0,0);
    fill(0,0,0);
    text(idi.mensaje(6),400,100);
    imageMode(CENTER);
    ssload.display(400,400,200,200);
    text(idi.mensaje(msg),400,600);
    if(!loading && !tmpidle.isActive())
      tmpidle.activate();
    if(tmpidle.isActive())
      tmpidle.coolingDown();
    if(tmpidle.isOff())
      gc.setPantAct(PNINT);
  }
}
