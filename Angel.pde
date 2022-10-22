//Proyecto  
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 26 de septiembre de 2022
//fecha de ultima modificación: 10 de octubre de 2022
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
GameControl gc;
Idiomas idi;
ConfigFiles cf;

//sección de módulos principales
void setup(){
  size(800,800);
  frameRate(60);
  surface.setTitle("Creación de Videojuegos 2022");
  cf=new ConfigFiles();
  idi=new Idiomas(cf.lang,cf.ns);  //temporal hasta que se implemente archivo de config.
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
