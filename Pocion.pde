//Módulo Pocion
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 14 de noviembre de 2022
//fecha de ultima modificación: 14 de noviembre de 2022
//comentario: Pocion implementa monedas, las cuales aportarán al puntaje del jugador
class Pocion{
  Punto2D pocion;
  Colisionador cls;
  boolean active;
  boolean dir;
  PImage imagePocion;
  
  Pocion(int x,int y){
    pocion=new Punto2D(x,y);
    imagePocion = loadImage("sprites/pocion/pocionImg.png");
    cls=new Colisionador(pocion,37,new Punto2D(0,0),new Punto2D(0,0));
    active=true;
    dir=true;
  }
  
  void display(){
    imageMode(CENTER);
    ellipseMode(CENTER);
    if(active)
    {
      if(cf.gmode)
        image(imagePocion,pocion.getX(),pocion.getY(),75,75);

      else{
        fill(238,169,59);
        stroke(234,152,19);
        circle(pocion.getX(),pocion.getY(),37);
      }
      cls.drawAreaColision();
    }
  }

  void toggleActive(){
    active=!active;
  }
  
  void move(){
    pocion.setX(((pocion.getX()>-75)?pocion.getX()-cf.spdcn:900));
    cls.moverCol(pocion);
  }
}
