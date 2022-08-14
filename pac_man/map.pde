class NodeMap {
  
  ArrayList<Node> nodes = new ArrayList<Node>();
  ArrayList<Pellet> pellets = new ArrayList<Pellet>();
  
  
  
  NodeMap(){
    
    nodes.add(new Node(40, 470, "0"));
    nodes.add(new Node(40, 370, "1"));
    nodes.add(new Node(130, 370, "2"));
    nodes.add(new Node(130, 310, "3"));
    nodes.add(new Node(130, 250, "4"));
    nodes.add(new Node(130, 190, "5"));
    nodes.add(new Node(130, 130, "6"));
    nodes.add(new Node(130, 30, "7"));
    nodes.add(new Node(40, 30, "8"));
    nodes.add(new Node(250, 30, "9"));
    nodes.add(new Node(550, 30, "10"));
    nodes.add(new Node(670, 30, "11"));
    nodes.add(new Node(760, 30, "12"));
    nodes.add(new Node(190, 130, "13"));
    nodes.add(new Node(190, 90, "14"));
    nodes.add(new Node(250, 90, "15"));
    nodes.add(new Node(310, 90, "16"));
    nodes.add(new Node(490, 90, "17"));
    nodes.add(new Node(550, 90, "18"));
    nodes.add(new Node(610, 90, "19"));
    nodes.add(new Node(610, 130, "20"));
    nodes.add(new Node(670, 130, "21"));
    nodes.add(new Node(760, 130, "22"));
    nodes.add(new Node(250, 190, "23"));
    nodes.add(new Node(190, 250, "24"));
    nodes.add(new Node(250, 310, "25"));
    nodes.add(new Node(190, 370, "26"));
    nodes.add(new Node(190, 410, "27"));
    nodes.add(new Node(250, 410, "28"));
    nodes.add(new Node(310, 410, "29"));
    nodes.add(new Node(310, 270, "30"));
    nodes.add(new Node(310, 210, "31"));
    nodes.add(new Node(490, 210, "32"));
    nodes.add(new Node(370, 270, "33"));
    nodes.add(new Node(370, 350, "34"));
    nodes.add(new Node(430, 350, "35")); 
    nodes.add(new Node(430, 270, "36"));
    nodes.add(new Node(490, 270, "37"));
    nodes.add(new Node(490, 410, "38"));
    nodes.add(new Node(550, 410, "39"));
    nodes.add(new Node(550, 310, "40"));
    nodes.add(new Node(550, 190, "41"));
    nodes.add(new Node(670, 190, "42"));
    nodes.add(new Node(670, 310, "43"));
    nodes.add(new Node(610, 410, "44"));
    nodes.add(new Node(610, 370, "45"));
    nodes.add(new Node(670, 370, "46"));
    nodes.add(new Node(760, 370, "47"));
    nodes.add(new Node(130, 470, "48"));
    nodes.add(new Node(250, 470, "49"));
    nodes.add(new Node(550, 470, "50"));
    nodes.add(new Node(670, 470, "51"));
    nodes.add(new Node(760, 470, "52"));
    nodes.add(new Node(670, 250, "53"));
    nodes.add(new Node(610, 250, "54"));
    nodes.add(new Node(40, 130, "55"));
    
    
    nodes.get(0).up = nodes.get(1);
    nodes.get(0).right = nodes.get(48);
    
    nodes.get(1).right = nodes.get(2);
    nodes.get(1).down = nodes.get(0);
    
    nodes.get(2).up = nodes.get(3);
    nodes.get(2).right = nodes.get(26);
    nodes.get(2).down = nodes.get(48);
    nodes.get(2).left = nodes.get(1);
    
    nodes.get(3).up = nodes.get(4);
    nodes.get(3).right = nodes.get(25);
    nodes.get(3).down = nodes.get(2);
    
    nodes.get(4).up = nodes.get(5);
    nodes.get(4).down = nodes.get(3);
    nodes.get(4).left = nodes.get(53);
    
    nodes.get(5).up = nodes.get(6);
    nodes.get(5).right = nodes.get(23);
    nodes.get(5).down = nodes.get(4);
    
    nodes.get(6).up = nodes.get(7);
    nodes.get(6).right = nodes.get(13);
    nodes.get(6).down = nodes.get(5);
    nodes.get(6).left = nodes.get(55);
    
    nodes.get(7).right = nodes.get(9);
    nodes.get(7).down = nodes.get(6);
    nodes.get(7).left = nodes.get(8);
    
    nodes.get(8).right = nodes.get(7);
    nodes.get(8).down = nodes.get(55);
   
    nodes.get(9).right = nodes.get(10);
    nodes.get(9).down = nodes.get(15);
    nodes.get(9).left = nodes.get(7);
    
    nodes.get(10).right = nodes.get(11);
    nodes.get(10).down = nodes.get(18);
    nodes.get(10).left = nodes.get(9);
    
    nodes.get(11).right = nodes.get(12);
    nodes.get(11).down = nodes.get(21);
    nodes.get(11).left = nodes.get(10);
    
    nodes.get(12).down = nodes.get(22);
    nodes.get(12).left = nodes.get(11);
    
    nodes.get(13).up = nodes.get(14);
    nodes.get(13).left = nodes.get(6);
    
    nodes.get(14).right = nodes.get(15);
    nodes.get(14).down = nodes.get(13);
    
    nodes.get(15).up = nodes.get(9);
    nodes.get(15).right = nodes.get(16);
    nodes.get(15).down = nodes.get(23);
    nodes.get(15).left = nodes.get(14);
    
    nodes.get(16).right = nodes.get(17);
    nodes.get(16).down = nodes.get(31);
    nodes.get(16).left = nodes.get(15);
    
    nodes.get(17).right = nodes.get(18);
    nodes.get(17).down = nodes.get(32);
    nodes.get(17).left = nodes.get(16);
    
    nodes.get(18).up = nodes.get(10);
    nodes.get(18).right = nodes.get(19);
    nodes.get(18).down = nodes.get(41);
    nodes.get(18).left = nodes.get(17);
    
    nodes.get(19).down = nodes.get(20);
    nodes.get(19).left = nodes.get(18);
    
    nodes.get(20).up = nodes.get(19);
    nodes.get(20).right = nodes.get(21);
    
    nodes.get(21).up = nodes.get(11);
    nodes.get(21).right = nodes.get(22);
    nodes.get(21).down = nodes.get(42);
    nodes.get(21).left = nodes.get(20);
    
    nodes.get(22).up = nodes.get(12);
    nodes.get(22).left = nodes.get(21);
    
    nodes.get(23).up = nodes.get(15);
    nodes.get(23).down = nodes.get(25);
    nodes.get(23).left = nodes.get(5);
    
    nodes.get(25).up = nodes.get(23);
    nodes.get(25).down = nodes.get(28);
    nodes.get(25).left = nodes.get(3);
   
    nodes.get(26).down = nodes.get(27);
    nodes.get(26).left = nodes.get(2);
    
    nodes.get(27).up = nodes.get(26);
    nodes.get(27).right = nodes.get(28);
    
    nodes.get(28).up = nodes.get(25);
    nodes.get(28).right = nodes.get(29);
    nodes.get(28).down = nodes.get(49);
    nodes.get(28).left = nodes.get(27);
    
    nodes.get(29).up = nodes.get(30);
    nodes.get(29).right = nodes.get(38);
    nodes.get(29).left = nodes.get(28);
    
    nodes.get(30).up = nodes.get(31);
    nodes.get(30).right = nodes.get(33);
    nodes.get(30).down = nodes.get(29);
    
    nodes.get(31).up = nodes.get(16);
    nodes.get(31).right = nodes.get(32);
    nodes.get(31).down = nodes.get(30);
    
    nodes.get(32).up = nodes.get(17);
    nodes.get(32).down = nodes.get(37);
    nodes.get(32).left = nodes.get(31);
    
    nodes.get(33).down = nodes.get(34);
    nodes.get(33).left = nodes.get(30);
    
    nodes.get(34).up = nodes.get(33);
    nodes.get(34).right = nodes.get(35);
    
    nodes.get(35).up = nodes.get(36);
    nodes.get(35).left = nodes.get(34);
    
    nodes.get(36).right = nodes.get(37);
    nodes.get(36).down = nodes.get(35);
    
    nodes.get(37).up = nodes.get(32);
    nodes.get(37).left = nodes.get(36);
    nodes.get(37).down = nodes.get(38);
    
    nodes.get(38).up = nodes.get(37);
    nodes.get(38).right = nodes.get(39);
    nodes.get(38).left = nodes.get(29);
    
    nodes.get(39).up = nodes.get(40);
    nodes.get(39).right = nodes.get(44);
    nodes.get(39).down = nodes.get(50);
    nodes.get(39).left = nodes.get(38);
    
    nodes.get(40).up = nodes.get(41);
    nodes.get(40).right = nodes.get(43);
    nodes.get(40).down = nodes.get(39);
    
    nodes.get(41).up = nodes.get(18);
    nodes.get(41).right = nodes.get(42);
    nodes.get(41).down = nodes.get(40);
    
    nodes.get(42).up = nodes.get(21);
    nodes.get(42).down = nodes.get(53);
    nodes.get(42).left = nodes.get(41);
    
    nodes.get(43).up = nodes.get(53);
    nodes.get(43).down = nodes.get(46);
    nodes.get(43).left = nodes.get(40);
    
    nodes.get(44).up = nodes.get(45);
    nodes.get(44).left = nodes.get(39);
    
    nodes.get(45).right = nodes.get(46);
    nodes.get(45).down = nodes.get(44);
    
    nodes.get(46).up = nodes.get(43);
    nodes.get(46).right = nodes.get(47);
    nodes.get(46).down = nodes.get(51);
    nodes.get(46).left = nodes.get(45);
    
    nodes.get(47).down = nodes.get(52);
    nodes.get(47).left = nodes.get(46);
    
    nodes.get(48).up = nodes.get(2);
    nodes.get(48).right = nodes.get(49);
    nodes.get(48).left = nodes.get(0);
    
    nodes.get(49).up = nodes.get(28);
    nodes.get(49).right = nodes.get(50);
    nodes.get(49).left = nodes.get(48);
    
    nodes.get(50).up = nodes.get(39);
    nodes.get(50).right = nodes.get(51);
    nodes.get(50).left = nodes.get(49);
    
    nodes.get(51).up = nodes.get(46);
    nodes.get(51).right = nodes.get(52);
    nodes.get(51).left = nodes.get(50);
    
    nodes.get(52).up = nodes.get(47);
    nodes.get(52).left = nodes.get(51);
    
    nodes.get(53).up = nodes.get(42);
    nodes.get(53).right = nodes.get(4);
    nodes.get(53).down = nodes.get(43);
    
    nodes.get(55).up = nodes.get(8);
    nodes.get(55).right = nodes.get(6);
  }//constructor
  
  
  Node atNode(float x, float y){
    for(Node n: nodes){
      if(n.contains(x, y)){
        return n;
      }
    }
    
    return null;
  }//atNode
  
  
  void display(){
    for(Node n: nodes){
      n.display();
    }
  }//display
  
  
  void drawMap(){
    stroke(#2E02F7);
    fill(0);
    strokeWeight(4);
    
    //outer box
    beginShape();
    vertex(20, 10);
    vertex(780, 10);
    vertex(780, 150);
    vertex(690, 150);
    vertex(690, 210);
    vertex(690, 230);
    vertex(810, 230);
    vertex(810, 270);
    vertex(690, 270);
    vertex(690, 350);
    vertex(780, 350);
    vertex(780, 490);
    vertex(20, 490);
    vertex(20, 350);
    vertex(110, 350);
    vertex(110, 270);
    vertex(-10, 270);
    vertex(-10, 230);
    vertex(110, 230);
    vertex(110, 210);
    vertex(110, 150);
    vertex(20, 150);
    endShape(CLOSE);
    
    //ghost box
    rect(330, 110, 140, 80);
    
    //T-shaped thingy
    beginShape();
    vertex(330, 230);
    vertex(470, 230);
    vertex(470, 250);
    vertex(410, 250);
    vertex(410, 330);
    vertex(390, 330);
    vertex(390, 250);
    vertex(330, 250);
    endShape(CLOSE);
    
    //U-shaped thingy
    beginShape();
    vertex(450, 290);
    vertex(450, 370);
    vertex(350, 370);
    vertex(350, 290);
    vertex(330, 290);
    vertex(330, 390);
    vertex(470, 390);
    vertex(470, 290);
    endShape(CLOSE);
    
    //left-central rectangle
    rect(270, 110, 20, 280, 10);
    
    //right central rectangle
    rect(510, 110, 20, 280, 10);
    
    //bottom rectangle
    rect(270, 430, 260, 20, 10);
    
    //top rectangle
    rect(270, 50, 260, 20, 10);
    
    //L-shaped thingys bottom right
    beginShape();
    vertex(570, 430);
    vertex(570, 450);
    vertex(650, 450);
    vertex(650, 390);
    vertex(630, 390);
    vertex(630, 430);
    endShape(CLOSE);
    
    beginShape();
    vertex(570, 390);
    vertex(590, 390);
    vertex(590, 350);
    vertex(650, 350);
    vertex(650, 330);
    vertex(570, 330);
    endShape(CLOSE);
    
    //rectangle thingy right
    rect(570, 210, 80, 80, 10);
    
    //L-shaped thingys top right
    beginShape();
    vertex(570, 110);
    vertex(570, 170);
    vertex(650, 170);
    vertex(650, 150);
    vertex(590, 150);
    vertex(590, 110);
    endShape(CLOSE);
    
    beginShape();
    vertex(570, 70);
    vertex(570, 50);
    vertex(650, 50);
    vertex(650, 110);
    vertex(630, 110);
    vertex(630, 70);
    endShape(CLOSE);
    
    //rectangle bottom right
    rect(690, 390, 50, 60, 10);
    
    //rectangle top right
    rect(690, 50, 50, 60, 10);
    
    //L-shaped thingys bottom left
    beginShape();
    vertex(230, 430);
    vertex(230, 450);
    vertex(150, 450);
    vertex(150, 390);
    vertex(170, 390);
    vertex(170, 430);
    endShape(CLOSE);
    
    beginShape();
    vertex(150, 330);
    vertex(150, 350);
    vertex(210, 350);
    vertex(210, 390);  
    vertex(230, 390);
    vertex(230, 330);
    endShape(CLOSE);
    
    //C-shaped thing
    rect(150, 210, 80, 80, 10);
    
    //L-shaped thingys top-left
    beginShape();
    vertex(230, 110);
    vertex(230, 170);
    vertex(150, 170);
    vertex(150, 150);
    vertex(210, 150);
    vertex(210, 110);
    endShape(CLOSE);
    
    beginShape();
    vertex(230, 70);
    vertex(230, 50);
    vertex(150, 50);
    vertex(150, 110);
    vertex(170, 110);
    vertex(170, 70);
    endShape(CLOSE);
    
    //bottom-left rectangle
    rect(60, 390 , 50, 60, 10);
    
    //top-left rectangle
    rect(60, 50, 50, 60, 10);
    
    noStroke();
    
  }//drawMap
  
  
  void createPellets(){
    for(int x = 70; x <= 740; x += 20){
      pellets.add(new Pellet(x, 30, Pellet.REGULAR));
      pellets.add(new Pellet(x, 470, Pellet.REGULAR));
    }
    
    
    for(int x = 270; x <= 530; x += 20){
      pellets.add(new Pellet(x, 90, Pellet.REGULAR));
      pellets.add(new Pellet(x, 410, Pellet.REGULAR));
    }
    
    for(int x = 190; x <= 230; x += 20){
      pellets.add(new Pellet(x, 90, Pellet.REGULAR));
    }
    
    for(int x = 570; x <= 610; x += 20){
      pellets.add(new Pellet(x, 90, Pellet.REGULAR));
    }
    
    for(int x = 190; x <= 230; x += 20){
      pellets.add(new Pellet(x, 410, Pellet.REGULAR));
    }
    
    for(int x = 570; x <= 610; x += 20){
      pellets.add(new Pellet(x, 410, Pellet.REGULAR));
    }
    
        
    
    for(int x = 70; x <= 110; x += 20){
      pellets.add(new Pellet(x, 130, Pellet.REGULAR));
      pellets.add(new Pellet(x, 370, Pellet.REGULAR));
    }
    
    for(int x = 150; x <= 190; x += 20){
      pellets.add(new Pellet(x, 130, Pellet.REGULAR));
      pellets.add(new Pellet(x, 370, Pellet.REGULAR));
    }
    
    for(int x = 150; x <= 230; x += 20){
      pellets.add(new Pellet(x, 190, Pellet.REGULAR));
      pellets.add(new Pellet(x, 310, Pellet.REGULAR));
    }
    
    
    pellets.add(new Pellet(190, 110, Pellet.REGULAR));
    pellets.add(new Pellet(190, 390, Pellet.REGULAR));
    
    
     for(int x = 610; x <= 650; x += 20){
      pellets.add(new Pellet(x, 130, Pellet.REGULAR));
      pellets.add(new Pellet(x, 370, Pellet.REGULAR));
    }
    
    for(int x = 690; x <= 740; x += 20){
      pellets.add(new Pellet(x, 130, Pellet.REGULAR));
      pellets.add(new Pellet(x, 370, Pellet.REGULAR));
    }
    
    for(int x = 570; x <= 660; x += 20){
      pellets.add(new Pellet(x, 190, Pellet.REGULAR));
      pellets.add(new Pellet(x, 310, Pellet.REGULAR));
    }
    
    
    pellets.add(new Pellet(610, 110, Pellet.REGULAR));
    pellets.add(new Pellet(610, 390, Pellet.REGULAR));
    
    for(int x = 330; x <= 350; x += 20){
      pellets.add(new Pellet(x, 270, Pellet.REGULAR));
    }
    
    for(int x = 450; x <= 470; x += 20){
      pellets.add(new Pellet(x, 270, Pellet.REGULAR));
    }
    
    for(int x = 390; x <= 410; x += 20){
      pellets.add(new Pellet(x, 350, Pellet.REGULAR));
    }
    
    
    for(int y = 50; y <= 450; y += 20){
      pellets.add(new Pellet(130, y, Pellet.REGULAR));
      pellets.add(new Pellet(250, y, Pellet.REGULAR));
      pellets.add(new Pellet(550, y, Pellet.REGULAR));
      pellets.add(new Pellet(670, y, Pellet.REGULAR));
    }
    
    for(int y = 50; y <= 130; y += 20){
      pellets.add(new Pellet(40, y, Pellet.REGULAR));
      pellets.add(new Pellet(760, y, Pellet.REGULAR));
    }
    
    for(int y = 370; y <= 450; y += 20){
      pellets.add(new Pellet(40, y, Pellet.REGULAR));
      pellets.add(new Pellet(760, y, Pellet.REGULAR));
    }
    
    for(int y = 270; y <= 390; y += 20){
      pellets.add(new Pellet(310, y, Pellet.REGULAR));
      pellets.add(new Pellet(490, y, Pellet.REGULAR));
    }
    
    for(int y = 270; y <= 350; y += 20){
      pellets.add(new Pellet(370, y, Pellet.REGULAR));
      pellets.add(new Pellet(430, y, Pellet.REGULAR));
    }
    
    pellets.add(new Pellet(40, 30, Pellet.SUPER));
    pellets.add(new Pellet(760, 30, Pellet.SUPER));
    pellets.add(new Pellet(40, 470, Pellet.SUPER));
    pellets.add(new Pellet(760, 470, Pellet.SUPER));
    
  }
  
  
  Pellet atPellet(float x, float y){
    for(int i = 0; i < pellets.size(); i++){
      
      Pellet p = pellets.get(i);
      
      if(p.contains(x, y)){
        return p;
      }
    }
    
    return null;
  }//atNode
  
  
  void drawPellets(){
    for(Pellet p : pellets){
      p.display();
    }
  }

}//NodeMap
