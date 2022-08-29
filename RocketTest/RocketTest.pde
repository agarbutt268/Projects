int NUM_MOVES = 250;
int moveCount;
int generation;
int targetX;

Population p;
int display;

void setup() {
  size(500, 500);
  targetX = int(random(35, width - 35));
  
  p = new Population(50);
  p.randomPop();
  moveCount = 0;
  println("======== Generation #" + generation + " ========");
}


void draw() {
  background(255);
  fill(255, 255, 0);
  circle(targetX, 25, 35);
  
  if(moveCount < NUM_MOVES) {
    p.display(false, false);
    p.run();
    moveCount++;
  } else {
    p.display(true, true);
    p.setBest();
    
    while(display == 0){
      println("Best Fitness: " + p.getBestFitness());
      println("Avg Fitness: " + p.getAvgFitness());
      display++;
    }
    
  }
  
}

void keyPressed(){
  if(key == 'm'){
    generation++;
    println();
    println("======== Generation #" + generation + " ========");
    display = 0;
    
    p = p.matingSeason();
    moveCount = 0;
  }
  
  if(key == 'p'){
    targetX = int(random(35, width - 35));
    p = new Population(50);
    p.randomPop();
    moveCount = 0;
  }
}
