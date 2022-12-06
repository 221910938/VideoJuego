//Módulo Colisoinador
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 18 de noviembre de 2022
//fecha de ultima modificación: 5 de diciembre de 2022
//comentario:
class Colisionador{
  Punto2D pos;    //posición en pantalla del colisionador
  Punto2D aaesi;  //area activa esquina superior izquierda
  Punto2D aaeid;  //area activa esquina inferior derecha
  int rad;        //radio para el alcance del colisionador
  boolean active; //estado funcional del colisionador
  
  //Constructor: recibe como Punto2D todos los valores numéricos de coordenadas
  Colisionador(Punto2D p,int r,Punto2D esi,Punto2D eid){
    pos=new Punto2D(p);
    rad=r;
    aaesi=new Punto2D(esi);
    aaeid=new Punto2D(eid);
    active=true;
  }
  
  //Constructor: recibe como int cada uno de los valores de coordenadas
  Colisionador(int x,int y,int r,int xi,int yi,int xd,int yd){
    pos=new Punto2D(x,y);
    aaesi=new Punto2D(xi,yi);
    aaeid=new Punto2D(xd,yd);
    rad=r;
    active=true;
  }
  
  //Asignación directa de la posicion del colisionador, con valores sueltos
  void moverCol(int x,int y){
    pos.setX(x);
    pos.setY(y);
  }
  
  //Asignación directa de la posición del colisionador, con un Punto2D
  void moverCol(Punto2D p){
    pos.setX(p.getX());
    pos.setY(p.getY());
  }
  
  //determina si hay una colisión con otro colisionador
  boolean isColision(Colisionador cls){
    boolean c=false;  //indica si ocurre, se parte del principio que no la hay
    if(active && inRange(cls)){
      //distancias por eje
      float dx=cls.pos.getX()-pos.getX();
      float dy=cls.pos.getY()-pos.getY();
      //distancia real entre este colisionador y el otro (cls)
      float ds=sqrt(dx*dx+dy*dy);
      //se determina por la suma de radios contra la distancia entre objetos
      c=(ds<(rad+cls.rad));
    }
    return c;
  }
  
  //para indicar la zona donde el colisionador puder revisar una potencial
  //colisión, no tiene caso hacerla fuera de esta zona
  boolean inRange(Colisionador c){
    boolean r=false; //igualmente se parte de la idea que no habría colisión.
    r=c.active&&(aaesi.getX()<c.pos.getX()&&aaeid.getX()>c.pos.getX())&&
                (aaesi.getY()<c.pos.getY()&&aaeid.getY()>c.pos.getY());
    return r;
  }
  
  //conmuta el estado de activo
  void toggleActive(){
    active=!active;
  }
  
  //activa el colisionador
  void activate(){
    active=true;
  }
  
  //deasctiva el colisionador
  void deactivate(){
    active=false;
  }
  
  //grafica el área de colisión, círculo rojo si está inactivo y verde en caso
  //contrario
  void drawAreaColision(){
    ellipseMode(CENTER);
    noFill();
    if(active)
      stroke(0,172,0);
    else
      stroke(172,0,0);
    circle(pos.getX(),pos.getY(),rad*2);
  }
  
  //grafica el área de rango de colisión.
  void drawRangoColision(){
    rectMode(CORNERS);
    noFill();
    stroke(0,0,170);
    rect(aaesi.getX(),aaesi.getY(),aaeid.getX(),aaeid.getY());
  }
}
