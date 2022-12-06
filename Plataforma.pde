//Módulo Plataforma
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 21 de noviembre de 2022
//fecha de ultima modificación: 5 de diciembre de 2022
//comentario:
class Plataforma{
  Punto2D sze;    //medidas de la plataforma
  Punto2D pos;    //posición de la plataforma
  PImage imgplat; //sprite para la plataforma
  boolean active; //indica si la plataforma está activa
  
  //Constructor, se indican medidas y posición
  Plataforma(int x,int y,int w,int h){
    sze=new Punto2D(w,h);
    pos=new Punto2D(x,y);
    imgplat=loadImage("sprites/plat.png");
    active=true;
  }
  
  //gaficado
  void display(){
    imageMode(CENTER);
    rectMode(CENTER);
    if(active)
      if(cf.gmode)
        image(imgplat,pos.getX(),pos.getY(),sze.getX(),sze.getY());
      else{
        fill(120);
        stroke(130);
        rect(pos.getX(),pos.getY(),sze.getX(),sze.getY());
      }  
  }
  
  //indica si está activa
  boolean isActive(){
    return active;
  }
  
  //movimiento de la plataforma
  void moverPlt(){
    if(active){
      pos.setX(pos.getX()-cf.pltspd);
      if(pos.getX()<-(cf.pltwid/2))
        pos.setX(cf.pltspc);
    }  
  }
  
  //determina si el personaje está sobre la plataforma
  boolean isPerOver(Personaje p){
    boolean o=false;
    //los valores de 75 y 82 fueron obtenidos por prueba y error, es posible
    //que se puedan calcular mediante las medidas de distintos elementos
    //gráficos
    o=active &&(p.per.getX()>(pos.getX()-sze.getX()/2)
             &&(p.per.getX()<(pos.getX()+sze.getX()/2))
             &&(p.per.getY()<(pos.getY()-75))&&p.per.getY()>(pos.getY()-82));         
    return o;
  }
  
  //se obtiene 
  int getHeight(){
    return sze.getY();
  }
}
