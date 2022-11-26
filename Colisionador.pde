//Módulo Colisionador
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 14 de noviembre de 2022
//fecha de ultima modificación: 14 de noviembre de 2022
//comentario: Colisionardor

class Colisionador
{
    Punto2D pos;
    Punto2D aaesi;
    Punto2D aaeid;
    int rad;
    boolean active;

    Colisionador(Punto2D p, int r,Punto2D esi,Punto2D eid)
    {
        pos= new Punto2D(p);
        rad=r;
        aaesi= new Punto2D(esi);
        aaeid= new Punto2D(eid);
        active=true;
    }

    Colisionador(int x,int y,int r, int xi,int yi,int xd,int yd)
    {
        pos= new Punto2D(x,y);
        rad=r;
        aaesi= new Punto2D(xi,yi);
        aaeid= new Punto2D(xd,yd);
        active=true;
    }

    void moverCol(int x,int y)
    {
        pos.setX(x);
        pos.setY(y);
    }

    void moverCol(Punto2D p)
    {
        pos.setX(p.getX());
        pos.setY(p.getY());
    }

    boolean isColision(Colisionador cls)
    {
        boolean c = false;
        if (active && inRange(cls))
        {
            float dx=cls.pos.getX()-pos.getX();
            float dy=cls.pos.getY()-pos.getY();
            float ds=sqrt(dx*dx+dy*dy);
            c=ds<(rad+cls.rad);
        }
        return c;
    }

    boolean inRange(Colisionador c)
    {
        boolean r=false;
        r=c.active && (aaesi.getX()<c.pos.getX() && c.pos.getX()<aaeid.getX()) 
                   && (aaesi.getY()<c.pos.getY() && c.pos.getY()<aaeid.getY());
        return r;
    }

    void toggleActive()
    {
        active=!active;
    }

    void activate()
    {
        active=true;
    }

    void deactivate()
    {
        active=false;
    }

    void drawAreaColision()
    {
        ellipseMode(CENTER);
        noFill();
        stroke(255,0,0);
        circle(pos.getX(),pos.getY(),rad*2);
    }

    void drawRangoColision()
    {
        rectMode(CORNERS);
        noFill();
        stroke(0,255,0);
        rect(aaesi.getX(),aaesi.getY(),aaeid.getX(),aaeid.getY());
    }
}