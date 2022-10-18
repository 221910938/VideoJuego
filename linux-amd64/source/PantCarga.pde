//Módulo PantCarga 
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 30 de septiembre de 2022
//comentario: Implementa la clase PantCarga, la cual se encargará de operar la 
//pantalla de carga del juego.
class PantCarga{
  PantCarga(){}
  
  void display(){
    background(color(150,0,0));
    stroke(color(255,255,255));
    textAlign(CENTER,CENTER);
    text(idi.mensaje(6),400,400);
  }
}
