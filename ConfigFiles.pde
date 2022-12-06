//Módulo ConfigFiles 
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 10 de octubre de 2022
//fecha de ultima modificación: 5 de diciembre de 2022
//comentario: Define la clase ConfigFiles, la cual permite configurar ciertas
//características del juego para que sean cargadas durante el arranque
class ConfigFiles{
  String file[];
  String save;
  //parámetros a guardar
  int lang;       //idioma activo
  int ns;         //número de mensajes de idiomas
  int bgdx;       //velocidad horizontal del fondo
  int bgdy;       //velocidad vertical del fondo
  int fgdx;       //velocidad horizontal del frente
  int fgdy;       //velocidad vertical del frente
  int prdxu;      //velocidad horizontal de ascenso del personaje
  int prdyu;      //velocidad vertical de ascenso del personaje
  int prdxd;      //velocidad horizontal de descenso del personaje
  int prdyd;      //velocidad vertical de descenso del personaje
  int nbg;        //número de imágenes de fondo distintas
  int nfg;        //número de imágenes de frente distintas
  int bgli;       //limite izquierdo para el fondo
  int bgld;       //limite derecho para el fondo
  int fgli;       //limite izquierdo para el frente
  int fgld;       //limite derecho para el frente
  int nprc;       //numero de sprites del personaje, correr
  int prfc;       //numero de frames que dura un sprite para correr
  int nprj;       //numero de sprites del personaje, salto
  int prfj;       //numero de frames que dura un sprite para salto
  int nprf;       //numero de sprites del personaje, caida
  int prff;       //numero de frames que dura un sprite para caida
  int nprh;       //numero de sprites del personaje, golpe
  int prfh;       //numero de frames que dura un sprite para golpe
  int nprd;       //numero de sprites del personaje, muerte
  int prfd;       //numero de frames que dura un sprite para muerte
  int fntstd;     //tamaño estándar de texto
  int fntbig;     //tamaño de texto grande
  int fntkey;     //tamaño de texto teclado
  String fntname; //nombre de la tipografía a usar
  boolean logact; //estado de la bitácora
  boolean gmode;  //modo gráfico: true=sprites false=figuras
  int hpmax;      //puntos máximos de vida del personaje
  int hphit;      //daño recibido por golpe al personaje
  int hprcv;      //salud recuperada por item curativo
  int spdcn;      //velocidad horizontal de las monedas
  int coins;      //numero de monedas simultaneas
  int cnspc;      //espacio entre monedas
  int cnscr;      //puntaje dado por moneda
  int pclsz;      //tamaño del colisionador del personaje
  int cclsz;      //tamaño del colisionador de moneda
  int flmax;      //coordenada máxima de caida
  int jmpsz;      //altura de salto
  int jmpsp;      //velocidad de salto
  int falsp;      //velocidad de caida
  boolean datad;  //activa o desactiva visibilidad de cajas de colision
  int pltspc;     //espacio horizontal entre plataformas
  int pltspd;     //velocidad de plataforma
  int pltwid;     //anchura de plataforma
  int nbmr;       //numero de sprites de bomba
  int nbmf;       //duración de sprites de bomba
  int nbxr;       //numero de sprites de explosion
  int nbxf;       //duración de sprites de explosion
  int nhlr;       //numero de sprites de curación
  int nhlf;       //duración de sprites de curacion
  int nhur;       //numero de sprites de uso de curacion
  int nhuf;       //duración de sprites de uso de curacion
  int cnfr;       //numero de sprites de cash
  int cndr;       //duración de sprites de cash
  String plynm;   //nombre del jugador
  int dfcea;      //factor de dificultad fácil curar
  int dfchd;      //factor de dicifulad difícil curar
  int dfhea;      //factor de dificultad fácil golpe
  int dfhhd;      //factor de dicifulad difícil golpe
  float clinc;    //cambio de color en topscores
  int topsc;      //número de puntajes tope
  float sfxgn;    //volumen de efectos de sonido
  float mscgn;    //volumen de música
  
  //Constructor: Abre el archivo y carga los datos en las variables correspondientes
  ConfigFiles(){
    file=loadStrings("config.dat");
    loadConfig();
  }
  
  //Carga los datos
  void loadConfig(){
    int i; //recorre el archivo dividido en cadenas, un parámetro por renglón.
    for(i=0;i<file.length;i++){
      if(isData("language",i)) lang=loadData(i);
      if(isData("langstr",i))  ns=loadData(i);
      if(isData("bgdx",i))     bgdx=loadData(i);
      if(isData("bgdy",i))     bgdy=loadData(i);
      if(isData("fgdx",i))     fgdx=loadData(i);
      if(isData("fgdy",i))     fgdy=loadData(i);
      if(isData("prdxu",i))    prdxu=loadData(i);
      if(isData("prdyu",i))    prdyu=loadData(i);
      if(isData("prdxd",i))    prdxd=loadData(i);
      if(isData("prdyd",i))    prdyd=loadData(i);
      if(isData("gmode",i))    gmode=loadBoolData(i);
      if(isData("nbg",i))      nbg=loadData(i);
      if(isData("nfg",i))      nfg=loadData(i);
      if(isData("bgli",i))     bgli=loadData(i);
      if(isData("bgld",i))     bgld=loadData(i);
      if(isData("fgli",i))     fgli=loadData(i);
      if(isData("fgld",i))     fgld=loadData(i);
      if(isData("nprc",i))     nprc=loadData(i);
      if(isData("prfc",i))     prfc=loadData(i);
      if(isData("nprj",i))     nprj=loadData(i);
      if(isData("prfj",i))     prfj=loadData(i);
      if(isData("nprf",i))     nprf=loadData(i);
      if(isData("prff",i))     prff=loadData(i);
      if(isData("nprh",i))     nprh=loadData(i);
      if(isData("prfh",i))     prfh=loadData(i);
      if(isData("nprd",i))     nprd=loadData(i);
      if(isData("prfd",i))     prfd=loadData(i);
      if(isData("fntstd",i))   fntstd=loadData(i);
      if(isData("fntbig",i))   fntbig=loadData(i);
      if(isData("fntkey",i))   fntkey=loadData(i);
      if(isData("fntname",i))  fntname=loadStrData(i);
      if(isData("logact",i))   logact=loadBoolData(i);
      if(isData("hpmax",i))    hpmax=loadData(i);
      if(isData("hphit",i))    hphit=loadData(i);
      if(isData("hprcv",i))    hprcv=loadData(i);
      if(isData("spdcn",i))    spdcn=loadData(i);
      if(isData("coins",i))    coins=loadData(i);
      if(isData("cnspc",i))    cnspc=loadData(i);
      if(isData("cnscr",i))    cnscr=loadData(i);
      if(isData("pclsz",i))    pclsz=loadData(i);
      if(isData("cclsz",i))    cclsz=loadData(i);
      if(isData("flmax",i))    flmax=loadData(i);
      if(isData("jmpsz",i))    jmpsz=loadData(i);
      if(isData("falsp",i))    falsp=loadData(i);
      if(isData("jmpsp",i))    jmpsp=loadData(i);
      if(isData("datad",i))    datad=loadBoolData(i);
      if(isData("pltspc",i))   pltspc=loadData(i);
      if(isData("pltspd",i))   pltspd=loadData(i);
      if(isData("pltwid",i))   pltwid=loadData(i);
      if(isData("nbmr",i))     nbmr=loadData(i);
      if(isData("nbmf",i))     nbmf=loadData(i);
      if(isData("nbxr",i))     nbxr=loadData(i);
      if(isData("nbxf",i))     nbxf=loadData(i);
      if(isData("nhlr",i))     nhlr=loadData(i);
      if(isData("nhlf",i))     nhlf=loadData(i);
      if(isData("nhur",i))     nhur=loadData(i);
      if(isData("nhuf",i))     nhuf=loadData(i);
      if(isData("cnfr",i))     cnfr=loadData(i);
      if(isData("cndr",i))     cndr=loadData(i);
      if(isData("plynm",i))    plynm=loadStrData(i);
      if(isData("dfcea",i))    dfcea=loadData(i);
      if(isData("dfchd",i))    dfchd=loadData(i);
      if(isData("dfhea",i))    dfhea=loadData(i);
      if(isData("dfhhd",i))    dfhhd=loadData(i);
      if(isData("clinc",i))    clinc=loadFloatData(i);
      if(isData("topsc",i))    topsc=loadData(i);
      if(isData("sfxgn",i))    sfxgn=loadFloatData(i);
      if(isData("mscgn",i))    mscgn=loadFloatData(i);
    }
  }
  
  //determina si el dato buscado es el que se requiere
  boolean isData(String s, int d){
    return split(file[d],'=')[0].equals("#"+s);
  }
  
  //carga un dato entero desde el renglón indicado
  int loadData(int d){
    return int(split(file[d],'=')[1]);
  }
  
  //carga un dato booleano desde el renglón indicado
  boolean loadBoolData(int d){
    return split(file[d],'=')[1].equals("ON");
  }
  
  //carga un dato cadena desde el renglón indicado
  String loadStrData(int d){
    return split(file[d],'=')[1];
  }
  
  //carga un dato flotante desde el esnglón indicado
  float loadFloatData(int d){
    return float(split(file[d],'=')[1]);
  }
  
  //guarda los valores actuales de los parámetros en el archivo de configuración
  void saveConfig(Idiomas i){
    lang=i.getIdioma();
    save="";
    addSave("language",lang);
    addSave("langstr",ns);
    addSave("bgdx",bgdx);
    addSave("bgdy",bgdy);
    addSave("fgdx",fgdx);
    addSave("fgdy",fgdy);
    addSave("prdxu",prdxu);
    addSave("prdyu",prdyu);
    addSave("prdxd",prdxd);
    addSave("prdyd",prdyd);
    addSave("gmode",gmode);
    addSave("nbg",nbg);
    addSave("nfg",nfg);
    addSave("bgli",bgli);
    addSave("bgld",bgld);
    addSave("fgli",fgli);
    addSave("fgld",fgld);
    addSave("nprc",nprc);
    addSave("prfc",prfc);
    addSave("nprj",nprj);
    addSave("prfj",prfj);
    addSave("nprf",nprf);
    addSave("prff",prff);
    addSave("nprh",nprh);
    addSave("prfh",prfh);
    addSave("nprd",nprd);
    addSave("prfd",prfd);
    addSave("fntname",fntname);
    addSave("fntstd",fntstd);
    addSave("fntbig",fntbig);
    addSave("fntkey",fntkey);
    addSave("logact",logact);
    addSave("hpmax",hpmax);
    addSave("hphit",hphit);
    addSave("hprcv",hprcv);
    addSave("spdcn",spdcn);
    addSave("coins",coins);
    addSave("cnspc",cnspc);
    addSave("cnscr",cnscr);
    addSave("pclsz",pclsz);
    addSave("cclsz",cclsz);
    addSave("flmax",flmax);
    addSave("jmpsz",jmpsz);
    addSave("falsp",falsp);
    addSave("jmpsp",jmpsp);
    addSave("datad",datad);
    addSave("pltspc",pltspc);
    addSave("pltspd",pltspd);
    addSave("pltwid",pltwid);
    addSave("nbmr",nbmr);
    addSave("nbmf",nbmf);
    addSave("nbxr",nbxr);
    addSave("nbxf",nbxf);
    addSave("nhlr",nhlr);
    addSave("nhlf",nhlf);
    addSave("nhur",nhur);
    addSave("nhuf",nhuf);
    addSave("cnfr",cnfr);
    addSave("cndr",cndr);
    addSave("plynm",plynm);
    addSave("dfcea",dfcea);
    addSave("dfchd",dfchd);
    addSave("dfhea",dfhea);
    addSave("dfhhd",dfhhd);
    addSave("clinc",clinc);
    addSave("topsc",topsc);
    addSave("sfxgn",sfxgn);
    addSave("mscgn",mscgn);
    file=split(save,';');
    saveStrings("data/config.dat",file);
  }
  
  //agrega la información de un dato entero
  void addSave(String s,int d){
    save=save+"#"+s+"="+d+";";
  }
  
  //agrega la información de un dato booleano
  void addSave(String s,boolean d){
    save=save+"#"+s+"="+((d)?"ON":"OFF")+";";
  }
  
  //agrega la información de un dato cadena
  void addSave(String s,String d){
    save=save+"#"+s+"="+d+";";
  }
  
  //agrega la información de un dato flotante
  void addSave(String s,float d){
    save=save+"#"+s+"="+d+";";
  }
}
