//Modulo Reloj
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 31 de octubre de 2022
//fecha de ultima modificación: 14 de noviembre de 2022
//comentario: Implementa un reloj en formato de segundos y minutos, se usará
//para llevar el tiempo de juego
class Reloj{
  Temporizador tmp;
  int mins;
  int segs;
  int msgs;
  
  Reloj(){
    tmp=new Temporizador(60);
    mins=segs=msgs=0;
  }
  
  void iniciaReloj(){
    tmp.activate();
  }
  
  void pausaReloj(){
    tmp.togglePause();
  }
  
  void detenReloj(){
    tmp.deactivate();
  }
  
  void resetReloj(){
   tmp.deactivate();
   mins=segs=msgs=0;
  }
  
  void controlReloj(){
    tmp.coolingDown();
    msgs=int(tmp.timeLeft()*1000);
    if(tmp.isOff()){
      segs++;
      if(segs==60){
        segs=0;
        mins++;
      }
      bit.agregaDatosLn("Minutos="+mins+",Segundos="+segs);
      tmp.activate();
    }
  }
  
  void display(int x,int y){
    textAlign(CENTER,CENTER);
    stroke(0);
    fill(0);
    textSize(cf.fntbig);
    text(((mins<10)?"0":"")+mins+":"+((segs<10)?"0":"")+segs/*+"."+msgs*/,x,y);
    textSize(cf.fntstd);
  }
  
  String getTime(){
    return ((mins<10)?"0":"")+mins+":"+((segs<10)?"0":"")+segs;
  }
}
