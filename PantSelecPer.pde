
class PantSelecPer{

    Boton cambiar;
    Boton btnjugar;
    PImage select;
    PImage per0;
    PImage per1;

    PantSelecPer(){
        btnjugar=new Boton(400,650,250,60,3);
        cambiar=new Boton(400,550,250,60,16);
        per0=loadImage("sprites/per/movement/run/per0.png");
        per1=loadImage("sprites/per1/movement/run/per1.png");
        select=loadImage("sprites/HUD/select.png");
    }

    void display(){
        if(cf.gmode) background(gc.imgfondo);
        else background(0,150,0);
        imageMode(CENTER);

        image(per0,300,300,250,250);
        image(per1,500,300,250,250);

        displaySelect();

        btnjugar.display();
        cambiar.display();
    }

    void displaySelect(){
        imageMode(CENTER);
        if (cf.per) {
            image(select,280,100);
        }else{
            image(select,520,100);
        }  
    }

    void mouseControl(int x, int y, int b){
        if(btnjugar.isClicked(x,y,b))
        {
          gc.setPantAct(PNGME);
        }
        if(cambiar.isClicked(x,y,b))
        {
          cf.per=!cf.per;
          println(cf.per);
        }
    }
}