int x, y; //Point coordinates

snake s; //Snake object

points p; //Point object

Inicio i; //Initial screen object

GameOver g; //Ending screen object

void setup(){
  size(500,500); //Screen size definition 
  
  //Random initialization for point objects
  x= int(random(18, width-18)); 
  y= int(random(height/12+18,height-18)); 
  
  //Objects initialization
  s = new snake(); 
  p= new points();
  i=new Inicio();
  g=new GameOver();
}

void keyPressed(){
  //Start game condition
  if(keyCode==UP||keyCode==DOWN||keyCode==LEFT||keyCode==RIGHT){
    background(0);
    //Show and move snake object
    s.mostrar();
    s.mover();
    s.keyPressed();
    //Show points
    p.mostrar(x,y); 
    //Change point position after being eaten
    s.comer(x,y);
    x=s.randomX(x);
    y=s.randomY(y);
    //Print score
    i.puntaje(s.getPuntaje(),x); 
    //End game when snake dies, show ending screen 
    s.reiniciar(s.morir());
    g.mostrar(s.morir(),s.getPuntaje());
    g.mostrar(s.comparar(),s.getPuntaje());
  } else if(key==' ' || keyPressed==false){
  //Show initial screen
    background(0);
    i.mostrar();
  }
}
void draw(){
  //Display method
  keyPressed();
}
