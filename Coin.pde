//Módulo Coin
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 14 de noviembre de 2022
//fecha de ultima modificación: 5 de diciembre de 2022
//comentario: Coin implementa monedas, las cuales aportarán al puntaje del jugador
class Coin{
  Punto2D pos;      //posición en pantalla de la moneda
  Colisionador cls; //colisionador de la moneda
  Dado d;           //permite generar aleatoriamente la nueva posición de la moneda
  boolean active;   //indica si la moneda está activa
  boolean oncash;   //indica si la moneda está siendo cobrada
  
  //Constructor: simplemente recibe la coordenada desde la cual comenzará a moverse
  Coin(int x,int y){
    pos=new Punto2D(x,y);
    cls=new Colisionador(pos,cf.cclsz,new Punto2D(0,0),new Punto2D(0,0));
    d=new Dado(2);
    active=true;
    oncash=false;
  }
  
  //controla la graficación de la moneda
  void display(){
    imageMode(CENTER);
    ellipseMode(CENTER);
    if(active){
      if(cf.gmode)
        if(!oncash)
          image(imgcoin,pos.getX(),pos.getY(),75,75);
      else{
        fill(238,169,59);
        stroke(234,152,19);
        circle(pos.getX(),pos.getY(),37);  
      }
      if(cf.datad) cls.drawAreaColision();
    }  
  }
  
  //movimiento de la moneda, es en esencia lo mismo que para bomba
  void move(){
    if(pos.getX()>-75)
      pos.setX(pos.getX()-cf.spdcn);
    else{
      pos.setX(900);
      pos.setY((d.tirar()==1)?500:700);
      oncash=false;
      active=true;
      cls.activate();
    }
    cls.moverCol(pos);
  }
  
  //cambio de estado de la moneda, mismo caso con su colisionador
  void toggleActive(){
    active=!active;
    cls.toggleActive();
  }
  
  //acción de la moneda para aportar puntaje al jugador
  void cobrar(){
    oncash=true;
    sfxcash.trigger();
    cls.deactivate();
  }
}
