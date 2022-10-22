//Módulo PantScore
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 3 de octubre de 2022
//fecha de ultima modificación: 7 de octubre de 2022
//comentario: Implementa la clase PantScore, la cual se encargará de operar la 
//pantalla de carga del juego.
class PantScore{
  PantScore(){}
  
  void display(){
    background(color(150,150,150));
    stroke(color(255,255,255));
    textAlign(CENTER,CENTER);
    text(idi.mensaje(12),400,400);
  }
}
