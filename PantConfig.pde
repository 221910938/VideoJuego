//Módulo PantConfig
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 3 de octubre de 2022
//fecha de ultima modificación: 3 de octubre de 2022
//comentario: Implementa la clase PantConfig, la cual se encargará de operar la 
//pantalla de carga del juego.
class PantConfig{
  PantConfig(){}
  
  void display(){
    background(color(150,150,0));
    stroke(color(255,255,255));
    textAlign(CENTER,CENTER);
    text("Pantalla de Configuracion",400,400);
  }
}
