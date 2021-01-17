class Puzzle {
  int x;
  int y;
  PImage piece;
  boolean clicked;
  boolean snapped;
  int snapX;
  int snapY;
  
  
  //creates piece. Random location and loads the corrosponding image with correct proportions
  Puzzle(int a) {
    x = int(random(width));
    y = int(random(height));
    piece = loadImage("puzzlepieces/piece" + str(a+1) + ".png");
    
    clicked = false;
    snapped = false; 
    
    if ( a == 0) {    //setting snap variables for each image
      snapX=width/2 + 133;
      snapY=height/2 + 101;
    }
    if ( a == 1) {
      snapX=width/2 - 18;
      snapY=height/2 + 73;
    }
    if (a==2) {
      snapX=width/2 - 122;
      snapY=height/2 + 98;
    }
    if (a==3) {
      snapX=width/2 - 178;
      snapY=height/2 - 31;
    }
    if (a==4) {
      snapX=width/2 - 21;
      snapY=height/2 - 32;
    }
    if (a==5) {
      snapX=width/2 + 157;
      snapY=height/2 - 5;
    }
    if (a==6) {
      snapX=width/2 - 19;
      snapY=height/2 -111;
    }
    
    
  }
  
  void display() {
    imageMode(CENTER);
    tint(255,255);
    image(piece, x, y);
  }
  
  void snap() {
    if (x<snapX+5 && x>snapX-5 && y<snapY+5 && y>snapY-5) {
      x=snapX;
      y=snapY;
      snapped=true;
      snappedPieces+=1; 
      //add sound effect hear for snapping the puzzle piece
    } 
  }
  
   
    boolean click() {
      if (mousePressed==true && snapped==false && mouseX<= x + piece.width && mouseX>= x - piece.width && mouseY<=y+piece.height && mouseY>=y-piece.height) {
        clicked=true;
        return true;
    }else {
    clicked=false;
    return false;
  }
    
    
    }
    
    boolean notClicked() {
      clicked=false;
      return false;
    }
      
    
    
  
  void move() {
    if (mousePressed == true && clicked==true && snapped==false) { //if mouse is over the puzzle piece and pressed and it has not snapped
      
      x = mouseX;
      y= mouseY;
     
      
    }
    
    
  }
    
 
    
}
  
  
 
  
  
   
  
