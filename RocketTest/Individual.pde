class Individual {

  static final int MAGS_GENE_LENGTH = 10;
  static final int ANGLES_GENE_LENGTH = 9;

  Rocket phenotype;
  Gene mags[];
  Gene angles[];
  float fitness;


  Individual(boolean random) {

    angles = new Gene[NUM_MOVES];
    mags = new Gene[NUM_MOVES];

    if (random) {
      for (int i = 0; i < NUM_MOVES; i++) {
        mags[i] = new Gene(MAGS_GENE_LENGTH);
        angles[i] = new Gene(ANGLES_GENE_LENGTH);
      }      
      
      setPhenotype();
    }
  }//constructor


  void setPhenotype() {
    float[] ms = new float[NUM_MOVES];
    PVector[] as = new PVector[NUM_MOVES];
    
    for (int i = 0; i < NUM_MOVES; i++) {
      float theta = radians(angles[i].value / 1.42);
      
      ms[i] = mags[i].value / 10240.0;
      as[i] = new PVector(cos(theta), sin(theta));
    }

    phenotype = new Rocket(as, ms, NUM_MOVES);
  }//setPhenotype

  /*==========================
    Create a new Individual object based on "mating" the
    calling and parameter objects.

    Randomly select a number of genes to select from
    one parent, copy those into the chromosome of the
    new, "child" Individual. Then copy the remaining
    Genes from the other parent.

    Do not always start from the same parent. The
    "first" parent should be assigned randomly.

    There is a Gene construtor that takes a Gene object
    and creates a copy. Use it.
    ==========================*/
  Individual mate(Individual partner) {
    Individual child = new Individual(false);
    int cutOff = int(random(NUM_MOVES));
    int firstParent = int(random(2));
    
    if(firstParent == 0){
      
      for(int i = 0; i <= cutOff; i++){
        child.mags[i] = new Gene(this.mags[i]);
        child.angles[i] = new Gene(this.angles[i]);
      }
      
      for(int i = cutOff; i < NUM_MOVES; i++){
        child.mags[i] = new Gene(partner.mags[i]);
        child.angles[i] = new Gene(partner.angles[i]);
      }
      
    }
    
    if(firstParent == 1){
        
      for(int i = 0; i <= cutOff; i++){
        child.mags[i] = new Gene(partner.mags[i]);
        child.angles[i] = new Gene(partner.angles[i]);
      }
      
      for(int i = cutOff; i < NUM_MOVES; i++){
        child.mags[i] = new Gene(this.mags[i]);
        child.angles[i] = new Gene(this.angles[i]);
      }
      
    }
    
    child.setPhenotype();
    return child;
  }//mate

  /*==========================
    Set the fitness based on how close the calling
    object is to the parameter.

    Larger values should mean more fit. You can base this
    calculation on either the chromosome values or geneotypes,
    though the values are simpler to work with.
    ==========================*/
 
  void setFitness() {
    
    fitness = (710 - dist(phenotype.position.x, phenotype.position.y, targetX, 25))/710;
    
  }//setFitness
  

  void mutate(float rate) {
    for (int i = 0; i < NUM_MOVES; i++) {
      if (random(1) < rate) {
        mags[i].mutate();
        angles[i].mutate();
        
        setPhenotype();
      }
    }
  }//mutate


  void display(boolean showFitness, boolean best) {
    phenotype.display(best);
    
    if (showFitness) {
      setFitness();
      textSize(15);
      fill(0);
      textAlign(CENTER);
      text(fitness, phenotype.position.x, phenotype.position.y);
    }
  }//display()
  
  
  void run(){
    phenotype.run();
  }


  String toString() {
    String s = "";
    for (int i = 0; i < NUM_MOVES; i++) {
      s+= mags[i] + "\n";
    }
    s+= "fitness: " + fitness + "\n";
    return s;
  }//toString()

}//Individual
