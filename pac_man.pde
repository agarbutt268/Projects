int PLAY = 0;
int PAUSE = 1;
int GAMEOVER = 3;
int state;
int timer = 0;


Pacman pac = new Pacman(400, 210);

Ghost blinky = new Ghost(348, 150, Ghost.RED, Ghost.START);
Ghost pinky = new Ghost(384, 150, Ghost.PINK, Ghost.START);
Ghost inky = new Ghost(420, 150, Ghost.BLUE, Ghost.START);
Ghost clyde = new Ghost(454, 150, Ghost.ORANGE, Ghost.START);

NodeMap m = new NodeMap();

void setup(){
  size(800, 500);
  m.createPellets();
  state = PLAY;
}

void draw(){
  if(state == PLAY){
    background(0);
    
    m.drawMap();
    //m.display();
    m.drawPellets();
    
    pac.display();
    pac.run();
    
    blinky.display();
    pinky.display();
    inky.display();
    clyde.display();
    
    blinky.run();
    pinky.run();
    inky.run();
    clyde.run();
    
    checkPellets();
    checkTouching();
  } else if(state == GAMEOVER){
    background(0);
    textSize(25);
    fill(255, 0, 0);
    text("GAME OVER", 380, 240);
  }
}


void checkPellets(){
  Pellet p = m.atPellet(pac.x, pac.y);
  
  if(p != null){
    if(m.atPellet(pac.x, pac.y).type == Pellet.SUPER){
        blinky.mode = Ghost.FREIGHTENED;
        pinky.mode = Ghost.FREIGHTENED;
        inky.mode = Ghost.FREIGHTENED;
        clyde.mode = Ghost.FREIGHTENED;
    }
    p.type = Pellet.DEAD;
  }
}


void checkTouching(){
  
  if(blinky.touchingPacman()){
    
    if(blinky.mode == Ghost.FREIGHTENED){
      blinky.mode = Ghost.START;
      blinky.x = 348;
      blinky.y = 150;
      
    } else {
      state = GAMEOVER;
    }
  }
  
  if(pinky.touchingPacman()){
    if(pinky.mode == Ghost.FREIGHTENED){
      pinky.mode = Ghost.START;
      pinky.x = 384;
      pinky.y = 150;
      
    } else {
      state = GAMEOVER;
    }
  }
  
  if(inky.touchingPacman()){
    if(inky.mode == Ghost.FREIGHTENED){
      inky.mode = Ghost.START;
      inky.x = 420;
      inky.y = 150;
      
    } else {
      state = GAMEOVER;
    }
  }
  
  if(clyde.touchingPacman()){
    if(clyde.mode == Ghost.FREIGHTENED){
      clyde.mode = Ghost.START;
      clyde.x = 454;
      clyde.y = 150;
      
    } else {
      state = GAMEOVER;
    }
  }

  
  if(blinky.mode == Ghost.FREIGHTENED || pinky.mode == Ghost.FREIGHTENED || inky.mode == Ghost.FREIGHTENED || clyde.mode == Ghost.FREIGHTENED){
    timer++;
    if(timer == 500){
      timer = 0;
      
      blinky.mode = Ghost.CHASE;
      pinky.mode = Ghost.CHASE;
      inky.mode = Ghost.CHASE;
      clyde.mode = Ghost.CHASE;
    }
  }
  
}

void keyPressed(){
  if(key == 'p'){
    if(state == PLAY){
      state = PAUSE;
    } else if (state == PAUSE){
      state = PLAY;
    }
  }
}
