class Pellet{
  
  final static int REGULAR = 0;
  final static int SUPER = 1;
  final static int DEAD = 2;
  
  int x, y;
  int type;
  
  Pellet(int xPos, int yPos, int t){
    x = xPos;
    y = yPos;
    type = t;
  }
  
  
  boolean contains(float xPos, float yPos){
    float d = dist(x, y, xPos, yPos);
    return d == 0;
  }
  
  
  void display(){
    fill(255);
    rectMode(CENTER);
    if(type == REGULAR){
      square(x, y, 4);
    }
    if(type == SUPER){
      square(x, y, 12);
    }
    rectMode(CORNER);
  }
}
