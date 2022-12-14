/*=====================
  OrbList class

  The main strcutrual change between this
  class and the one developed in class is
  that this class will always have FixedOrb
  objects at front and back. Placeholder nodes
  like this are sometimes referred to as
  "Sentinel" nodes.

  Sentinel nodes are sometimes used in linked
  lists because they gaurantee that the list
  will never be empty. This removes the need
  for special cases in methods like addFront,
  append and remove.
  =====================*/
class OrbList {

  OrbNode front;
  OrbNode back;

  /*=====================
    Constructor

    Create FixedOrbs at (x0, y0) and (x1, y1).
    Set front to the orb at (x0, y0).
    Set back to the orb at (x1, y1).
    Connect front and back accordingly.
    =====================*/
  OrbList(int x0, int y0, int x1, int y1) {
    front = new FixedOrb(x0, y0);
    back = new FixedOrb(x1, y1);
    
    front.next = back;
    back.previous = front;
  }//constructor


  /*=====================
    addFront(int x, int y, boolean fixed)

    Create a new OrbNode at (x, y), if fixed
    is true, make that orb a FixedOrb.

    Add the new OrbNode to the front, AFTER
    the sentinel node (see explanation at the
    top of this file).
    =====================*/
  void addFront(int x, int y, boolean fixed) {
    
    OrbNode o;
    
    if(fixed){
      o = new FixedOrb(x, y);
    } else {
      o = new OrbNode(x, y);
    }
    
    o.next = front.next;
    front.next.previous = o;
    
    front.next = o;
    o.previous = front;
    
  }//addFront


  /*=====================
    append(int x, int y, boolean fixed)

    Create a new OrbNode at (x, y), if fixed
    is true, make that orb a FixedOrd.

    Add the new OrbNode to the back, BEFORE
    the sentinel node (see explanation at the
    top of this file).
    =====================*/
  void append(int x, int y, boolean fixed) {
    
    OrbNode o;
    
    if(fixed){
      o = new FixedOrb(x, y);
    } else {
      o = new OrbNode(x, y);
    }
    
    o.previous = back.previous;
    back.previous.next = o;
    
    back.previous = o;
    o.next = back;

  }//append


  /*=====================
    removeNode(OrbNode pn)

    Assume that pn is an OrbNode in this list.

    Remove pn from the list by changing the
    appropriate links.
    =====================*/
  void removeNode(OrbNode pn) {
    pn.next.previous = pn.previous;
    pn.previous.next = pn.next;
  }//removeNode


  /*=====================
    selectNode(int x, int y)

    If (x, y) is a position inside a NON
    SENTINEL node in this list (as defined
    by the constains()method in OrbNode),
    return a reference to that node.

    In all other cases, return null.
    =====================*/
  OrbNode selectNode(int x, int y) {
    
    OrbNode current = front.next;
    PVector pos = new PVector(x, y);
    
    while (current != back) {
      if(current.contains(pos)){
        return current;
      }
      current = current.next;
    }

    return null;
  }//selectNode
  
  
  OrbNode findNextNode(float x){
    
    OrbNode current = front.next;
    
    while (current != null) {
      if(current.position.x > x){
        return current;
      }
      current = current.next;
    }
    
    return back;
    
  }//findNextNode
  
  
  void insertBefore(OrbNode n, int x, int y, boolean fixed){
    OrbNode o;
    
    if(fixed){
      o = new FixedOrb(x, y);
    } else {
      o = new OrbNode(x, y);
    }
    
    n.previous.next = o;
    o.previous = n.previous;
    
    o.next = n;
    n.previous = o;
    
  }//insertBefore
  

/*=====================
  The methods below are exactly as they
  have been developed in class already.
  You do not need to modify them.
  =====================*/
  void display() {
    OrbNode current = front;
    while (current != null) {
      current.display();
      current = current.next;
    }
  }//display


  void applySprings() {
    OrbNode current = front;
    while (current != null) {
      current.applySpringForce();
      current = current.next;
    }
  }//applySprings


  void applyExternalForce(PVector force) {
    OrbNode current = front;
    while (current != null) {
      current.applyForce(force);
      current = current.next;
    }
  }//applyExternalForce


  void run() {
    OrbNode current = front;
    while (current != null) {
      current.run();
      current = current.next;
    }
  }//run


  String toString() {
    String s = "";
    OrbNode current = front;
    while (current != null) {
      s+= current;
      current = current.next;
    }
    return s;
  }//toString

}//ParticeList
