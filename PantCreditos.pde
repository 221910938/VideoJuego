//Módulo PantCreds
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 3 de octubre de 2022
//fecha de ultima modificación: 5 de diciembre de 2022
//comentario: Implementa la clase PantCreditos, la cual se encargará de operar la 
//pantalla de carga del juego.
class PantCreditos{
  Boton btnret;        //Botón para regresar a la pantalla principal
  boolean movieactive; //indica si el video de créditos esta reproduciéndose
  
  //Constructor: Crea el botón y pone el video listo para reproducir
  PantCreditos(){
    btnret=new Boton(400,710,250,60,15);
    movieactive=false;
  }
  
  //controla la reproducción del video
  void display(){
    background(0);
    stroke(255);
    textAlign(CENTER,CENTER); fill(0,0,0);
    if(!movieactive){ //inicia la reproducción
      mvcred.play();
      movieactive=true;
    }
    //cuando el video termina, lo reinicia.
    if(movieactive && mvcred.time()>=int(mvcred.duration())){
      mvcred.stop();
      mvcred.jump(0.0);
      movieactive=false;
    }
    image(mvcred,400,400);
    btnret.display();
  }
  
  //control del botón para regresar
  void mouseControl(int x,int y,int b){
    if(btnret.isClicked(x,y,b)){
      mvcred.stop();
      background(0);
      movieactive=false;
      gc.musicManager(MSCOFF);
      gc.setPantAct(PNINT);
    }  
  }  
}
