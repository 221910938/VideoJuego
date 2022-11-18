//Módulo Coin
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 14 de noviembre de 2022
//fecha de ultima modificación: 14 de noviembre de 2022
//comentario: Coin implementa monedas, las cuales aportarán al puntaje del jugador
class Coin{
  Punto2D pos;
  Colisionador cls;
  boolean active;
  boolean dir;
  
  Coin(int x,int y){
    pos=new Punto2D(x,y);
    cls=new Colisionador(pos,37,new Punto2D(0,0),new Punto2D(0,0));
    active=true;
    dir=true;
  }
  
  void display(){
    imageMode(CENTER);
    ellipseMode(CENTER);
    if(active)
    {
      if(cf.gmode)
        image(imgcoin,pos.getX(),pos.getY(),75,75);

      else{
        fill(238,169,59);
        stroke(234,152,19);
        circle(pos.getX(),pos.getY(),37);
      }
      cls.drawAreaColision();
    }
  }

  void toggleActive(){
    active=!active;
  }
  
  void move(){
    pos.setX(((pos.getX()>-75)?pos.getX()-cf.spdcn:900));
    cls.moverCol(pos);
  }
}
