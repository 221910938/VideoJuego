//Proyecto  
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 26 de septiembre de 2022
//comentario: Contiene los procesos iniciales del juego, adicionalmente envia a
//los objetos de control las operaciones de entrada/salida básica

//sección de declaraciones globales
final int PNCRG=0;
final int PNINT=1;
final int PNGME=2;
final int PNCFG=3;
final int PNCRD=4;
final int PNINS=5;
final int PNSCR=6;
final int IDESP=0;
final int IDING=1;
PFont letra;
PImage imgIcon;
GameControl gc;
Idiomas idi;
ConfigFiles cf;
Bitacora bit;

//sección de módulos principales
void setup(){
  size(800,800);
  frameRate(90);
  surface.setTitle("Creación de Videojuegos 2022");
  imgIcon=loadImage("sprites/per/movimiento/run/per0.png");
  surface.setIcon(imgIcon);
  cf=new ConfigFiles();
  bit=new Bitacora(true); //Bitacora(cf.logact)
  idi=new Idiomas(cf.lang,cf.ns);
  letra=createFont("FiraCode Nerd Font",14);
  textFont(letra);
  gc=new GameControl();
}

void draw(){
  gc.display();
}

//el contenido en esta versión de mouseReleased y KeyReleased son temporales, solo
//para ilustrar el funcionamiento básico de los métodos.
void mouseReleased(){
  gc.mouseControl(mouseX,mouseY,mouseButton);  
}

void keyReleased(){
  
}
