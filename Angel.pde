//Proyecto  
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 26 de septiembre de 2022
//fecha de ultima modificación: 5 de diciembre de 2022
//comentario: Contiene los procesos iniciales del juego, adicionalmente envia a
//los objetos de control las operaciones de entrada/salida básica
import ddf.minim.*;
import processing.video.*;
//sección de declaraciones globales
final int PNCRG=0;        //pantalla de carga, identificador
final int PNINT=1;        //pantalla de menu principal, identificador
final int PNGME=2;        //pantalla de juego, identificador
final int PNCFG=3;        //pantalla de configuracion, identificador
final int PNCRD=4;        //pantalla de creditos, identificador
final int PNINS=5;        //pantalla de instrucciones, identificador
final int PNSCR=6;        //pantalla de mejores puntajes, identificador
final int PNPAU=7;        //pantalla de pausa, identificador
final int IDESP=0;        //idioma español, identificador
final int IDING=1;        //idioma inglés, identificador
final int STRUN=0;        //estado de correr, identificador
final int STJMP=1;        //estado de salto, identificador
final int STFAL=2;        //estado de caida, identificador
final int STHIT=3;        //estado de golpe, identificador
final int STDIE=4;        //estado de muerte, identificador
final boolean MSCON=true;    //música encendida, identificador
final boolean MSCOFF=false;  //música apagada, identificador
final int DFCEA=0;        //dificultad fácil, identificador
final int DFCNR=1;        //dificultad normal, identificador
final int DFCHD=2;        //dificultad alta, identificador
PFont letra;              //tipografía del juego
PImage imgicon;           //imagen para el icono de la aplicación 
PImage imgcoin;           //imagen para las monedas
SpriteSet sspbg;          //fondos de pantallas del juego
GameControl gc;           //controla el graficado y progreso del juego
Idiomas idi;              //contiene los mensajes en los idiomas del juego
ConfigFiles cf;           //contiene los parámetros de configuración del juego
Bitacora bit;             //controla el registro de eventos del juego
TopScores ts;             //guarda los mejores puntajes
Minim audio;              //procesador de audio
AudioPlayer mscintro;     //cancion de intro Battletoads in Battlemaniacs 
AudioPlayer mscgame;      //canción en juego The son of Flynn
AudioSample sfxclick;     //efecto de sonido click de botones
AudioSample sfxcash;      //efecto de sonido de dinero
AudioSample sfxexpl;      //efecto de sonido de explosión
AudioSample sfxhit;       //efecto de sonido al ser herido 
AudioSample sfxdie;       //efecto de sonido al morir 
AudioSample sfxghit;      //efecto de sonido al terminar de caer
AudioSample sfxjmp;       //efecto de sonido al saltar 
AudioSample sfxcur;       //efecto de sonido de curación
Movie mvcred;             //película de los créditos

//setup controla la construcción de los recursos del juego.
void setup(){
  size(800,800);
  frameRate(60);
  surface.setTitle("UTVT Runner");
  imgicon=loadImage("sprites/per/movement/run/per0.png");
  sspbg=new SpriteSet("sprites/scrbg/","scrbg",".jpg",9,6,false,0);
  surface.setIcon(imgicon);
  cf=new ConfigFiles();
  bit=new Bitacora(cf.logact);
  idi=new Idiomas(cf.lang,cf.ns);
  ts=new TopScores();
  letra=createFont(cf.fntname,cf.fntstd); //usamos la tipografía indicada 
                                                  //en config.dat
  textFont(letra);
  imgcoin=loadImage("sprites/coin/coin.png");
  gc=new GameControl();
  audio=new Minim(this);
  thread("loadAudio");
}

//control general de graficado, se lo dejamos al GameControl
void draw(){
  gc.display();
}

//mouseReleased procesa las acciones de botones del mouse, se le pasan al 
//GameControl
void mouseReleased(){
  gc.mouseControl(mouseX,mouseY,mouseButton);  
}

//mouseMoved controla las acciones del mouse al moverse por la pantalla.
void mouseMoved(){
  gc.mouseControl(mouseX,mouseY);  
}

//keyReleased controla las acciones de teclado, para variar le pasa la chamba a
//GameControl
void keyReleased(){
  gc.keyControl(key);
}

//controla el hilo donde se cargan los recursos de audio y video
void loadAudio(){
  gc.pncrg.msg=18;  //cargando efectos de sonido
  sfxclick=audio.loadSample("sound/sfx/click.mp3");
  sfxclick.setGain(cf.sfxgn);
  sfxcash=audio.loadSample("sound/sfx/cash.mp3");
  sfxcash.setGain(cf.sfxgn);
  sfxexpl=audio.loadSample("sound/sfx/expls.mp3");
  sfxexpl.setGain(cf.sfxgn);
  sfxhit=audio.loadSample("sound/sfx/grito.mp3");
  sfxhit.setGain(cf.sfxgn);
  sfxdie=audio.loadSample("sound/sfx/death.mp3");
  sfxdie.setGain(cf.sfxgn);
  sfxghit=audio.loadSample("sound/sfx/groundhit.mp3");
  sfxghit.setGain(cf.sfxgn);
  sfxjmp=audio.loadSample("sound/sfx/jump.mp3");
  sfxjmp.setGain(cf.sfxgn);
  sfxcur=audio.loadSample("sound/sfx/heal.mp3");
  sfxcur.setGain(cf.sfxgn);
  gc.pncrg.msg=19;  //cargando música
  mscintro=audio.loadFile("sound/music/intro.mp3");
  mscintro.setGain(cf.mscgn);
  mscgame=audio.loadFile("sound/music/play.mp3");
  mscgame.setGain(cf.mscgn);
  gc.pncrg.msg=21; //cargando videos
  mvcred=new Movie(this,"video/creditos.mp4");
  gc.pncrg.msg=20;  //carga terminada
  gc.pncrg.loading=false;  //cambiando pantalla
}

//prende la música del juego
void music(){
  if(!gc.getMusicStatus())
    gc.musicManager(MSCON);
}

//obligado para mantener la lectura del video mientras se reproduce
void movieEvent(Movie m){
  m.read();
}
