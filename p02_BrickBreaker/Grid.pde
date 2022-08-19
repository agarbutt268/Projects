class Grid{
  //instance variables
  Brick grid[][];
  int state;
  int num;
  Grid(int rows, int columns){
    grid = new Brick[rows][columns];
    
    for(int n = 0; n < grid.length; n++){
      for(int i = 0; i < grid[n].length; i++){
          grid[n][i] = new Brick(i * (width/columns), n * ((height * 2/5)/rows), width/columns , (height * 2/5)/rows, ALIVE, c);
      }
    }
    
    state = ALIVE;
    num = rows * columns;
  }//constructor
  
  void testIfDestroyed(){
    int p = 0;
    for(int n = 0; n < grid.length; n++){
      for(int i = 0; i < grid[n].length; i++){
        if(grid[n][i].state == DESTROYED){ 
          p +=1; 
        }
      }
    }
    if(p == num){
      state = DESTROYED;
    }
    else{
      state = ALIVE;
    }
  }
    
  void display(){
    for(int n = 0; n < grid.length; n++){
      for(int i = 0; i < grid[n].length; i++){
        if(grid[n][i].state == ALIVE){ //only displays bricks that are ALIVE
          grid[n][i].display(); //displays each brick
        }
      }
    }
  }//display
  
  
  void contact(Ball b){
    for(int n = 0; n < grid.length; n++){
      for(int i = 0; i < grid[n].length; i++){
        if(grid[n][i].contact(b) && grid[n][i].state == ALIVE){
          b.brickBounce(grid[n][i]); //bounces the ball off the brick
          grid[n][i].state = DESTROYED; //sets brick state to DESTROYED
        }
      }
    }//for loop
    
  }//contact
  
}//Grid
