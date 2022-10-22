//Módulo ConfigFiles 
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 10 de octubre de 2022
//fecha de ultima modificación: 15 de octubre de 2022
//comentario: Define la clase ConfigFiles, la cual permite configurar ciertas
//características del juego para que sean cargadas durante el arranque
class ConfigFiles{
  String file[];
  String save;
  //parámetros a guardar
  int lang;  //idioma activo
  int ns;    //número de mensajes de idiomas
  int bgdx;  //velocidad horizontal del fondo
  int bgdy;  //velocidad vertical del fondo
  int fgdx;  //velocidad horizontal del frente
  int fgdy;  //velocidad vertical del frente
  int prdxu; //velocidad horizontal de ascenso del personaje
  int prdyu; //velocidad vertical de ascenso del personaje
  int prdxd; //velocidad horizontal de descenso del personaje
  int prdyd; //velocidad vertical de descenso del personaje
  
  ConfigFiles(){
    file=loadStrings("config.dat");
    loadConfig();
  }
  
  void loadConfig(){
    int i;
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
    }
  }
  
  boolean isData(String s, int d){
    return split(file[d],'=')[0].equals("#"+s);
  }
  
  int loadData(int d){
    return int(split(file[d],'=')[1]);
  }
  
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
    file=split(save,';');
    saveStrings("data/config.dat",file);
  }
  
  void addSave(String s,int d){
    save=save+"#"+s+"="+d+";";
  }
}
