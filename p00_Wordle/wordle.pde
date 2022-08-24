class Wordle{
  String[] words, targetWords;
  String target;
  int cursorX, cursorY, letter, guessNum;
  char[] guessLetters, targetLetters;
  
  
  Wordle(){
    textAlign(CENTER, CENTER);
    
    words = split(loadStrings("words.csv")[0], ',');
    targetWords = split(loadStrings("words_reasonable.csv")[0], ',');
    
    target = targetWords[int(random(targetWords.length + 1))];
    
    cursorX = 63;
    cursorY = 77;
    guessNum = 0;
    letter = 0;
    
    guessLetters = new char[5];
    targetLetters = new char[5];
    
    for(int i = 0; i < target.length(); i++){
      targetLetters[i] = target.charAt(i);
    }
  }
  
  
  void drawGrid(){
    for(int x = 25; x < 375; x += 75){
      for(int y = 50; y < 500; y += 75){
        fill(0);
        stroke(255);
        strokeWeight(3);
        square(x, y, 75);
      }
    }
  }
  
  
  void typeLetter(){
    fill(255);
    textSize(70);
    
    if(letter <= 4){
      char capital = char(int(key) - 32);
      
      if(key == 'q'){
        text(capital, cursorX, cursorY - 4);
      } else {
        text(capital, cursorX, cursorY);
      }
        
      cursorX += 75;  
      guessLetters[letter] = key;
      letter++;
    }
  }
  
  
  void delete(){
    if(letter > 0){
      cursorX -= 75;
      fill(0);
      stroke(255);
      strokeWeight(3);
      square(cursorX - 38, cursorY - 27, 75);
      noStroke();
      rect(0, 0, 425, 45);
        
      letter--;
      guessLetters[letter] = ' ';
    }
  }
  
  
  void enter(){
    if(letter >= 5){
      if(validGuess()){
        String guess = "";
    
        for(char c: guessLetters){
          guess += c;
        }
        
        if(guess.equals(target)){
          guessNum = 6;
        }
        
        checkGuess();
        displayGuess();
        drawKeys();
        
        guessNum += 1;
        letter = 0;
        cursorY += 75;
        cursorX = 63;
      } else {
        textSize(50);
        fill(255, 0, 0);
        text("NOT A VALID WORD", 215, 15);
      }
    }
  }
  
  
  boolean validGuess(){
    String guess = "";
    
    for(char c: guessLetters){
      guess += c;
    }
    
    for(String word: words){
      if(guess.equals(word)){
        return true;
      }
    }
    
    return false;
  }
  
  
  char[] alreadyGreenLetters = new char[0];
  char[] alreadyYellowLetters = new char[0];
  
  void checkGuess(){
    
    char[] targetLettersCheck = new char[5];
    arrayCopy(targetLetters, targetLettersCheck);
    
    char[] guessLettersCheck = new char[5];;
    arrayCopy(guessLetters, guessLettersCheck);
    
    for(int i = 0; i < 5; i++){ 
      if(guessLettersCheck[i] == targetLettersCheck[i]){
        fill(23, 211, 25);
        stroke(255);
        strokeWeight(4);
        square((i * 75) + 25, cursorY - 27, 75);
        
        alreadyGreenLetters = append(alreadyGreenLetters, guessLettersCheck[i]);
        colorKey(guessLettersCheck[i], color(23, 211, 25));
        targetLettersCheck[i] = ' ';
        guessLettersCheck[i] = ' ';
      }
    }//if letter is both in target and correct location turn green
    
    
    for(int i = 0; i < 5; i++){ 
      
      boolean LetterNotInWord = true;
      
      for(int p = 0; p < 5; p++){
        
        if(guessLettersCheck[i] == targetLettersCheck[p]){
          
          LetterNotInWord = false;
          
          if(guessLettersCheck[i] != targetLettersCheck[i]){
            fill(228, 232, 30);
            stroke(255);
            strokeWeight(4);
            square((i * 75) + 25, cursorY - 27, 75);
            
            alreadyYellowLetters = append(alreadyYellowLetters, guessLettersCheck[i]);
            
            boolean alreadyGreen = false;
            
            for(char c: alreadyGreenLetters){
              if(guessLettersCheck[i] == c){
                alreadyGreen = true;
              }
            }
            
            if(alreadyGreen){
            } else {
              colorKey(guessLettersCheck[i], color(228, 232, 30));
            }
            
            targetLettersCheck[p] = ' ';
            guessLettersCheck[i] = ' ';
          }//if letter is not in same location as target it will turn yellow
          
        }//checks if letter is in target
        
      }//nested for loop
      
      if(LetterNotInWord){
        fill(100);
        stroke(255);
        strokeWeight(4);
        square((i * 75) + 25, cursorY - 27, 75);
        
        boolean alreadyYellow = false;
            
        for(char c: alreadyYellowLetters){
          if(guessLettersCheck[i] == c){
            alreadyYellow = true;
          }
        }
        
        if(alreadyYellow){
        } else {
          colorKey(guessLettersCheck[i], color(100));
        }
        
      }//Makes letters not in target gray
      
    }//outer for loop
  }//checkGuess
  
  
  void displayGuess(){
    fill(255);
    
    for(int i = 0; i < guessLetters.length; i++){
      char capital = char(int(guessLetters[i]) - 32);
      
      if(guessLetters[i] == 'q'){
        text(capital, 63 + (i * 75), cursorY - 4);
      } else {
        text(capital, 63 + (i * 75), cursorY);
      }
    }
    
  }//displayGuess
 
  
  void drawKeyboard(){
    strokeWeight(2);
    
    for(int x = 13; x < 400; x += 40){
      rect(x, 525, 35, 45);
    }
    
    for(int x = 33; x < 392; x += 40){
      rect(x, 575, 35, 45);
    }
    
    for(int x = 53; x < 333; x += 40){
      rect(x, 625, 35, 45);
    }
    
  }
  
  
  void drawKeys(){
    fill(255);
    textSize(35);
    
    char[][] layout = { {'q','w','e','r','t','y','u','i','o','p'}, 
                          {'a','s','d','f','g','h','j','k','l'}, 
                           {'z','x','c','v','b','n','m'} };
                           
    for(int r = 0; r < layout.length; r++){
      for(int c = 0; c < layout[r].length; c++){
        
        char capital = char(int(layout[r][c]) - 32);
        
        if(r == 0){
          text(capital, (c * 40) + 30, (r * 50) + 540);
        } else if (r == 1){
          text(capital, (c * 40) + 50, (r * 50) + 540);
        } else if (r == 2){
          text(capital, (c * 40) + 70, (r * 50) + 540);
        }
        
      }
    }
    
  }
  
  
  void colorKey(char n, color p){
    char[][] layout = { {'q','w','e','r','t','y','u','i','o','p'}, 
                          {'a','s','d','f','g','h','j','k','l'}, 
                           {'z','x','c','v','b','n','m'} };
    
    for(int r = 0; r < layout.length; r++){
      for(int c = 0; c < layout[r].length; c++){
        if(layout[r][c] == n){
          
          fill(p);
          strokeWeight(2);
          
          if(r == 0){
            rect((c * 40) + 13, (r * 50) + 525, 35, 45);
          } else if (r == 1){
            rect((c * 40) + 33, (r * 50) + 525, 35, 45);
          } else if (r == 2){
            rect((c * 40) + 53, (r * 50) + 525, 35, 45);
          }
        }
          
      }
    }
    
  }
  
}
