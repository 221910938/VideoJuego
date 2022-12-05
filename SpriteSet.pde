//Modulo SpriteSet
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 20 de octubre de 2022
//fecha de ultima modificación: 24 de noviembre de 2022
//comentario: Controla un grupo de imágenes (sprites), puede crear una animación secuencial con dichas imágenes o funcionar
//como un repositorio de imágenes para facilitar su uso.
class SpriteSet{
  PImage sprt[];  //contiene los sprites a usar
  int times[];    //indica los tiempos de duración de cada sprite, cuando cada uno puede tener una duración distinta
  String frmt;    //formato de las imágenes
  String ruta;    //ruta para las imágenes
  String nomb;    //nombre base de las imágenes
  int size;       //número de sprites
  int frc;        //contador de frames para la animación
  int frl;        //tiempo de duración de cada sprite, cuando es el mismo para todos
  int spr;        //indica cuál es el sprite "activo" 
  boolean onan;   //indica si la animación está activa
  boolean eqtm;   //indica si el SpriteSet tiene un solo tiempo o múltiple
  boolean onet;   //indica si la animación está activa solo una vez
  boolean endot;  //indica cuando la animación de una sola vez termina.
  
  //constructor para SpriteSets con tiempo único para todos los sprites.
  //NOTA: una vez establecido, no es prudente cambiar esto
  SpriteSet(String r,String n,String f,int s,int fl,boolean oa, int sp){
    ruta=r;
    nomb=n;
    frmt=f;
    size=s;
    frc=0;
    frl=fl;
    spr=sp;
    onan=oa;
    eqtm=true;
    sprt=new PImage[size];
    for(int i=0;i<size;i++)
      sprt[i]=loadImage(ruta+nomb+i+frmt);
  }
  
  //constructor para SpriteSets con tiempo individual por sprite.
  //NOTA: una vez establecido, no es prudente cambiar esto
  SpriteSet(String r,String n,String f,int s,int []fl,boolean oa, int sp){
    ruta=r;
    nomb=n;
    frmt=f;
    size=s;
    frc=0;
    times=fl;
    spr=sp;
    onan=oa;
    eqtm=false;
    sprt=new PImage[size];
    for(int i=0;i<size;i++)
      sprt[i]=loadImage(ruta+nomb+i+frmt);
  }
  
  //cuenta los frames y actualiza el sprite al momento de ser necesario
  void controlAnimacion(){
    if(frc==(!eqtm?times[spr]:frl)){
      if(spr<size-1)
        spr++;
      else{
        spr=0;
        if(onet)
          endot=true;
      }  
      frc=0;
    }
    else
      frc++;
  }
  
  //cambia el sprite activo de forma directa
  void setSprite(int s){
    spr=s;
  }
  
  //devuelve el sprite activo
  PImage getSprite(int s){
    return sprt[s];
  }
  
  //grafica el sprite activo y controla la animación
  void display(int x,int y,int w,int h){
    image(sprt[spr],x,y,w,h);
    if(onan)
      controlAnimacion();
  }
  
  //grafica el sprite activo invertido en el eje X
  void flipXDisplay(int x,int y,int w,int h){
    pushMatrix();
    scale(-1,1);
    image(sprt[spr],-x,y,w,h);
    popMatrix();
    if(onan)
      controlAnimacion();
  }
  
  //grafica el sprite activo invertido en el eje Y
  void flipYDisplay(int x,int y,int w,int h){
    pushMatrix();
    scale(1,-1);
    image(sprt[spr],x,-y,w,h);
    popMatrix();
    if(onan)
      controlAnimacion();
  }
  
  //grafica el sprite activo invertido en los dos ejes
  void flipXYDisplay(int x,int y,int w,int h){
    pushMatrix();
    scale(-1,-1);
    image(sprt[spr],-x,-y,w,h);
    popMatrix();
    if(onan)
      controlAnimacion();
  }
  
  //conmuta la animación entre activa/inactiva
  void toggleAnimacion(){
    onan=!onan;
  }
  
  void activateOneTime(){
    onet=true;
    endot=false;
  }
  
  boolean isEndOnTime(){
    return endot;
  }
}
