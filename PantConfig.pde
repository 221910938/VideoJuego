//Módulo PantConfig
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 3 de octubre de 2022
//fecha de ultima modificación: 5 de diciembre de 2022
//comentario: Implementa la clase PantConfig, la cual se encargará de operar la 
//pantalla de carga del juego.
class PantConfig{
  Boton btnidi;    //Botón para elegir idioma
  Boton btngmd;    //Botón para elegir el modo gráfico
  Boton btnsav;    //Botón para guardar la configuración
  Boton btncnc;    //Botón para cerrar la configuración, pero sin guardarla
  Boton btndif;    //Botón para elegir la dificultad
  BotonUD budl1;   //Botón para la primer letra del nombre 
  BotonUD budl2;   //Botón para la segunda letra del nombre
  BotonUD budl3;   //Botón para la tercer letra del nombre
  
  //Construcr: simplemente inicializa los componentes
  PantConfig(){
    btnidi=new Boton(550,350,250,60,13);
    btnsav=new Boton(250,650,250,60,14);
    btncnc=new Boton(550,650,250,60,15);
    //elige el texto del modo gráfico de acuerdo con el guardado
    btngmd=new Boton(550,450,250,60,(cf.gmode)?16:17);
    btndif=new Boton(550,550,250,60,23);
    //carga las letras de los botones para el nombre
    budl1=new BotonUD(500,250,50,60,cf.plynm.charAt(0));
    budl2=new BotonUD(550,250,50,60,cf.plynm.charAt(1));
    budl3=new BotonUD(600,250,50,60,cf.plynm.charAt(2));
  }
  
  //grafica los componentes dependiento su estado
  void display(){
    if(cf.gmode) background(gc.imgfondo);
    else background(150,150,0);
    stroke(255);
    textAlign(CENTER,CENTER); fill(0,0,0);
    text(idi.mensaje(7),400,100);
    textAlign(LEFT,CENTER);
    text(idi.mensaje(25),125,350);
    text(idi.mensaje(26),125,450);
    text(idi.mensaje(27),125,550);
    text(idi.mensaje(28),125,250);
    textAlign(CENTER,CENTER); fill(0,0,0);
    btnidi.display();
    btngmd.display();
    btnsav.display();
    btncnc.display();
    btndif.display();
    budl1.display();
    budl2.display();
    budl3.display();
  }
  
  //controla los clics del mouse
  void mouseControl(int x,int y,int b){
    //idioma
    if(btnidi.isClicked(x,y,b))
      idi.setIdioma(((idi.getIdioma()==IDESP)?IDING:IDESP));
    //modo gráfico del juego  
    if(btngmd.isClicked(x,y,b)){
      cf.gmode=!cf.gmode;
      btngmd.setMessage(((cf.gmode)?16:17));
    }  
    //guarda el estado de la configuración
    if(btnsav.isClicked(x,y,b))
      cf.saveConfig(idi);
    //regresa a la pantalla principal  
    if(btncnc.isClicked(x,y,b)){
      cursor(ARROW);
      gc.setPantAct(PNINT);
    } 
    //ajusta la dificultad
    if(btndif.isClicked(x,y,b)){
      btndif.setMessage(((btndif.getMsg()==22)?23:((btndif.getMsg()==23)?24:22)));
      gc.setDiff(btndif.getMsg());
    }
    //ajusta el nombre del jugador, cada caso por separado
    if(budl1.isClicked(x,y,b)){
      if(b==LEFT) budl1.charUp();
      else budl1.charDn();
      cf.plynm=""+budl1.getChar()+budl2.getChar()+budl3.getChar();
    }  
    if(budl2.isClicked(x,y,b)){
      if(b==LEFT) budl2.charUp();
      else budl2.charDn();
      cf.plynm=""+budl1.getChar()+budl2.getChar()+budl3.getChar();
    }  
    if(budl3.isClicked(x,y,b)){
      if(b==LEFT) budl3.charUp();
      else budl3.charDn();
      cf.plynm=""+budl1.getChar()+budl2.getChar()+budl3.getChar();
    }  
  }    
  
  //controla el cursor del mouse dependiendo si está sobre un botón o no
  void mouseControl(int x,int y){
    cursor((btnidi.isOver(x,y)||btngmd.isOver(x,y)||btnsav.isOver(x,y)||
            btncnc.isOver(x,y)||budl1.isOver(x,y)||budl2.isOver(x,y)||
            budl3.isOver(x,y))?HAND:ARROW);
  }
}
