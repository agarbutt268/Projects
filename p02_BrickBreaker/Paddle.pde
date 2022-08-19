class Paddle {
  //instance variables
  int x, y;
  int pWidth;
  color c;
  
  Paddle(int py, int pSize, color f){
    x = mouseX;
    y = py;
    pWidth = pSize;
    c = f;
  }//constructor
  
  
  void display(){
    x = mouseX;
    rectMode(CENTER);
    fill(c);
    rect(x, y, pWidth, 15);
  }//display
  
  
  boolean contact(Ball b){
    int checkX = b.x;
    float d;
    
    if (b.x <= this.x - pWidth/2) {
      checkX = this.x;
    } else if (b.x >= this.x + this.pWidth/2) {
      checkX = this.x + this.pWidth/2;
    }
    
    d = dist(b.x, b.y, checkX, y - 10);
    return (d < b.radius);
  }//contact
  
}//Paddle
