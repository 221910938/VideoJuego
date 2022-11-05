//Módulo Bitacora 
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 30 de septiembre de 2022
//fecha de ultima modificación: 31 de octubre de 2022
//comentario: Implementa la clase PantGame, la cual controla las acciones del 
//juego.
class Bitacora
{
    PrintWriter output;
    boolean active;

    Bitacora (boolean a)
    {
        active=a;
        if(active)
        {
            String s = "data/testing/test ";
            s=s+agregaFechaHoraSimple();
            s=s+".log";
            output=createWriter(s);
        }
    }

    String agregaFechaHoraSimple()
    {
        return ""+month()+"-"+day()+"-"+year()+" "+hour()+"-"+minute();
    }

    String agregaFechaHora()
    {
        return ""+month()+"-"+day()+"-"+year()+" a las "+hour()+" horas con "+minute()+" segundos";
    }

    void agregaDatosLn(String s)
    {
        if (active) {
            output.println(s);
            output.flush();
        }
    }

    void agregaDatos(String s)
    {
        if (active) {
            output.print(s);
            output.flush();
        }
    }

    void toggleActive()
    {
        active=!active;
    }

    void cierraBitacora()
    {
        if (active) {
            String s ="fin de prueba "+agregaFechaHora();
            output.println(s);
            output.flush();
            output.close();        
        }
    }
}