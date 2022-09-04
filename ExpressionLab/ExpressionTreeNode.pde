class ExpressionTreeNode {

  static final int PART_SIZE = 40;
  static final color DEFAULT_C = 0xFFF08C28;

  static final int PLUS = 0;
  static final int MINUS = 1;
  static final int TIMES = 2;
  static final int DIVIDE = 3;
  static final int VAL = 4;



  PVector position;
  int psize;
  color c;

  float value;
  int type;

  ExpressionTreeNode left;
  ExpressionTreeNode right;

  ExpressionTreeNode(int x, int y, int t, int v) {
    position = new PVector(x, y);
    psize = PART_SIZE;
    left = null;
    right = null;
    c = DEFAULT_C;
    type = t;
    value = v;
  }//constructor


  /*======================================
    Returns true if (x, y) is inside the node
    as it is drawn to the screen.
  ======================================*/
  boolean contains(int x, int y) {
    float d = dist(x, y, this.position.x, this.position.y);
    if(d < psize){
      return true;
    }
    return false;
  }//contains


  /*======================================
    If the calling node is an operation, change
    the operation to the next one, use the order
      plus, minus, times, divide.
    If the calling node is a value:
      If the value is 0, set it to a random int [0, 100).
      If the value is not 0, set it to 0.
  ======================================*/
  void flipNode() {
    if(this.type != VAL){
      if(this.type == DIVIDE){
        this.type = PLUS;
      } else {
        type++;
      }
    } else {
      if(this.value == 0){
        value = random(100);
      } else {
        value = 0;
      }
    }
  }//filpNode


  void display() {
    if (left != null) {
      stroke(40, 200, 190);
      line(position.x, position.y, left.position.x, left.position.y);
    }
    if (right != null) {
      stroke(210, 50, 150);
      line(position.x, position.y, right.position.x, right.position.y);
    }
    noStroke();
    fill(c);
    circle(position.x, position.y, psize);
    fill(0);
    textSize(15);
    textAlign(CENTER, TOP);
    text(value, position.x, position.y);
    if (type != VAL) {
      char o = ' ';
      if (type == PLUS) {
        o = '+';
      }
      else if (type == MINUS) {
        o = '-';
      }
      else if (type == TIMES) {
        o = '*';
      }
      else if (type == DIVIDE) {
        o = '/';
      }
      textAlign(CENTER, BASELINE);
      text(o, position.x, position.y);
    }
  }//display

}//Orb
