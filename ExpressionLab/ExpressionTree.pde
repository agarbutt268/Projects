class ExpressionTree {

  static final int Y_SPACE = 75;
  static final int PRE = 0;
  static final int POST = 1;
  static final int IN = 2;


  ExpressionTreeNode root;
  int totalLevels;


  ExpressionTree(int x, int y, int numLevels) {
    totalLevels = numLevels;
    root = makeTree(x, y, numLevels);
    populateTree(root);
  }//constructor


  ExpressionTreeNode makeTree(int x, int y, int numLevels) {
    if (numLevels == 0) {
      return null;
    }

    ExpressionTreeNode newNode = new ExpressionTreeNode(x, y, 0, 0);

    float xoffset = width / (pow(2, totalLevels - numLevels+2));
    int leftX = int(x + xoffset * -1);
    int rightX = int(x + xoffset);
    int newY = y + Y_SPACE;

    if ( random(totalLevels) >= (totalLevels - numLevels)) {
      newNode.left = makeTree(leftX, newY, numLevels-1);
      newNode.right = makeTree(rightX, newY, numLevels-1);
    }
    return newNode;
  }//makeTree


  void populateTree(ExpressionTreeNode current) {
    if (current.left == null && current.right == null) {
      current.type = ExpressionTreeNode.VAL;
      current.value = int(random(100));
      //current.value = 0;
    }
    else {
      current.type = int(random(4));
      populateTree(current.left);
      populateTree(current.right);
    }
  }//populateTree


  /*======================================
    Recursively evaluate the expression tree rooted at current.

    Return the result of fully evaluating the expression tree.

    If current is an operator node, set it to the result of evaluating
    it on its subtrees.

    If the result of an operation is either Infinity or Not A Number,
    set the color of current to red and return Not A Number.

    You can test for infnity with Float.isInfinite(x).
    You can test of Not A Number with Float.isNaN(x).

    Float.NaN is a special constant that represents Not A Number.
  ======================================*/
  float evaluate(ExpressionTreeNode current) {
    
    if (current != null) {
        
        if (current.type == ExpressionTreeNode.PLUS) {
          current.value = evaluate(current.left) + evaluate(current.right);
        }
        else if (current.type == ExpressionTreeNode.MINUS) {
          current.value = evaluate(current.left) - evaluate(current.right);
        }
        else if (current.type == ExpressionTreeNode.TIMES) {
          current.value = evaluate(current.left) * evaluate(current.right);
        }
        else if (current.type == ExpressionTreeNode.DIVIDE) {
          current.value = evaluate(current.left) / evaluate(current.right);
        }
        
        if(Float.isInfinite(current.value) || Float.isNaN(current.value)){
          current.c = color(255, 0, 0);
          return Float.NaN;
        } else {
          current.c = 0xFFF08C28;
        }
        
        return current.value;
    }
    
    return 0;
    
  }//evaluate
  void evaluate() {
    evaluate(root);
  }//evaluate wrapper


  /*======================================
    Returns the node located at position (x, y),
    or null if no such node exists.
  ======================================*/
 ExpressionTreeNode findNode(ExpressionTreeNode current, int x, int y) {
   if (current != null) {
     if(current.contains(x, y)){
       return current;
     } else if(findNode(current.left, x, y) != null){
       return findNode(current.left, x, y);
     } else {
       return findNode(current.right, x, y);
     }
   }
   return null;
 }//findNode
 ExpressionTreeNode findNode(int x, int y) {
    return findNode(root, x, y);
 }//findNode wrapper



  String traverse(int type) {
    if (type == IN)
      return inOrder(root);
    return "";
  }//traverse


  /*======================================
    Returns an inOrder traversal of the tree rooted at
    current. The resulting string should be a valid infix expression,
    and thus should contain ()s where appropriate.

    e.g. ((67.0 / (43.0 + 54.0)) * (39.0 * 62.0))
  ======================================*/
  String inOrder(ExpressionTreeNode current) {
    String s = "";
    
    if (current != null) {
      
      if(current.left != null || current.right != null){
        s += "(";
      }
      
      s += inOrder(current.left);
      
      if (current.type != 4) { 
        
        if (current.type == 0) {
          s += " + ";
        } else if (current.type == 1) {
          s += " - ";
        } else if (current.type == 2) {
          s += " * ";
        } else if (current.type == 3) {
          s += " / ";
        }
        
      } else {
        s += current.value;
      }
      
      s += inOrder(current.right);
      if(current.left != null || current.right != null){
        s += ")";
      }
    }
    
    return s;
  }//inOrder
  

  void display(ExpressionTreeNode current) {
    if (current != null) {
      current.display();
      display(current.left);
      display(current.right);
    }
  }//display
  void display() {
    display(root);
  }//display wrapper

}//OrbTree
