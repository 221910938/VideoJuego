//Módulo PantConfig
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 3 de octubre de 2022
//fecha de ultima modificación: 10 de octubre de 2022
//comentario: Implementa la clase PantConfig, la cual se encargará de operar la 
//pantalla de carga del juego.
class PantConfig{
  Boton btnidi;
  Boton btnsav;
  Boton btncnc;
  
  PantConfig(){
    btnidi=new Boton(400,350,200,60,13);
    btnsav=new Boton(250,550,200,60,14);
    btncnc=new Boton(550,550,200,60,15);
  }
  
  void display(){
    background(color(150,150,0));
    stroke(color(255,255,255));
    textAlign(CENTER,CENTER);
    text(idi.mensaje(7),400,100);
    btnidi.display();
    btnsav.display();
    btncnc.display();
  }
  
  void mouseControl(int x,int y,int b){
    if(btnidi.isClicked(x,y,b))
      idi.setIdioma(((idi.getIdioma()==IDESP)?IDING:IDESP));
    if(btnsav.isClicked(x,y,b))
      cf.saveConfig(idi);
    if(btncnc.isClicked(x,y,b))
      gc.setPantAct(PNINT);
  }    
}
