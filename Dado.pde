//Módulo Dado 
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 23 de octubre de 2022
//fecha de ultima modificación: 5 de diciembre de 2022
//comentario: Implementa una clase para usar dados y generar valores aleatorios
class Dado{
  int nc;  //número de caras del dado, todas tendrán la misma probabilidad
  int t;   //valor de la tirada que se haya generado
  
  //constructor: solo se indica el número de caras
  Dado(int n){
    nc=n;
  }
  
  //tirar genera un número aleatorio entre 1 y el número de caras
  int tirar(){
    t=int(random(1,nc+1));
    return t;
  }
}
