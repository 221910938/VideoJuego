//Modulo Idiomas
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 7 de octubre de 2022
//fecha de ultima modificación: 7 de octubre de 2022
//comentario: Controla la carga de mensajes en idioma inglés o español
class Idiomas{
  String idiomas[][]; //contiene los mensajes en los dos idiomas
  String file[];      //contiene el archivo de idioma para copia
  int idiact;         //indica el idioma activo
  int nm;             //indica cuántos mensajes hay
 
  Idiomas(int l, int n){
    idiact=l;
    nm=n;
    idiomas=new String[nm][2];
    cargaIdioma(IDESP);
    cargaIdioma(IDING);
  }
  
  void cargaIdioma(int i){
    int n;
    file=loadStrings((i==IDESP)?"esp.lang":"eng.lang");
    for(n=0; n<nm;n++)
      idiomas[n][i]=split(file[n],'=')[1];
  }
  
  void setIdioma(int i){
    idiact=i;
  }
  
  int getIdioma(){
    return idiact;
  }
  
  String mensaje(int i){
    return idiomas[i][idiact];
  }
}
