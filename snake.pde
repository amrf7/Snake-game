//Snake object
class snake{
  int[] x = new int[10], y = new int[10]; //Position coordinates
  int x0, y0;
  int pos = 0, puntaje = 0; //Score 
  int vel; //speed
  
  snake(){
    //initializing position
    x[0]=width/2;
    y[0]=height/2;
    for (int i = 0; i < x.length-1; i++){
      x[i+1] = x[i];
      y[i+1] = y[i];
    } 
  }
  
  //Show snake
  void mostrar(){
    //Snake properties
    ellipseMode(CENTER);
    colorMode(HSB);
    noStroke();
   
    for(int i = 0; i < x.length; i++){
      //Color, size and position
      fill(x[i]/2,255,255);
      ellipse(x[i],y[i],20,20);
      if(y0!=0){ //Show vertical eyes
        fill(255);
        ellipse(x[0]-5,y[0],8,8);
        ellipse(x[0]+5,y[0],8,8);
        fill(0);
        ellipse(x[0]-5,y[0],4,4);
        ellipse(x[0]+5,y[0],4,4);
      } else { //Show horizontal eyes 
        fill(255);
        ellipse(x[0],y[0]-5,8,8);
        ellipse(x[0],y[0]+5,8,8);
        fill(0);
        ellipse(x[0],y[0]-5,4,4);
        ellipse(x[0],y[0]+5,4,4);
      }
    }    
  }
  
  //Método para mover la serpiente 
  void mover(){
    //Variables para mover el primer indice del arrego
    x[0]+=x0;
    y[0]+=y0;
    //Cliclo para asignar nuevas posiciones para el resto de íncices del arreglo 
    for(int i = x.length-1; i > 0; i--){
      x[i]=x[i-1];
      y[i]=y[i-1];
    }
  }
  void keyPressed(){
    //Restricción para la velociodad máxima de la serpiente
    x0=constrain(x0,-5,5);
    y0=constrain(y0,-5,5);
    vel=puntaje/10;
    if(keyCode == UP && y0!=2){ //Condición para que la serpiente vaya para arriba y no puedaa ir hacia abajo en un solo movimiento
      //Velocidades iniciales
      x0=0;
      y0=-2-vel;
    } else if(keyCode == DOWN && y0 != -2){ //Condición para que la serpiente vaya para abajo y no puedaa ir hacia arriba en un solo movimiento
      //Velocidades iniciales
      x0=0;
      y0=2+vel;
    } else if(keyCode == LEFT && x0!= 2){ //Condición para que la serpiente vaya a  la izquierda y no puedaa ir hacia la derecja en un solo movimiento
      //Velocidades iniciales
      x0=-2-vel;
      y0=0;
    } else if(keyCode == RIGHT && x0!=-2){ //Condición para que la serpiente vaya a la derecha y no puedaa ir hacia la izquierda en un solo movimiento
      //Velocidades iniciales
      x0=2+vel;
      y0=0;
    }
  }
  
  //Método que permite que la serpiente crezca 
  void comer(int a, int b){
    //Condiciones que comparan la posición del primer indice (cabeza) de la snake con la posición de los puntos
    if(x[0]<=a+15 && x[0]>=a-15){ 
      if(y[0]<=b+15 && y[0]>=b-15){
        //Con los expand el tamaño de los arreglos aumenta
        x=expand(x,x.length+10);
        y=expand(y,y.length+10);
        pos=1; //Variable para sumar al puntaje
      }
    } else { //Si no se cumple la condición, no se suma nada al puntaje
      pos = 0;
    }
    puntaje+=pos; //Variable para la suma de puntos
  }
  
  //Métodos para la reasignación de posiciones (x,y) de los puntos blancos
  int randomX(int posx){
    if(pos==1)
      return int(random(width)); //Return para reasignar x
    return posx;
  }
  int randomY(int posy){
    if(pos==1)
      return int(random(height/12,height)); //Return para reasignar y
    return posy;
  }
  
  //Método para obtener el puntaje
  int getPuntaje(){
    return puntaje;
  }
  
  //Método para llevar a la pantalla de finde juego si la serpiente toca los bordes
  boolean morir(){
    if(x[2]<=0 || x[2]>=width || y[2] <= height/12 || y[2]>=height){ //Condicón para saber si la serpiente está tocando los bordes de la pantalla
      return true;
    } else {
      return false;
    }
  }
  void reiniciar(boolean b){ //Métopo para reestablecer los valores iniciales de puntaje, posición y tamaño de la serpiente
    if(b){ //Condición para que se aplique el método de reinicio, valor b tomado del método morir.
      //Cambio de valor en las variables para que la serpiente se deje de mover.
      x0=0;
      y0=0;
      //Reiniciar el tamaño.
      x=expand(x,10);
      y=expand(y,10);
      if(keyPressed==true){ //Condición para reiniciar la posición lo que permite volver a jugar.
        //Reiniciar la posición
        x[0]=width/2;
        y[0]=height/2;
        puntaje = 0; //Reiniciar el puntaje
      }
    }
  }
  boolean comparar(){ //Método para comparar la posición del primer índice del arreglo snake con las posiciones de los demás índices 
    if(puntaje>0){ //Condición para comenzar a comparar desde que la serpiente como y crece por primera vez
      for(int i = 5; i < x.length; i++){ //Ciclo que compara las posiciones de los índices 
        if((x[i]<=x[0]+3 && x[i]>=x[0]-3) && (y[i]<=y[0]+3 && y[i]>=y[0]-3)){ //Condición para comoparar los índices con un radio de +-3 pixeles 
          //Cambio de valor en las variables para que la serpiente se deje de mover.
          x0=0;
          y0=0;
          if(keyPressed==true){ //Condición de reinicio hasta que presiones la tecla
            reiniciar(true); //Invocar el método de reinicio
          }
          return true; //Invoca el método mostrar y muestra la página de fin de juego
        } 
      }
    }
    return false; //No  muestra la página de fin de juego hasta que sucedan las condiciones de puntaje distinto de 0 y que las posiciones de los índices se toquen
  }
}
