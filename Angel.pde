//Proyecto de videojuego 2022 IDGS102
//Elaborado por: Angel Palacios Mirafuentes
//26 de septiembre de 2022
//30-09-22

//global
final int PNCRG=0;
final int PNINT=1;
final int PNGME=3;
GameControl gc;


//modulos
void setup()
{
    size(800,800);
    frameRate(60);
    surface.setTitle("Creacion de Videojuegos");
    gc = new GameControl();
}


void draw()
{
  gc.display();
 
}

void mouseReleased()
{
  if(mouseButton==LEFT) gc.nextPant();
  
  if(mouseButton==RIGHT) gc.prevPant();
  
}

void keyReleased()
{
  if(keyCode==LEFT || key=='a' || key == 'A') gc.nextPant();
  
  if(keyCode==RIGHT || key=='d' || key == 'D') gc.nextPant();
  
}
