//Módulo PantInstruc
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 3 de octubre de 2022
//fecha de ultima modificación: 3 de octubre de 2022
//comentario: Implementa la clase PantInstruc, la cual se encargará de operar la 
//pantalla de carga del juego.
class PantInstruc{
  PantInstruc(){}
  
  void display(){
    background(color(0,150,150));
    stroke(color(255,255,255));
    textAlign(CENTER,CENTER);
    text("Pantalla de Instrucciones",400,400);
  }
}
