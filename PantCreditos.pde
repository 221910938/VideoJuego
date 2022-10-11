//Módulo PantCreds
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 3 de octubre de 2022
//fecha de ultima modificación: 3 de octubre de 2022
//comentario: Implementa la clase PantCreditos, la cual se encargará de operar la 
//pantalla de carga del juego.
class PantCreditos{
  PantCreditos(){}
  
  void display(){
    background(color(150,0,150));
    stroke(color(255,255,255));
    textAlign(CENTER,CENTER);
    text(idi.mensaje(7),400,400);
  }
}
