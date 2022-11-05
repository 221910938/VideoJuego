//Módulo Dado 
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 23 de octubre de 2022
//fecha de ultima modificación: 23 de octubre de 2022
//comentario: Implementa una clase para usar dados y generar valores aleatorios
class Dado{
  int nc;
  int t;
  
  Dado(int n){
    nc=n;
  }
  
  int tirar(){
    t=int(random(1,nc+1));
    return t;
  }
}
