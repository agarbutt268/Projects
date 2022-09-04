ExpressionTree fir;


void setup() {
  size(800, 400);
  background(200);

  fir = new ExpressionTree(400, 20, 5);
  fir.evaluate();
  fir.display();

  println(fir.traverse(ExpressionTree.IN));
}//setup


void draw() {
  background(200);
  fir.display();
}//draw


void mousePressed() {
  ExpressionTreeNode selected = fir.findNode(int(mouseX), int(mouseY));
  if (selected != null) {
    selected.flipNode();
    fir.evaluate();
    println(fir.traverse(ExpressionTree.IN));
  }
}//mousePressed
