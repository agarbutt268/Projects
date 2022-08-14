class Ghost{
  
  static final int RED = 0;
  static final int PINK = 1;
  static final int BLUE = 2;
  static final int ORANGE = 3;
  
  static final int U = 4;
  static final int D = 5;
  static final int L = 6;
  static final int R = 7;
  
  static final int START = 8;
  static final int CHASE = 9;
  static final int FREIGHTENED = 10;
  
  
  float x, y;
  float xVel, yVel;
  color c;
  int type;
  float speed = 2.0;
  int mode;
  
  
  
  Ghost(int xPos, int yPos, int t, int m){
    x = xPos;
    y = yPos;
    type = t;
    mode = m;
    yVel = speed;
  }
  
  
  void run(){
    
    Node n = m.atNode(x, y);
    int yDirection, xDirection;
    float xDif, yDif;
    boolean noMatch = true;
    int[] aSpaces = new int[4];
      
    xDif = abs(pac.x - x);
    yDif = abs(pac.y - y);
    
    
    if(mode == START){
      
      
      if(type == RED){
        if(y != 90){
          yVel = -speed;
          xVel = 0;
        } else {
          yVel = 0;
          xVel = -speed;
        }
        
        if(y == 90 & x == 250){
          mode = CHASE;
        }
      }
      
      if(type == PINK){
        
        if(blinky.mode == START){
          
          if(y == 130){
            yVel = speed;
            xVel = 0;
          }
          if(y == 172){
            yVel = -speed;
            xVel = 0;
          }
          
        } else { 
          
          if(y != 90){
            yVel = -speed;
            xVel = 0;
          } else {
            yVel = 0;
            xVel = -speed;
          }
          
          if(y == 90 & x == 190){
            mode = CHASE;
          }
        }
        
      }
      
      if(type == BLUE){
        if(pinky.mode == START){
          
          if(y == 130){
            yVel = speed;
            xVel = 0;
          }
          if(y == 172){
            yVel = -speed;
            xVel = 0;
          }
          
        } else {
          
          if(y != 90){
            yVel = -speed;
            xVel = 0;
          } else {
            yVel = 0;
            xVel = speed;
          }
          
          if(y == 90 & x == 550){
            mode = CHASE;
          }
        }
      }
      
      if(type == ORANGE){
        
        if(inky.mode == START){
          
          if(y == 130){
            yVel = speed;
            xVel = 0;
          }
          if(y == 172){
            yVel = -speed;
            xVel = 0;
          }
          
        } else {
          
          if(y != 90){
            yVel = -speed;
            xVel = 0;
          } else {
            yVel = 0;
            xVel = speed;
          }
          
          if(y == 90 & x == 610){
            mode = CHASE;
          }
        }
        
      }
      
    }
    
    if (mode == CHASE){
      
      if(n != null){
        
        if(n.up != null){
          aSpaces[0] = U;
        }
        if(n.down != null){
          aSpaces[1] = D;
        }
        if(n.left != null){
          aSpaces[2] = L;
        }
        if(n.right != null){
          aSpaces[3] = R;
        }
        
        if(pac.x > x){
          xDirection = R;
        } else {
          xDirection = L;
        }
        
        if(pac.y > y){
          yDirection = D;
        } else {
          yDirection = U;
        }
        
        
        if(xDif < yDif){
          if(aSpaces[0] == yDirection){
            xVel = 0;
            yVel = -speed;
            noMatch = false;
          } else if(aSpaces[1] == yDirection){
            xVel = 0;
            yVel = speed;
            noMatch = false;
          }
        } else {
          if(aSpaces[3] == xDirection){
            xVel = speed;
            yVel = 0;
            noMatch = false;
          }  
          else if(aSpaces[2] == xDirection){
            xVel = -speed;
            yVel = 0;
            noMatch = false;
          }
        }
        
        
        if(noMatch){
          int direction = int(random(0,4));
          
          while(aSpaces[direction] == 0){
            direction = int(random(0,4));
          }
          
          if(direction == 0){
            xVel = 0;
            yVel = -speed;
          } else if(direction == 3){
            xVel = speed;
            yVel = 0;
          } else if(direction == 1){
            xVel = 0;
            yVel = speed;
          } else if(direction == 2){
            xVel = -speed;
            yVel = 0;
          }
          
        }
        
      }
    }
    
    if (mode == FREIGHTENED){
      
      if(n != null){
        if(n.up != null){
          aSpaces[0] = U;
        }
        if(n.down != null){
          aSpaces[1] = D;
        }
        if(n.left != null){
          aSpaces[2] = L;
        }
        if(n.right != null){
          aSpaces[3] = R;
        }
        
        int direction = int(random(0,4));
        
        while(aSpaces[direction] == 0){
          direction = int(random(0,4));
        }
        
        if(direction == 0){
          xVel = 0;
          yVel = -speed;
        } else if(direction == 3){
          xVel = speed;
          yVel = 0;
        } else if(direction == 1){
          xVel = 0;
          yVel = speed;
        } else if(direction == 2){
          xVel = -speed;
          yVel = 0;
        }
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
  
  
  boolean touchingPacman(){
    float d = dist(pac.x, pac.y, x, y);
    
    return d < 25;
  }
  
  
  void display(){
    if(mode == FREIGHTENED){
      fill(0, 0, 255);
    } else {
      if(type == RED){
        fill(255, 0, 0);
      }
      if(type == PINK){
        fill(#F57CE7);
      }
      if(type == BLUE){
        fill(#44F5FA);
      }
      if(type == ORANGE){
        fill(#F7A602);
      }
    }
    
    circle(x, y, 35);
  }
  
}//Ghost
