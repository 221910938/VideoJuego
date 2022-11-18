//Módulo PantConfig
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 3 de octubre de 2022
//fecha de ultima modificación: 7 de noviembre de 2022
//comentario: Implementa la clase PantConfig, la cual se encargará de operar la 
//pantalla de carga del juego.
class PantConfig{
  Boton btnidi;
  Boton btngmd;
  Boton btnsav;
  Boton btncnc;
  
  PantConfig(){
    btnidi=new Boton(400,350,250,60,13);
    btnsav=new Boton(250,550,250,60,14);
    btncnc=new Boton(550,550,250,60,15);
    btngmd=new Boton(400,450,250,60,(cf.gmode)?16:17);
  }
  
  void display(){
    if(cf.gmode) background(back);
    else background(color(150,150,0));
    stroke(color(255,255,255));
    textAlign(CENTER,CENTER);
    text(idi.mensaje(7),400,100);
    btnidi.display();
    btngmd.display();
    btnsav.display();
    btncnc.display();
  }
  
  void mouseControl(int x,int y,int b){
    if(btnidi.isClicked(x,y,b))
      idi.setIdioma(((idi.getIdioma()==IDESP)?IDING:IDESP));
    if(btngmd.isClicked(x,y,b)){
      cf.gmode=!cf.gmode;
      btngmd.setMessage(((cf.gmode)?16:17));
    }  
    if(btnsav.isClicked(x,y,b))
      cf.saveConfig(idi);
    if(btncnc.isClicked(x,y,b))
      gc.setPantAct(PNINT);
  }    
  
  void mouseControl(int x,int y){
    if(btnidi.isOver(x,y)) cursor(HAND); else 
    if(btngmd.isOver(x,y)) cursor(HAND); else 
    if(btnsav.isOver(x,y)) cursor(HAND); else 
    if(btncnc.isOver(x,y)) cursor(HAND); else cursor(ARROW);
  }
}
