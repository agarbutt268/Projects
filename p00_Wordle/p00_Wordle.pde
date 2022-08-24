Wordle newGame;

void setup(){
  size(425,680);
  background(0);
 
  newGame = new Wordle();
  newGame.drawGrid();
  newGame.drawKeyboard();
  newGame.drawKeys();
}


void draw(){
}


void keyPressed(){
  if(newGame.guessNum <= 5){
    if(97 <= int(key) && int(key) < 123){
      newGame.typeLetter();
    }
    
    if(key == 8){
      newGame.delete();
    }
    
    if (key == 10){
      newGame.enter();
    }
  }
}
