//Módulo Bomba
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 24 de noviembre de 2022
//fecha de ultima modificación: 5 de diciembre de 2022
//comentario: Bomba implementa explosivos que hieren al personaje
class Bomba{
  Punto2D pos;      //coordenadas de la bomba
  Colisionador cls; //para determinar si choca con el personaje
  SpriteSet ssbmb;  //animación de la bomba
  SpriteSet ssexp;  //animación de la explosión
  Dado d;           //para generar la altura de una nueva bomba
  boolean active;   //indica si la bomba esta activa
  boolean onxpl;    //indica si la bomba está explotando
  
  //Constructor, se indican las coordenadas de ubicación
  Bomba(int x,int y){
    pos=new Punto2D(x,y);
    cls=new Colisionador(pos,cf.cclsz,new Punto2D(0,0),new Punto2D(0,0));
    ssbmb=new SpriteSet("sprites/bomb/bomb/","bomb",".png",cf.nbmr,cf.nbmf,true,0);
    ssexp=new SpriteSet("sprites/bomb/bexp/","bexp",".png",cf.nbxr,cf.nbxf,true,0);
    d=new Dado(2);
    active=true;
    onxpl=false;
  }
  
  //control de graficación
  void display(){
    imageMode(CENTER);
    ellipseMode(CENTER);
    if(active){
      if(cf.gmode)
        if(!onxpl)//graficando en caso de que haya o no explosión
          ssbmb.display(pos.getX(),pos.getY(),75,75);
        else{
          ssexp.display(pos.getX(),pos.getY(),75,75);
          if(ssexp.isEndOnTime()) toggleActive();
        }  
      else{
        fill(0);
        stroke(0);
        circle(pos.getX(),pos.getY(),37);
      }
      //solo si se desea mostrar el colisionador
      if(cf.datad) cls.drawAreaColision();
    }  
  }
  
  //control de movimiento de la bomba
  void move(){
    if(pos.getX()>-75)//el valor 75 es recomendable hacerlo configurable si
                      //el juego correrá en resoluciones distintas a 800x800
      pos.setX(pos.getX()-cf.spdcn);
    else{
      //las coordenadas 900,700 y 500 también se recomienda usar configurables
      pos.setX(900);
      pos.setY((d.tirar()==1)?500:700);
      onxpl=false;
      active=true;
      cls.activate();
    }
    cls.moverCol(pos);
  }
  
  //conmuta el estado de activo de la bomba y del colisionador.
  void toggleActive(){
    active=!active;
    cls.toggleActive();
  }
  
  //activa la bomba y el temporizador de solo una vez
  void toggleExpl(){
    onxpl=!onxpl;
    ssexp.activateOneTime();
  }
  
  //para reiniciar una boma ya que sale de la pantalla
  void resetBomb(){
    active=true;
    onxpl=false;
    cls.activate();
    pos.setX(975);
    pos.setY((d.tirar()==1)?500:700);
  }
  
  //inicia el proceso de explosión
  void explota(){
    onxpl=true;
    sfxexpl.trigger();
    ssexp.activateOneTime();
    cls.deactivate();
  }
}
