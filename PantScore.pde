//Módulo PantScore
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 3 de octubre de 2022
//fecha de ultima modificación: 5 de diciembre de 2022
//comentario: Implementa la clase PantScore, la cual se encargará de operar la 
//pantalla de carga del juego.
class PantScore{
  Boton btnret;  //Botón de regreso a pantalla principal
  
  //Constructor: se inicia el control de marcadores y botón
  PantScore(){
    ts=new TopScores();
    btnret=new Boton(400,700,250,60,15); 
  }
  
  //se grafica la tabla de puntajes
  void display(){
    if(cf.gmode) background(gc.imgfondo);
    else background(150);
    stroke(255);
    textAlign(CENTER,CENTER);
    text(idi.mensaje(12),400,100);
    ts.displayData();
    btnret.display();
  }
  
  //control del botón de regreso
  void mouseControl(int x,int y,int b){
    //volver a pantalla principal
    if(btnret.isClicked(x,y,b))
      gc.setPantAct(PNINT);
  }
}
