//Modulo GameControl
//Elaborado por: Angel Palacios Mirafuentes
//26 de septiembre de 2022
//30-09-22
//Descripcion:Implementacion de la clase gamecontrol  la cual permite organizar la operacion del juego simplificando el maximo del metodo draw en el proceso principal

class GameControl {
 
  PantCarga pncrg;
  PantIntro pnint;
  PantGame pngame;
  int pnact;
  
  GameControl()
  {
    pncrg = new  PantCarga();
    pnint= new PantIntro();
    pngame = new PantGame();
    pnact = PNCRG;
  }
  
  void display()
  {
    switch(pnact)
    {
       case PNCRG: pncrg.display();
        break;
       
       case PNINT: pnint.display();
        break;
        
       case PNGME: pngame.display();
        break;
        
    }
  }
  
  void setPantAct(int p)
  {
   pnact=p; 
  }
  
  //metodos temporales
  
  void nextPant()
  {
    pnact++;
    if(pnact>PNGME) pnact=PNCRG;
  }
  
  void prevPant()
  {
    pnact--;
    if(pnact<PNCRG) pnact=PNGME;
  }
   
}
