//Módulo TopScores 
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 28 de noviembre de 2022
//fecha de ultima modificación: 5 de diciembre de 2022
//comentario:
class TopScores{
  String file[];    //archivo de puntajes máximos
  String place[];   //lugares obtenidos
  String name[];    //nombres de jugadores
  String time[];    //tiempos obtenidos
  String score[];   //puntajes obtenidos
  int top;          //número de puntajes guardados
  Punto2D p;        //posición de la tabla
  int fy;           //espacio entre posiciones
  PImage imgbck;    //fondo para los textos
  color base;       //color inicial de animación "cromática"
  color tope;       //color final de animación "cromática"
  color act;        //color actual de animación "cromática"
  float inc;        //incremento del valor de color
  boolean dir;      //indica si se va del color inicial al final o viceversa
    
  //Constructor: inicia los elementos 
  TopScores(){
    imgbck=loadImage("sprites/bck.png");
    file=loadStrings("topscores.dat");
    p=new Punto2D(100,200);
    fy=35;
    top=cf.topsc;
    place=new String[top];
    name=new String[top+1];
    time=new String[top+1];
    score=new String[top+1];
    base=color(255,0,0);
    tope=color(0,0,255);
    inc=cf.clinc;
    dir=true;
    loadData();
  }
  
  //carga los registros de puntaje
  void loadData(){
    println(file.length);
    for(int i=0;i<top;i++){
      place[i]=split(file[i],";")[0];
      name[i]=split(file[i],";")[1];
      time[i]=split(file[i],";")[2];
      score[i]=split(file[i],";")[3];
    }
  }
  
  //Guarda los marcadores, haya o no cambios
  void saveData(){
    String newfile;
    newfile="";
    //aquí se determina si el puntaje de la partida terminada se incluye dentro
    //de los puntajes tope
    sortData();  
    //se guardan los más altos solamente
    for(int i=0;i<top;i++)
      newfile=newfile+place[i]+";"+name[i]+";"+time[i]+";"+score[i]+"|";
    file=split(newfile,'|');
    saveStrings("data/topscores.dat",file);
  }
  
  //Hace un ordenamiento de una pasada de intercambio simple
  void sortData(){
    int i=top; //se comienza como la última posición, pero fuera del tope
    //mientras vaya superando al puntaje previo o llegue al final
    while(i>0 && int(score[i])>int(score[i-1])){
      String t; //temporal para los intercambios de valores
      //intercambio de nombre
      t=name[i-1]; name[i-1]=name[i]; name[i]=t;
      //intercambio de tiempos
      t=time[i-1]; time[i-1]=time[i]; time[i]=t;
      //intercambio de puntajes
      t=score[i-1]; score[i-1]=score[i]; score[i]=t;
      i--;
    }
  }
  
  //grafica la tabla de puntajes tope
  void displayData(){
    imageMode(CENTER);
    tint(255,170);
    image(imgbck,400,400,700,500);
    noTint();
    //encabezados de la tabla
    textSize(cf.fntbig);
    text("#",p.getX(),p.getY());
    text(idi.mensaje(29),p.getX()+100,p.getY());
    text(idi.mensaje(30),p.getX()+300,p.getY());
    text(idi.mensaje(31),p.getX()+500,p.getY());
    textSize(cf.fntstd);
    fill(230);
    //contenido de la tabla
    for(int i=0;i<top;i++){
      act=lerpColor(base,tope,inc);
      inc+=(dir)?cf.clinc:-cf.clinc;
      if(inc>1.0||inc<0.0) dir=!dir;
      fill(act);
      text(place[i],p.getX(),p.getY()+50+i*fy);
      text(name[i],p.getX()+100,p.getY()+50+i*fy);
      text(time[i],p.getX()+300,p.getY()+50+i*fy);
      text(score[i],p.getX()+500,p.getY()+50+i*fy);
    }
    fill(255);
  }
  
  //permite ingresar el puntaje obtenido por la partida recién terminada
  void addScore(String sd){
    name[top]=cf.plynm;
    time[top]=split(sd,";")[0];
    score[top]=split(sd,";")[1];
  }
}
