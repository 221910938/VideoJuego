//Modulo Boton
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 3 de octubre de 2021
//fecha de ultima modificación: 7 de noviembre de 2021
//comentario: la clase botón permite indicar acciones dentro del juego, se usa 
//para elegir opciones del menú principal y la mayoría de comandos del juego. 
//Por su implementación solo contiene texto en su interior y un fondo sencillo de
//color y borde.
class Boton{
  int cx;          //posición en X del centro del botón
  int cy;          //posición en Y del centro del botón
  int an;          //anchura del botón
  int al;          //altura del botón
  int t;           //texto del botón 
  PImage btn;
  
  //constructor: los primeros dos parámetros son la posición, el segundo par sus medidas y el quinto
  //parámetro el índice del texto de idioma específico
  Boton(int x,int y,int b,int a,int s){
    cx=x;
    cy=y;
    an=b;
    al=a;
    t=s;
    btn=loadImage("sprites/HUD/button.png");
  }
  
  //graficado del botón
  void display(){
    rectMode(CENTER);
    imageMode(CENTER);
    fill(0,0,0);
    stroke(255,255,255);
    if(cf.gmode) image(btn,cx,cy,an,al);
    //else rect(cx,cy,an,al);
    fill(255);
    textAlign(CENTER,CENTER);
    text(idi.mensaje(t),cx,cy);
  }
  
  void setMessage(int m){
    t=m;
  }
  
  //manejador de evento, devuelve true si el clic ocurrió sobre él
  boolean isClicked(int x,int y, int b){
    boolean r=(b==LEFT &&(((x>=cx-(an/2))&&(x<=cx+(an/2))) && ((y>=cy-(al/2))&&(y<=cy+(al/2)))));
    if(r) sfxclick.trigger();
    return r;    
  } 
  
  boolean isOver(int x,int y){
    boolean r=(((x>=cx-(an/2))&&(x<=cx+(an/2))) && ((y>=cy-(al/2))&&(y<=cy+(al/2))));
    return r; 
  }
}
