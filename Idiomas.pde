//Modulo Idiomas
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 7 de octubre de 2022
//fecha de ultima modificación: 5 de diciembre de 2022
//comentario: Controla la carga de mensajes en idioma inglés o español
class Idiomas{
  String idiomas[][]; //contiene los mensajes en los dos idiomas
  String file[];      //contiene el archivo de idioma para copia
  int idiact;         //indica el idioma activo
  int nm;             //indica cuántos mensajes hay
 
  //Constructor: se indica el idioma activo y el número de mensajes en el archivo
  Idiomas(int l, int n){
    idiact=l;
    nm=n;
    idiomas=new String[nm][2];
    cargaIdioma(IDESP);
    cargaIdioma(IDING);
  }
  
  //lee el archivo de idioma indicado y lo carga en la columna correspondiente
  void cargaIdioma(int i){
    int n;
    file=loadStrings((i==IDESP)?"esp.lang":"eng.lang");
    for(n=0; n<nm;n++)
      idiomas[n][i]=split(file[n],'=')[1];
  }
  
  //indica cuál es el idioma activo en el juego
  void setIdioma(int i){
    idiact=i;
  }
  
  //devuelve cuál es el idioma activo
  int getIdioma(){
    return idiact;
  }
  
  //devuelve el mensaje indicado en el idioma activo
  String mensaje(int i){
    return idiomas[i][idiact];
  }
}
