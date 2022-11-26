class Slime
{
    Punto2D slime;
    SpriteSet imagenesSlime;
    int numeroImagenSlime[];
    Colisionador colisionadorSlime;

    Slime()
    {
        slime=new Punto2D(500,700);
        imagenesSlime=new SpriteSet("sprites/enemies/slime/","slime",".png",25,1,false,0);
        numeroImagenSlime=new int[25];
        colisionadorSlime=new Colisionador(slime,70,new Punto2D(0,0),new Punto2D(250,800));
    }

    void display(){
      ellipseMode(RADIUS);
      imageMode(CENTER);
      if(cf.gmode)
      {
        moverAnimacion(imagenesSlime,125,250,500,700);
      }else{
        stroke(0,120,0);
        fill(0,200,0);
        circle(slime.getX(),slime.getY(),75);
      }
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