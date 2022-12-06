//Módulo Curador
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 24 de noviembre de 2022
//fecha de ultima modificación: 5 de diciembre de 2022
//comentario: Curador implementa un objeto que permite recuperar salud
class Curador{
  Punto2D pos;      //posición en pantalla del curador
  Colisionador cls; //colisionador del curador 
  SpriteSet sscur;  //animación al moverse el curador
  SpriteSet ssapl;  //animación del curador en uso
  Dado d;           //para generar la posición de un nuevo curador 
  boolean active;   //estado activo del curador 
  boolean oncur;    //indica si el curador está en uso
  
  //Constructor: solo se indica dónde aparecerá
  Curador(int x,int y){
    pos=new Punto2D(x,y);
    cls=new Colisionador(pos,cf.cclsz,new Punto2D(0,0),new Punto2D(0,0));
    sscur=new SpriteSet("sprites/heal/heal/","heal",".png",cf.nhlr,cf.nhlf,true,0);
    ssapl=new SpriteSet("sprites/heal/huse/","huse",".png",cf.nhur,cf.nhuf,true,0);
    d=new Dado(2);
    active=true;
    oncur=false;
  }
  
  //controla la graficación del curador
  void display(){
    imageMode(CENTER);
    ellipseMode(CENTER);
    if(active){
      if(cf.gmode)
        if(!oncur) //igual que bomba, controla la animación que corresponda
          sscur.display(pos.getX(),pos.getY(),75,75);
        else{
          ssapl.display(pos.getX(),pos.getY(),75,75);
          if(ssapl.isEndOnTime()) toggleActive();
        }  
      else{
        fill(0,200,0);
        stroke(0,200,0);
        circle(pos.getX(),pos.getY(),37);
      }
      if(cf.datad) cls.drawAreaColision();
    }  
  }
  
  //mueve el curador y reinicia el mismo cuando sale de pantalla
  void move(){
    if(pos.getX()>-75)
      pos.setX(pos.getX()-cf.spdcn);
    else{
      pos.setX(900);
      pos.setY(300);
      oncur=false;
      active=true;
      cls.activate();
    }
    cls.moverCol(pos);
  }
  
  //conmuta el estado activo
  void toggleActive(){
    active=!active;
    cls.toggleActive();
  }
  
  //reinicia el curador
  void resetCure(){
    active=true;
    cls.activate();
    cls.activate();
    pos.setX(975);
    pos.setY(300);
  }
  
  //activa la acción de curar
  void curar(){
    oncur=true;
    sfxcur.trigger();
    ssapl.activateOneTime();
    cls.deactivate();
  }
}
