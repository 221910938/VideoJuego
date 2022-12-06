//Módulo PantPausa
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 30 de noviembre de 2022
//fecha de ultima modificación: 5 de diciembre de 2022
//comentario: Implementa la clase PantPausa, la cual se encargará de operar la 
//pantalla de pausa del juego.
class PantPausa{
  Boton btnret;  //Regresa al juego
  Boton btnext;  //Regresa a la pantalla principal
  
  //Constructor: creación de botones solamente
  PantPausa(){
    btnret=new Boton(250,700,250,60,33);
    btnext=new Boton(550,700,250,60,34);
  }
  
  //Graficado de los botones
  void display(){
    if(cf.gmode) background(gc.imgfondo);
    else background(0,150,150);
    stroke(255);
    textAlign(CENTER,CENTER);
    text(idi.mensaje(32),400,100);
    btnret.display();
    btnext.display();
  }
  
  //Control de acciones de mouse
  void mouseControl(int x,int y,int b){
    //Regresar al juego
    if(btnret.isClicked(x,y,b)){
      mscgame.loop();
      gc.setPantAct(PNGME);
    }  
    //Salir a pantalla principal
    if(btnext.isClicked(x,y,b)){
      gc.musicManager(MSCOFF);
      gc.setPantAct(PNINT); 
    }  
  }
  
  //Control del cursor, sobre botones
  void mouseControl(int x,int y){
    cursor((btnret.isOver(x,y)||btnext.isOver(x,y))?HAND:ARROW);  
  }
}
