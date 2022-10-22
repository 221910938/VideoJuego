//Módulo SpriteSet
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 30 de septiembre de 2022
//fecha de ultima modificación: 14 de octubre de 2022
//comentario: Implementa la clase PantGame, la cual controla las acciones del 
//juego.

class SpriteSet
{
    PImage sprt[];
    int times[];
    String frmt;
    String ruta;
    String nomb;
    int size;
    int fpsCount;
    int frl;
    int spr;
    boolean onAnimation;
    boolean eqtm;

    SpriteSet(String r,String n,String f,int s,int fl,boolean oa,int sp)
    {
        ruta=r;
        nomb=n;
        frmt=f;
        size=s;
        fpsCount=0;
        frl=fl;
        spr=sp;
        onAnimation=oa;
        eqtm=true;
        sprt=new PImage[size];

        for (int i = 0; i < sprt.length; ++i) {
            sprt[i]=loadImage(ruta+nomb+i+frmt);
        }
        
    }

     SpriteSet(String r,String n,String f,int s,int []fl,boolean oa,int sp)
    {
        ruta=r;
        nomb=n;
        frmt=f;
        size=s;
        fpsCount=0;
        times=fl;
        spr=sp;
        onAnimation=oa;
        eqtm=false;
        sprt=new PImage[size];

        for (int i = 0; i < sprt.length; ++i) {
            sprt[i]=loadImage(ruta+nomb+i+frmt);
        }
        
    }

    void controlAnimacion()
    {
        if (fpsCount==((!eqtm)?times[spr]:frl)) {
            if (spr<size-1) {
                spr++;
                
            }else{
            spr=0;
            fpsCount=0;
            }
        }else{
            fpsCount++;
        }
       
    }

    void setSprite(int s)
    {
        spr=s;
    }

    /*
    *Retorna el sprite actual
    * @param s indice del sprite
    */


    PImage getSprite(int s)
    {
        return sprt[s];
    }

    void display(int x,int y,int w,int h)
    {
        image(sprt[spr],x,y,w,h);
        if (onAnimation) controlAnimacion();
    }

    void flipXDisplay(int x,int y,int w,int h)
    {
        pushMatrix();
        scale(-1,1);
        image(sprt[spr],-x,y,w,h);
        popMatrix();
        if (onAnimation) controlAnimacion();
    }

    void flipYDisplay(int x,int y,int w,int h)
    {
        pushMatrix();
        scale(1,-1);
        image(sprt[spr],x,-y,w,h);
        popMatrix();
        if (onAnimation) controlAnimacion();
    }

    void flipXYDisplay(int x,int y,int w,int h)
    {
        pushMatrix();
        scale(-1,-1);
        image(sprt[spr],-x,-y,w,h);
        popMatrix();
        if (onAnimation) controlAnimacion();
    }

    void toggleAnimation()
    {
        onAnimation=!onAnimation;
    }
}