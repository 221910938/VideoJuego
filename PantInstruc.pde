//Módulo PantInstruc
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 3 de octubre de 2022
//fecha de ultima modificación: 5 de diciembre de 2022
//comentario: Implementa la clase PantInstruc, la cual se encargará de operar la 
//pantalla de instrucciones del juego.
class PantInstruc{
  Boton btnret;    //regresa a la pantalla principal
  PImage imgkey;   //imagen de una tecla normal
  PImage imgspb;   //imagen de la barra espaciadora 
  SpriteSet ssjmp; //animación de salto
  SpriteSet ssfal; //animación de caída 
  Punto2D pjmp;    //posicion de la animación de salto
  Punto2D pfal;    //posición de la animación de caída
  
  //Constructor: inicializa los elementos
  PantInstruc(){
    btnret=new Boton(400,700,250,60,15);
    imgkey=loadImage("sprites/key.png");
    imgspb=loadImage("sprites/spacebar.png");
    ssjmp=new SpriteSet("sprites/per/movement/jump/","jmp",".png",cf.nprj,cf.prfj,true,0);
    ssfal=new SpriteSet("sprites/per/movement/fall/","fall",".png",cf.nprf,cf.prff,true,0);
    pjmp=new Punto2D(250,300);
    pfal=new Punto2D(650,200);
  }
  
  //control de graficación
  void display(){
    if(cf.gmode) background(gc.imgfondo);
    else background(color(0,150,150));
    fill(255);
    textAlign(CENTER,CENTER); fill(0,0,0);
    textSize(cf.fntstd);
    text(idi.mensaje(10),400,100);
    fill(0);
    ssjmp.display(pjmp.getX(),pjmp.getY(),200,200);
    ssfal.display(pfal.getX(),pfal.getY(),200,200);
    textSize(cf.fntkey);
    //teclas de control
    displayKey(250,450,'W');
    displayKey(650,450,'S');
    displayKey(400,450,'Q');
    image(imgspb,250,560,300,100);
    //animación de movimiento de salto y caída
    pjmp.move(0,cf.jmpsp+2);
    if(pjmp.getY()<200) pjmp.setY(300);
    pfal.move(0,cf.falsp-2);
    if(pfal.getY()>300) pfal.setY(200);
    textSize(cf.fntstd);
    btnret.display();
  }
  
  //control de mouse para regresar a pantalla principal
  void mouseControl(int x,int y,int b){
    if(btnret.isClicked(x,y,b))
      gc.setPantAct(PNINT);
  }
  
  //para mostrar una tecla con la letra o número correspondiente
  void displayKey(int x,int y,char k){
    image(imgkey,x,y);
    textAlign(CENTER,BOTTOM);
    text(k,x+5,y+7);
  }
}
