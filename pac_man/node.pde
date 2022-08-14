class Node {
  
  int x, y;
  String num;
  
  Node up, down, left, right;
  
  Node(int xPos, int yPos, String s){
    x = xPos;
    y = yPos;
    num = s;
  }//constructor
  
  
  void display(){
    fill(255, 0, 0);
    circle(x, y, 15);
    fill(255);
    text(num, x - 3, y + 5);
  }//display
  
  
  boolean contains(float xPos, float yPos){
    float d = dist(x, y, xPos, yPos);
    return d == 0;
  }
  
}//Node
