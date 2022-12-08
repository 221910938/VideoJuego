//Módulo PantIntro 
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 30 de septiembre de 2022
//fecha de ultima modificación: 5 de diciembre de 2022
//comentario: Implementa la clase PantIntro, la cual se encargará de controlar la
//pantalla de introducción del juego.
class PantIntro{
  Boton btncfg;  //Botón para pantalla de configuración
  Boton btncrd;  //Botón para pantalla de créditos
  Boton btnscr;  //Botón para pantalla de Marcadores
  Boton btngme;  //Botón para iniciar un juego
  Boton btnins;  //Botón para las instrucciones de juego
  Boton btnext;  //Botón para salir del juego
  
  //Constructor: Solo inicializa los botones
  PantIntro(){
    btncfg=new Boton(400,200,250,60,0);
    btncrd=new Boton(400,300,250,60,1);
    btnscr=new Boton(400,400,250,60,2);
    btngme=new Boton(400,500,250,60,3);
    btnins=new Boton(400,600,250,60,4);
    btnext=new Boton(400,700,250,60,5);
  }
  
  //se grafican los botones
  void display(){
    music();
    if(cf.gmode) background(gc.imgfondo);
    else background(0,150,0);
    stroke(255);
    textAlign(CENTER,CENTER); fill(0,0,0);
    text(idi.mensaje(11),400,100);
    btncfg.display();
    btncrd.display();
    btnscr.display();
    btngme.display();
    btnins.display();
    btnext.display();
  }
  
  //control de acciones de mouse
  void mouseControl(int x, int y, int b){
    //Configuración
    if(btncfg.isClicked(x,y,b))
      gc.setPantAct(PNCFG);
    //Créditos  
    if(btncrd.isClicked(x,y,b)){
      gc.musicManager(MSCOFF);
      gc.setPantAct(PNCRD);
    }  
    //Puntajes máximos
    if(btnscr.isClicked(x,y,b))
      gc.setPantAct(PNSCR);
    //iniciar juego  
    if(btngme.isClicked(x,y,b)){
      gc.musicManager(MSCOFF);
      //gc.setPantAct(PNSELP);
      gc.setPantAct(PNHIST);
    }  
    //Instrucciones
    if(btnins.isClicked(x,y,b))
      gc.setPantAct(PNINS);
    //Salida  
    if(btnext.isClicked(x,y,b)){
      bit.cierraBitacora();
      exit();
    }  
  }
  
  //Control del cursor pasando encima de los botones
  void mouseControl(int x,int y){
    cursor((btncfg.isOver(x,y)||btncrd.isOver(x,y)||btnscr.isOver(x,y)||
            btngme.isOver(x,y)||btnins.isOver(x,y)||btnext.isOver(x,y))?HAND:ARROW); 
  }
}
