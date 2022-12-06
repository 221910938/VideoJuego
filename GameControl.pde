//Módulo GameControl 
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 30 de septiembre de 2022
//fecha de ultima modificación: 5 de diciembre de 2022
//comentario: Implementa la clase GameControl, la cual permitirá organizar la
//operación del juego, simplificando al máximo el método draw en el proceso 
//principal
class GameControl{
  PantCarga pncrg;      //Pantalla de Carga
  PantIntro pnint;      //Pantalla de Intro o Menú Principal
  PantGame pngme;       //Pantalla de Juego 
  PantConfig pncfg;     //Pantalla de Configuración
  PantCreditos pncrd;   //Pantalla de Créditos
  PantInstruc pnins;    //Pantalla de Instrucciones
  PantScore pnscr;      //Pantalla de Mejores Puntajes
  PantPausa pnpau;      //Pantalla de Pausa
  int pantact;          //indica cuál es la pantalla activa
  int dfc;              //indica cuál es la dificultad actual de la partida
  boolean musicon;      //indica si la música está activa
  PImage imgfondo;      //imagen de fondo
  
  //Constructor: inicializa todas las pantallas y los valores por default que
  //se requieren
  GameControl(){
    pncrg=new PantCarga();
    pnint=new PantIntro();
    pngme=new PantGame();
    pncfg=new PantConfig();
    pncrd=new PantCreditos();
    pnins=new PantInstruc();
    pnscr=new PantScore();
    pnpau=new PantPausa();
    pantact=PNCRG;
    musicon=false;
    dfc=DFCNR;
    imgfondo=loadImage("sprites/back.png");
  }
  
  //controla la graficación en función de cual es la plantalla activa
  void display(){
    switch(pantact){
      case PNCRG:  pncrg.display();
                   break;
      case PNINT:  pnint.display();
                   break;
      case PNGME:  pngme.display();
                   break;
      case PNCFG:  pncfg.display();
                   break;
      case PNCRD:  pncrd.display();
                   break;
      case PNINS:  pnins.display();
                   break;
      case PNSCR:  pnscr.display();
                   break;
      case PNPAU:  pnpau.display();
                   break;             
    }
  }
  
  //permite indicar cuál será la pantalla activa
  void setPantAct(int p){
    pantact=p;
  }
  
  //Envía a la pantalla activa la información de acciones de botón del mouse
  void mouseControl(int x,int y, int b){
    switch(pantact){
      case PNCRG: break;
      case PNCRD: pncrd.mouseControl(x,y,b);
                  break;
      case PNINS: pnins.mouseControl(x,y,b);
                  break;
      case PNSCR: pnscr.mouseControl(x,y,b);
                  break;            
      case PNINT: pnint.mouseControl(x,y,b);
                  break;
      case PNCFG: pncfg.mouseControl(x,y,b);
                  break;
      case PNPAU: pnpau.mouseControl(x,y,b);
                  break;            
    }
  }
  
  //Envía a la pantalla activa la información de posición del mouse
  void mouseControl(int x,int y){
    switch(pantact){
      case PNINT: pnint.mouseControl(x,y);
                  break;
      case PNCFG: pncfg.mouseControl(x,y);
                  break;
      case PNPAU: pnpau.mouseControl(x,y);
                  break;
    }
  }
  
  //Envía a la pantalla activa los datos de entrada de teclado
  void keyControl(char k){
    switch(pantact){
      case PNGME: pngme.keyControl(k);
    }
  }
  
  //controla de forma básica la reproducción de música
  void musicManager(boolean s){
    musicon=s;
    playTrack((musicon?pantact:0));
  }
  
  //reproduce la canción indicada
  void playTrack(int t){
    //cada canción se maneja en bucle, al salir se pausa y regresa al inicio
    if(t==PNINT) mscintro.loop(); else {mscintro.pause(); mscintro.rewind();}
    if(t==PNGME) mscgame.loop();  else {mscgame.pause();  mscgame.rewind();}
  }
  
  //indica el estado de la música
  boolean getMusicStatus(){
    return musicon;
  }
  
  //establece la dificultad del juego
  void setDiff(int d){
    dfc=(d==22)?DFCEA:((d==23)?DFCNR:DFCHD);
    println(dfc);
  }
  
  //obtiene el efecto añadido/restado de daño
  int getDfcHit(){
    return (dfc==DFCEA)?cf.dfhea:(dfc==DFCNR)?0:cf.dfhhd;
  }
  
  //obtiene el efecto añadido/restado de curación
  int getDfcCur(){
    return (dfc==DFCEA)?cf.dfcea:(dfc==DFCNR)?0:cf.dfchd;
  }
}
