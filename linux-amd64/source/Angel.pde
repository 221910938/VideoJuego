//Proyecto de videojuego 2022 IDGS102
//Elaborado por: Angel Palacios Mirafuentes
//26 de septiembre de 2022

//sección de declaraciones globales
final int PNCRG=0;
final int PNINT=1;
final int PNGME=2;
final int PNCFG=3;
final int PNCRD=4;
final int PNINS=5;
final int PNSCR=6;
final int IDIOMAESP=0;
final int IDIOMAENG=1;

GameControl gc;
Idiomas idi;
ConfigFile cf;

//sección de módulos principales
void setup(){
  size(800,800);
  frameRate(120);
  surface.setTitle("Creación de Videojuegos 2022");
  cf=new ConfigFile();
  idi=new Idiomas(cf.lang,cf.ns);
  gc=new GameControl();
}

void draw(){
  gc.display();
}

void mouseReleased(){
  gc.mouseControl(mouseX,mouseY,mouseButton);  
}

void keyReleased(){
  gc.keyControl();  
}
