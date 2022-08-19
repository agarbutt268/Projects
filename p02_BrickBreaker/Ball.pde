class Ball {
  //instance variables
  int x, y;
  int xVel, yVel;
  int radius;
  color c;
  
  
  Ball(int cx, int cy, int xv, int yv, int r, color f){
    x = cx;
    y = cy;
    xVel = xv;
    yVel = yv;
    radius = r;
    c = f;
  }//constructor
  
  
  void display(){
    fill(c);
    circle(x, y, radius * 2);
  }//display
  
  
  void move(){
    x += xVel;
    y += yVel;
    
    if(x <= radius || x >= width - radius){
      xVel *= -1;
    }
    
    if(y <= radius){
      yVel *= -1;
    }
  }//move
  
  
  void brickBounce(Brick b){
    if(x > b.x && x < b.x + b.bWidth){
      yVel *= -1;
    }//top and bottom
    
    if(y > b.y && y < b.y + b.bHeight){
      xVel *= -1;
    }//left and right
    
    if(x <= b.x && y <= b.y){
      xVel = abs(xVel) * -1;
      yVel = abs(yVel) * -1;
    }//upper left corner
    
    if(x <= b.x && y >= b.y + b.bHeight){
      xVel = abs(xVel) * -1;
      yVel = abs(yVel);
    }//bottom left corner
    
    if(x >= b.x + b.bWidth && y <= b.y){
      xVel = abs(xVel);
      yVel = abs(yVel) * -1;
    }//top right corner
    
    if(x >= b.x + b.bWidth && y >= b.y + b.bHeight){
      xVel = abs(xVel);
      yVel = abs(yVel);
    }//bottom right corner
    
  }//brickBounce
  
  void pBounce(Paddle p){
    if(p.x - p.pWidth/2 <= x && x < p.x){
      yVel *= -1;
      xVel = abs(xVel) * -1;
    }//left half of paddle
    
    if(p.x < x && x < p.x + p.pWidth/2){
      yVel *= -1;
      xVel = abs(xVel);
    }//right half of paddle
  }//pBounce
}
