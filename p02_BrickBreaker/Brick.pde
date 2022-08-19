class Brick {
  //instance variables
  int x, y;
  int bWidth, bHeight;
  int state;
  color c;
  
  
  Brick(int bx, int by, int wid, int hght, int st, color f){
    x = bx;
    y = by;
    bWidth = wid;
    bHeight = hght;
    state = st;
    c = f;
  }//constructor
  
  
  void display(){
    fill(c);
    rectMode(CORNER);
    rect(x, y, bWidth, bHeight);
  }//display
  
  
  boolean contact(Ball b){
    int checkX = b.x;
    int checkY = b.y;
    float d;
    
    if (b.x <= this.x) {
      checkX = this.x;
    } else if (b.x >= this.x + this.bWidth) {
      checkX = this.x + this.bWidth;
    }
    
    if (b.y <= this.y) {
      checkY = this.y;
    } else if (b.y >= this.y + this.bHeight) {
      checkY = this.y + this.bHeight;
    }
    
    d = dist(b.x, b.y, checkX, checkY);
    return (d < b.radius);
  }//contact
  
}//Brick
