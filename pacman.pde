class Pacman {
  
  static final int MOVING_HORIZONTALLY = 1;
  static final int MOVING_VERTICALLY = 2;
  static final int AT_JUNCTION = 3;
  
  
  float x, y;
  float xVel, yVel;
  int mode;
  float speed = 2.5;
  
  
  Pacman(int xPos, int yPos){
    x = xPos;
    y = yPos;
    mode = MOVING_HORIZONTALLY;
  }//constructor
  
  
  void run(){
    
    if(m.atNode(x, y) != null){
      yVel = 0;
      xVel = 0;
      mode = AT_JUNCTION;
    }
    
    
    if(mode == AT_JUNCTION){
      
      Node junction = m.atNode(x, y);
      
      if(key == 'w' && junction.up != null){
        yVel = -speed;
        xVel = 0;
        mode = MOVING_VERTICALLY;
      }
      
      if(key == 'a' && junction.left != null){
        yVel = 0;
        xVel = -speed;
        mode = MOVING_HORIZONTALLY;
      }
      
      if(key == 's' && junction.down != null){
        yVel = speed;
        xVel = 0;
        mode = MOVING_VERTICALLY;
      }
      
      if(key == 'd' && junction.right != null){
        yVel = 0;
        xVel = speed;
        mode = MOVING_HORIZONTALLY;
      }
    } 
    else if(mode == MOVING_VERTICALLY){
      if(key == 'w'){
        yVel = -speed;
        xVel = 0;
      }
      
      if(key == 's'){
        yVel = speed;
        xVel = 0;
      }
    } 
    else if(mode == MOVING_HORIZONTALLY){
      if(key == 'a'){
        yVel = 0;
        xVel = -speed;
      }
      
      if(key == 'd'){
        yVel = 0;
        xVel = speed;
      }
    }
    
    if(x > width + 30){
      x = -30;
      
    }
    if(x < -30){
      x = width + 30;
    }
    
    x += xVel;
    y += yVel;
    
  }//run
  
  
  void display(){
    fill(255, 255, 0);
    circle(x, y, 30);
  }//display
  
}//Pacman
