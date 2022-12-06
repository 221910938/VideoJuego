//Módulo PantGame 
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 30 de septiembre de 2022
//fecha de ultima modificación: 5 de diciembre de 2022
//comentario: Implementa la clase PantGame, la cual controla las acciones del 
//juego.
class PantGame{
  Punto2D bg[];              //posición de los fondos
  Punto2D fg[];              //posición de los objetos en primer plano
  int fbg[];                 //coordenadas de los fondos 
  int ffg[];                 //coordenadas de objetos en primer plano
  SpriteSet ssbg;            //repositorio de imágenes de fondos
  SpriteSet ssfg;            //repositorio de imágenes en primer plano
  Personaje per;             //personaje 
  ArrayList <Coin> monedas;  //grupo de monedas en juego
  Plataforma plt;            //plataforma que aparece cada cierto tiempo
  Bomba b;                   //controla la bomba que aparece
  Curador cur;               //controla el curador que aparece 
  PImage imghud;             //imagen del HUD 
  Dado dbg;                  //dado para seleccionar un nuevo fondo
  Dado dfg;                  //dado para seleccionar un nuevo elemento en primer plano
  Dado dcoin;                //dado para generar una nueva moneda
  Reloj rlj;                 //lleva el tiempo total de juego
  boolean rst;               //indica si el juego debe reiniciarse
  
  //Constructor: instancia todos los elementos y lo deja listo para iniciar
  PantGame(){
    dbg=new Dado(cf.nbg);
    bg=new Punto2D[cf.nbg];
    fbg=new int[cf.nbg];
    creaP2DArray(bg,fbg,dbg,400,400,800,0);
    dfg=new Dado(cf.nfg);
    fg=new Punto2D[cf.nfg];
    ffg=new int[cf.nfg];
    creaP2DArray(fg,ffg,dfg,100,675,200,0);
    ssbg=new SpriteSet("sprites/bg/","bg",".png",cf.nbg,6,false,0);
    ssfg=new SpriteSet("sprites/fg/","fg",".png",cf.nfg,6,false,0);
    imghud=loadImage("sprites/HUD/hud.png");
    per=new Personaje();
    monedas=new ArrayList <Coin>();
    plt=new Plataforma(1200,600,800,10);
    b=new Bomba(975,500);
    cur=new Curador(975,300);
    dcoin=new Dado(2);
    iniciaMonedas();
    rlj=new Reloj();
    rlj.iniciaReloj();
    rst=false;
  }
  
  //inicializa las primeras monedas que aparecerán
  void iniciaMonedas(){
    Coin c;
    for(int i=0;i<cf.coins;i++){
      c=new Coin(900+i*cf.cnspc,(dcoin.tirar()==1)?(cf.flmax-cf.jmpsz):cf.flmax);
      monedas.add(c);
    }
  }
  
  //controla la graficación del juego
  void display(){
    music();
    noCursor();
    //reinicia el juego cuando sea necesario
    if(rst){
      resetGame();
      rst=false;
    }
    //graficación de planos y control de progreso del juego
    planoFondo();
    planoNivel();
    planoFrente();
    planoHUD();
    gameProgress();
  }
  
  //graficación del plano de fondo
  void planoFondo(){
    rectMode(CENTER);
    imageMode(CENTER);
    stroke(0);
    fill(128,128,0);
    graficaPlano(bg,ssbg,fbg,800,800,false,false);
  }
  
  //graficación del plano de nivel, donde aparecen los objetos principales
  void planoNivel(){
    per.display();
    displayMonedas();
    plt.display();
    b.display();
    cur.display();
  }
  
  //grafica las monedas del juego
  void displayMonedas(){
    for(Coin c:monedas)
      c.display();
  }
  
  //graficación del plano de frente donde aparecen obstáculos visuales
  void planoFrente(){
    rectMode(CENTER);
    imageMode(CENTER);
    stroke(0);
    fill(200,200,0);
    graficaPlano(fg,ssfg,ffg,200,250,true,true);
  }
  
  //graficación de la barra superior con la información del juego
  void planoHUD(){
    rectMode(CENTER);
    imageMode(CENTER);
    if(cf.gmode){
      tint(255,128);
      image(imghud,400,60);
      noTint();
    }
    else{
      stroke(0);
      fill(220);
      rect(400,60,800,120);
    }  
    fill(0);
    //graficación de los datos correspondientes
    per.drawLifeBar(150,30);
    per.drawScore(400,30);
    rlj.display(650,60);
  }
  
  //control de avance del juego, a razón de un frame
  void gameProgress(){
    if(!per.isDead()){ //con el juego activo
      muevePlano(bg,fbg,dbg,cf.bgdx,cf.bgdy,cf.bgli,cf.bgld);  
      muevePlano(fg,ffg,dfg,cf.fgdx,cf.fgdy,cf.fgli,cf.fgld); 
      mueveMonedas();
      if(plt.isActive())
      plt.moverPlt();
      b.move();
      cur.move();
    }  
    per.controlMov(plt); //aun cuando el personaje muere, se debe controlar su
                         //animación y movimiento
    revisaColisiones();
    rlj.controlReloj();
  }
  
  //reserva memoria para el conjunto de coordenadas indicado
  void creaP2DArray(Punto2D p[],int f[],Dado d,int xi,int yi,int dx,int dy){
    for(int i=0;i<p.length;i++){
      p[i]=new Punto2D(xi+i*dx,yi+i*dy);  //calculamos su posición inicial
      f[i]=d.tirar()-1;                   //sorteamos la altura
    }  
  }
  
  //actualiza las coordenadas de los objetos en el plano indicado
  void muevePlano(Punto2D p[],int f[],Dado d,int dx,int dy,int li,int ld){
    for(int i=0;i<p.length;i++){
      p[i].move(dx,dy);
      if(p[i].getX()<li){
        p[i].setX(ld);
        f[i]=d.tirar()-1;
      }  
    }
  }
  
  //controla la graficación de objetos de acuerdo con el plano específico
  void graficaPlano(Punto2D p[],SpriteSet s,int f[],int x,int y,boolean t,boolean o){
    for(int i=0;i<p.length;i++)
      if(cf.gmode){
        //aplica el tinte si el set indicado debe hacerlo
        if(t && p[i].getX()<=300 && p[i].getY()>=0) tint(255,128);
        image(s.getSprite(f[i]),p[i].getX(),p[i].getY());
        if(t && p[i].getX()<=300 && p[i].getY()>=0) noTint();
      }  
      else{
        if(o)
          noFill();
        else
          fill(200,200,0);
        stroke(0);
        strokeWeight(5);
        rect(p[i].getX(),p[i].getY(),x,y); 
        strokeWeight(1);
      }  
  }
  
  //reinicia los datos principales del juego
  void resetGame(){
    rlj.resetReloj();
    rlj.iniciaReloj();
    per.resetPer();
    b.resetBomb();
    cur.resetCure();
    plt=new Plataforma(1200,600,800,10);
    monedas=new ArrayList <Coin>();
    iniciaMonedas();
  }
  
  //revisa las colisiones contra los objetos del juego
  void revisaColisiones(){
    int i=0;
    int n=0;
    boolean f=false;
    //revisión contra curador
    if(per.cls.isColision(cur.cls)){
      per.curar();
      cur.curar();
    }
    //revisión contra bombas
    if(per.cls.isColision(b.cls)){
      per.herir();
      if(per.isDead()){
        String scoredata;
        rlj.detenReloj();
        scoredata=rlj.getTime()+";"+per.getScore();
        per.setScoreData(scoredata);
      }
      b.explota();
    }
    //revisión contra monedas
    for(Coin c:monedas){
      if(per.cls.isColision(c.cls)){
        per.incrScore();
        c.cobrar();
        c.toggleActive();
        f=true;
        n=i;
      }
      i++;
    }
    if(f){ //elimina la moneda con la que hubo colisión y crea una nueva
      monedas.remove(n);
      Coin nc=new Coin(900+i*cf.cnspc,((dcoin.tirar()==1)?(cf.flmax-cf.jmpsz):cf.flmax));
      monedas.add(nc);
    }  
  }
  
  //coordina el movimiento de todas las monedas
  void mueveMonedas(){
    for(Coin c:monedas)
      c.move();
  }
  
  //procesa las entradas de teclado para controlar al personaje
  void keyControl(char k){
    if(!per.isDead() && !per.onjmp && !per.onfal)
      switch(k){
        case ' ':
        case 'w':
        case 'W': per.saltar();
                  break;
        case 's':
        case 'S': per.caer();
                  break;
        case 'Q':
        case 'q': println("Pausa");
                  gc.setPantAct(PNPAU);
                  mscgame.pause();
                  break;
      }
  }
}
