class Slime
{
    Punto2D slime;
    SpriteSet imagenesSlime;
    PImage imgSlime;
    int numeroImagenSlime[];
    Colisionador colisionadorSlime;

    Slime()
    {
        slime=new Punto2D(500,700);
        imgSlime= loadImage("sprites/enemies/slime/slime0.png");
        imagenesSlime=new SpriteSet("sprites/enemies/slime/","slime",".png",25,1,true,0);
        numeroImagenSlime=new int[25];
        colisionadorSlime=new Colisionador(slime,70,new Punto2D(0,0),new Punto2D(250,800));
    }

    void display(){
      ellipseMode(RADIUS);
      imageMode(CENTER);
      if(cf.gmode)
      {
        //image(imgSlime,slime.getX(),slime.getY(),200,350);
        imagenesSlime.display(slime.getX(),slime.getY(),100,200);
        //moverAnimacion(imagenesSlime,125,250,500,700);
      }else{
        stroke(0,120,0);
        fill(0,200,0);
        circle(slime.getX(),slime.getY(),75);
      }
    }

    void mover(){
    slime.setX(((slime.getX()>-75)?slime.getX()-cf.spdcn:900));
    colisionadorSlime.moverCol(slime);
  }

    void moverAnimacion(SpriteSet s,int sizeX,int sizeY,int x,int y){
        for(int i=0;i<s.getNumbSprites();i++){
            PImage img=s.getSprite(i);
            x=x-10;
            image(img,x,y,sizeX,sizeY);
            if (x<=-300) {
                x=900;
            }
        }
    }

}