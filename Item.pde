class Item
{
    Punto2D item;
    PImage imgItem;
    Colisionador colisionadorItem;
    int altura;
    int ancho;

    Item(String img,int x,int y,int w,int h)
    {
      altura=h;
      ancho=w;
        item=new Punto2D(x,y);
        imgItem= loadImage("sprites/fg/"+img);
        colisionadorItem=new Colisionador(item,70,new Punto2D(0,0),new Punto2D(250,800));
    }

    void display(){
      ellipseMode(RADIUS);
      imageMode(CENTER);
      if(cf.gmode)
      {
        image(imgItem,item.getX(),item.getY(),altura,ancho);
      }else{
        stroke(0,120,0);
        fill(0,200,0);
        circle(item.getX(),item.getY(),75);
      }
    }

    void mover(){
      item.setX(((item.getX()>-75)?item.getX()-cf.spdcn:900));
      colisionadorItem.moverCol(item);
    }

}