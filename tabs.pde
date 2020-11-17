//Father class for screens
class Tab {
  PFont font,f;
  Tab(){
    //Font selection
    font = loadFont("HarlowSolid-48.vlw");
    f=loadFont("Dialog.plain-48.vlw");
    colorMode(HSB);
  }
  
  void mostrar(){
    rectMode(CORNER);
    fill(0);
    rect(0,0,width,height);
  }
}

class Inicio extends Tab{
  Inicio(){
    super(); //Tab properties inheritance
  }
  
  //Show screen
  void mostrar(){
    //Initial screen properties
    textFont(font);
    fill(random(255),255,255);
    textSize(100);
    text("Snake",width/4,height/2);
    fill(255);
    textFont(f);
    textSize(20);
    text("Press an arrow to start",width/3,5*height/8);
  }
  
  //Show score
  void puntaje(int c, int a){
    //Score properties
    rectMode(CENTER);
    textFont(f);
    noStroke();
    fill(a/2,255,255);
    rect(width/2,height/40,width,height/12);
    textSize(20);
    fill(0);
    text("Score: "+c,10,25);
  }
}
class GameOver extends Tab{
  GameOver(){
    super(); //Tab inheritance
  }
  //Show ending creen 
  void mostrar(boolean b, int p){ //Boolean declaring if snake is dead, p saves the score
    if(b){
      //Ending screen properties
      super.mostrar();
      fill(random(255),255,255);
      textFont(font);
      textSize(80);
      text("Game Over",width/7,height/2);
      fill(255);
      textFont(f);
      textSize(20);
      text("Final score: "+p,5*width/12,5*height/8-30);
      text("Press space to continue",5*width/16,5*height/8);
    }
  }
}
