//Modulo Reloj
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 31 de octubre de 2021
//fecha de ultima modificación: 31 de octubre de 2021
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
      bit.agregaDatosLn("Tiempo="+mins+":"+((segs<10)?"0":"")+segs);
      tmp.activate();
    }
  }
  
  void display(int x,int y){
    textAlign(CENTER,CENTER);
    textSize(36);
    text(((mins<10)?"0":"")+mins+":"+((segs<10)?"0":"")+segs/*+"."+msgs*/,x,y);
    textSize(10);
  }
}
