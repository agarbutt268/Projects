class Population{
  Individual pop[];
  Individual best;
  int numIndividuals;
  float totalFitness, mutationRate;
  
  
  Population(int popSize){
    numIndividuals = popSize;
    pop = new Individual[numIndividuals];
    mutationRate = 0.05;
    totalFitness = 0;
    best = null;
  }
  
  
  void randomPop(){
    for(int i = 0; i < numIndividuals; i++){
      pop[i] = new Individual(true);
    }
  }
  
  
  void display(boolean showFitness, boolean showBest){
    for(int i = 0; i < numIndividuals; i++){
      if(i == getBestIndex() && showBest){
        pop[i].display(showFitness, true);
      } else {
        pop[i].display(showFitness, false);
      }
    }
  }//display
  
  
  void run(){
    for(int i = 0; i < numIndividuals; i++){
      pop[i].run();
    }
  }
  
  
  Individual get(int index){
    return pop[index];
  }
  
  
  void setBest() {
    best = pop[getBestIndex()];
  }//setBest
  
  
  void setFitness(){
    for(int i = 0; i < numIndividuals; i++){
      pop[i].setFitness();
      totalFitness += pop[i].fitness;
    }
  }//setFitness
  
  
  Individual select(){
    float r = random(totalFitness);
    float runningFitness = 0;
    Individual chosenOne = null;
    
    for(int i = 0; i < numIndividuals; i++){
        
      runningFitness += pop[i].fitness;
      
      if(r <= runningFitness){
        chosenOne = pop[i];
        return chosenOne;
      } 
    }
    
    return chosenOne;
  }//select
  
  
  Population matingSeason(){
    Population newPop = new Population(pop.length);
    
    for(int i = 0; i < newPop.pop.length; i++){
      if(i == getBestIndex()){
        newPop.pop[i] = pop[i].mate(pop[i]);
      } else {
        Individual p1 = select();
        Individual p2 = select();
        Individual c = p1.mate(p2);
        
        c.mutate(mutationRate);
        newPop.pop[i] = c;
      }
    }
    return newPop;
  }//matingSeason
  
  
  int getBestIndex() {
    int b = 0;
    
    for (int i = 0; i < numIndividuals; i++) {
      if (pop[i].fitness > pop[b].fitness) {
        b = i;
      }
    }
    return b;
  }//getBestIndex


  float getBestFitness() {
    return pop[getBestIndex()].fitness;
  }//getBestFitness


  float getAvgFitness() {
    setFitness();
    return totalFitness / numIndividuals;
  }//getAvgFitness
  
}//Population
