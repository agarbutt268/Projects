/*
Aden Garbutt
Emerson Gelobter
Period 9
Project 02: Breakin'
*/

//Globals
int DESTROYED = 0;
int ALIVE = 1;

Ball b;
Paddle p;
Grid g;
Brick brick;
color c = color(255);

void setup(){
  size(500, 600);

  b = new Ball((width/2) + 3, (height/2) + 3, 5, -5, 12, c);
  g = new Grid(7, 9);
  p = new Paddle(height - 25, 150, c);  
}//setup

void draw(){
  background(0); //sets background
  
  b.display(); //displays ball
  p.display(); //displays paddle
  g.display(); //displays grid
  g.testIfDestroyed();
  
  if(g.state == DESTROYED){
    print("You Win!");
    exit();
  }
  
  b.move();
  
  if(b.y > height){
    print("Game Over");
    exit();
  }
  
  if(p.contact(b)){ //makes sure ball is in touching paddle
    b.pBounce(p); //bounces the ball of the paddle
  }
  
  g.contact(b); //checks to see if each ball in the grid is in contact with the ball
                //and bounces the ball off of the brick it is in contact with
}//draw
