//Módulo PantCarga 
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 30 de septiembre de 2022
//fecha de ultima modificación: 14 de noviembre de 2022
//comentario: Implementa la clase PantCarga, la cual se encargará de operar la 
//pantalla de carga del juego.
class PantCarga{
  SpriteSet ssload;
  Temporizador tmpidle;
  int msg;
  boolean loading;
  
  PantCarga(){
    ssload=new SpriteSet("sprites/per/mov/run/","per",".png",cf.nprc,cf.prfc,true,0);
    tmpidle=new Temporizador(180);
    loading=true;
  }
  
  void display(){
    if(cf.gmode) background(back);
    else background(color(150,150,150));
    stroke(color(255,255,255));
    textAlign(CENTER,CENTER);
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
