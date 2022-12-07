//Modulo BotonUD
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 30 de noviembre de 2021
//fecha de ultima modificación: 5 de diciembre de 2021
//comentario: se implementa un botón Up-Down.
class BotonUD{
  int cx;          //posición en X del centro del botón
  int cy;          //posición en Y del centro del botón
  int an;          //anchura del botón
  int al;          //altura del botón
  int t;           //texto del botón 
  PImage btn;      //imagen de fondo del botón
  
  //constructor: los primeros dos parámetros son la posición, el segundo par sus medidas y el quinto
  //parámetro el índice del texto de idioma específico
  BotonUD(int x,int y,int b,int a,char l){
    cx=x;
    cy=y;
    an=b;
    al=a;
    t=int(l);
    btn=loadImage("sprites/btn.png");
  }
  
  //graficado del botón
  void display(){
    rectMode(CENTER);
    imageMode(CENTER);
    fill(0);
    stroke(255);
    if(cf.gmode) image(btn,cx,cy,an,al);
    //else rect(cx,cy,an,al);
    fill(255);
    textAlign(CENTER,CENTER); fill(0,0,0);
    text(char(t),cx,cy);
  }
  
  //manejador de evento, devuelve true si el clic ocurrió sobre él
  boolean isClicked(int x,int y, int b){
    boolean r=((b==LEFT || b==RIGHT) &&(((x>=cx-(an/2))&&(x<=cx+(an/2))) && ((y>=cy-(al/2))&&(y<=cy+(al/2)))));
    if(r) sfxclick.trigger();
    return r;    
  } 
  
  //determina si el mouse pasa por encima del BotonUD
  boolean isOver(int x,int y){
    boolean r=(((x>=cx-(an/2))&&(x<=cx+(an/2))) && ((y>=cy-(al/2))&&(y<=cy+(al/2))));
    return r; 
  }
  
  //devuelve el caracter actual del BotonUD
  char getChar(){
    return char(t);
  }
  
  //avanza un caracter del rango de valores, al momento solo letras mayúsculas
  void charUp(){
    t++;
    if(char(t)>'Z')
      t=int('A');
  }
  
  //retrocede un caracter del rango de valores, al momento solo letras mayúsculas
  void charDn(){
    t--;
    if(char(t)<'A')
      t=int('Z');
  }
}
