//Módulo GameControl 
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 30 de septiembre de 2022
//fecha de ultima modificación: 10 de octubre de 2022
//comentario: Implementa la clase GameControl, la cual permitirá organizar la
//operación del juego, simplificando al máximo el método draw en el proceso 
//principal
class GameControl{
  PantCarga pncrg;
  PantIntro pnint;
  PantGame pngme;
  PantConfig pncfg;
  PantCreditos pncrd;
  PantInstruc pnins;
  PantScore pnscr;
  int pantact;
  
  GameControl(){
    pncrg=new PantCarga();
    pnint=new PantIntro();
    pngme=new PantGame();
    pncfg=new PantConfig();
    pncrd=new PantCreditos();
    pnins=new PantInstruc();
    pnscr=new PantScore();
    pantact=PNCRG;
  }
  
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
    }
  }
  
  void setPantAct(int p){
    pantact=p;
  }
  
  void mouseControl(int x,int y, int b){
    switch(pantact){
      case PNINT: pnint.mouseControl(x,y,b);
                  break;
      case PNCFG: pncfg.mouseControl(x,y,b);
                  break;            
      default:    if(mouseButton==LEFT)
                    gc.nextPant();
                  if(mouseButton==RIGHT)
                    gc.prevPant();
    }
  }
  
  void keyControl(){}
  
  //esos métodos son temporales, solo para ilustrar el funcionamiento de cambio
  //de pantalla
  void nextPant(){
    pantact++;
    if(pantact>PNSCR)
      pantact=PNCRG;
  }
  
  void prevPant(){
    pantact--;
    if(pantact<PNCRG)
      pantact=PNSCR;
  }
}
