class Button {
   PFont font;
   String stay;
   String leave;
  
    Button() {
    font = loadFont("AgencyFB-Bold-48.vlw");
    stay = "STAY";
    leave = "LEAVE";  
  }
  
  void decision() {
    if (flying==false) {
    textFont(font,55);
    textAlign(CENTER);
    fill(0);
    stroke(5);
    text(stay, width*0.20, height*0.7);
    text(leave, width*0.80, height*0.7);
    
    
    if (mousePressed==true) {
      if (mouseX<=width*0.4) {     //if they select stay
        flying = true;
        if (readytoleave) {
          if (s3score.points>0) {
            s3score.s3sub();          //subtract points
          }
        } else {
          s3score.s3add();         //add points
        }
        
      }
      if (mouseX>=width*0.6) {      // if they select leave
        if (readytoleave==true) {
          left = true;
          s3score.s3add();
          s3score.finalScore3();
          stage = 5;
          //initiate end of level
        } else {
          s3score.s3sub();  //lose points
          flying = true;
        }
        
        
      }
      
      
      
    }
    
    
    }
    
  }
  
  
  
  
  
  
  
}
