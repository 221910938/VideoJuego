class Slime
{
    Punto2D slime;
    SpriteSet imagenesSlime;
    PImage imgSlime;
    int numeroImagenSlime[];
    Colisionador colisionadorSlime;
    boolean active;

    Slime(int x,int y)
    {
      active=true;
      slime=new Punto2D(x,y);
      imgSlime= loadImage("sprites/enemies/slime/slime0.png");
      imagenesSlime=new SpriteSet("sprites/enemies/slime/","slime",".png",25,1,true,0);
      numeroImagenSlime=new int[25];
      colisionadorSlime=new Colisionador(slime,50,new Punto2D(0,0),new Punto2D(0,0));
    }

    void resetBomb(){
    active=true;
    colisionadorSlime.activate();
    slime.setX(975);
    slime.setY(700);
  }

    void display(){
      ellipseMode(RADIUS);
      imageMode(CENTER);
      if (active) {
        if(cf.gmode)
        {
          imagenesSlime.display(slime.getX(),slime.getY(),100,200);
        }else{
          stroke(0,120,0);
          fill(0,200,0);
          circle(slime.getX(),slime.getY(),75);
        }
      colisionadorSlime.drawAreaColision();
      }
    }

     void toggleActive(){
    active=!active;
  }
  

  void mover(){
    slime.setX(((slime.getX()>-75)?slime.getX()-cf.spdcn:900));
    colisionadorSlime.moverCol(slime);
  }

}