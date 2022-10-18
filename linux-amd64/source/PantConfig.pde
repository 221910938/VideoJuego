//Módulo PantConfig
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 3 de octubre de 2022
//fecha de ultima modificación: 3 de octubre de 2022
//comentario: Implementa la clase PantConfig, la cual se encargará de operar la 
//pantalla de carga del juego.

class PantConfig{

  Boton btnIdioma;
  Boton btnGuardar;
  Boton btnCancelar;

  PantConfig()
  {
    btnIdioma = new Boton(400, 350, 200, 60, 14);
    btnGuardar = new Boton(250, 550, 200, 60, 15);
    btnCancelar = new Boton(550, 550, 200, 60, 16);
  }
  
  void display(){
    background(color(150,150,0));
    stroke(color(255,255,255));
    textAlign(CENTER,CENTER);
    text(idi.mensaje(7),400,100);

    btnIdioma.display();
    btnGuardar.display();
    btnCancelar.display();
  }

  void mouseControl(int x,int y,int b)
  {
    if (btnIdioma.isClicked(x,y,b)) idi.setIdioma(((idi.getIdioma()==IDIOMAESP)?IDIOMAENG:IDIOMAESP));
    
    if(btnGuardar.isClicked(x,y,b)) cf.saveConfig(idi);
    
    if(btnCancelar.isClicked(x,y,b)) gc.setPantAct(PNINT);
    
  }
}
