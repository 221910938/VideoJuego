//Módulo GameControl 
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 30 de septiembre de 2022
//fecha de ultima modificación: 10 de noviembre de 2022
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
  boolean musicon;
  
  GameControl(){
    pncrg=new PantCarga();
    pnint=new PantIntro();
    pngme=new PantGame();
    pncfg=new PantConfig();
    pncrd=new PantCreditos();
    pnins=new PantInstruc();
    pnscr=new PantScore();
    pantact=PNCRG;
    musicon=false;
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
      case PNGME: pngme.mouseControl(x,y,b);
    }
  }
  
  void mouseControl(int x,int y){
    switch(pantact){
      case PNINT: pnint.mouseControl(x,y);
                  break;
      case PNCFG: pncfg.mouseControl(x,y);
                  break;            
    }
  }
  
  void keyControl(char k){
    switch(pantact){
      case PNGME: pngme.keyControl(k);
    }
  }
  
  void musicManager(boolean s){
    musicon=s;
    playTrack((musicon?pantact:0));
  }
  
  void playTrack(int t){
    if(t==PNINT) mscintro.loop(); else {mscintro.pause(); mscintro.rewind();}
    if(t==PNGME) mscgame.loop();  else {mscgame.pause();  mscgame.rewind();}
  }
  
  boolean getMusicStatus(){
    return musicon;
  }
}
