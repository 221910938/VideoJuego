//Proyecto  
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 26 de septiembre de 2022
//fecha de ultima modificación: 14 de noviembre de 2022
//comentario: Contiene los procesos iniciales del juego, adicionalmente envia a
//los objetos de control las operaciones de entrada/salida básica
import ddf.minim.*;
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
final int STRUN=0;
final int STJMP=1;
final int STFAL=2;
final int STHIT=3;
final int STDIE=4;
final boolean MSCON=true;
final boolean MSCOFF=false;
PFont letra;
PImage imgicon;
PImage imgcoin;
SpriteSet sspbg;
PImage back;
GameControl gc;
Idiomas idi;
ConfigFiles cf;
Bitacora bit;
Minim audio;
AudioPlayer mscintro;
AudioPlayer mscgame;
AudioSample sfxclick;

//sección de módulos principales
void setup(){
  size(800,800);
  frameRate(60);
  surface.setTitle("Creación de Videojuegos 2022");
  back=loadImage("sprites/bg/back.png");
  imgicon=loadImage("sprites/per/movement/run/per0.png");
  sspbg=new SpriteSet("sprites/per/movement/run/","per",".png",24,24,false,0);
  surface.setIcon(imgicon);
  cf=new ConfigFiles();
  bit=new Bitacora(cf.logact);
  idi=new Idiomas(cf.lang,cf.ns);
  letra=createFont("FiraCode Nerd Font",14);
  textFont(letra);
  imgcoin=loadImage("sprites/coin/coin.png");
  gc=new GameControl();
  audio=new Minim(this);
  thread("loadAudio");
}

void draw(){
  gc.display();
}

//el contenido en esta versión de mouseReleased y KeyReleased son temporales, solo
//para ilustrar el funcionamiento básico de los métodos.
void mouseReleased(){
  gc.mouseControl(mouseX,mouseY,mouseButton);  
}

void mouseMoved(){
  gc.mouseControl(mouseX,mouseY);  
}

void keyReleased(){
  gc.keyControl(key);
}


void loadAudio(){
  gc.pncrg.msg=18;  //cargando efectos de sonido
  sfxclick=audio.loadSample("sound/sfx/click.mp3");
  sfxclick.setGain(0.9);
  gc.pncrg.msg=19;  //cargando música
  mscintro=audio.loadFile("sound/music/intro.mp3");
  mscintro.setGain(0.07);
  mscgame=audio.loadFile("sound/music/play.mp3");
  mscgame.setGain(0.07);
  gc.pncrg.msg=20;  //carga terminada
  gc.pncrg.loading=false;  //cambiando pantalla
}

void music(){
  if(!gc.getMusicStatus())
    gc.musicManager(MSCON);
}
