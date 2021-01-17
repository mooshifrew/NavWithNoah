class Score {
  int x;
  int y;
  int points;
  String title; 
  boolean levelFailed;
  PFont titlefont;

  
  Score(int a) { //defining where the score counter will sit. a) can be useful if other stages use the same class but have different values
  
   x = width/2 -50;
   y = 150;
   
   levelFailed = false;
   
   titlefont = loadFont("data/AgencyFB-Bold-48.vlw");
   
   points = a;
   title= "POINTS"; 
   
    
  }
 
  void s3add() {
    points += s3scoreaddition;
    }
    
  void s3sub() {
    points -= s3scoreaddition;
  }
  
  
  void displayScore(){
    textFont(titlefont,55);
    textAlign(CENTER);
    fill(0);
    stroke(5);
    text(title, float(x), float(y)); 
    text(str(points), float(x), float(y+100));
  }
  
  void incrementScore() {
    if (points>0) {
      points+= -1;
    }if (points==0) {
      levelFailed =true;
    }
  
    
  }
  void finalScore1() {
    stage1score=points;
  }
  
  void finalScore3() {
    stage3score = points;
  }
   
  

}
