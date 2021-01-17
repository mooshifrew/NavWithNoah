class BackgroundImage {
  PImage img;
  int stageNum;
  boolean resized;
  
  BackgroundImage(String fileLocation, int a) {
    img = loadImage(fileLocation);
    if (a!=0) {
      img.resize(width, height);     //if the image should not be fullscreen (the ark) then put value 0 for a
      resized =true;
  }else {resized = false; }   //resized boolean variable to make it display function more concise
    
    stageNum = a;
    
    
  }
  
  void displayBack() {
    if (resized==true) {  //resized images are set in the corner
      imageMode(CORNER);
      image(img, 0,0); 
    }      
  }

  void displayBack(int x, int y) {
    if (resized !=true) {
      tint(255,120);
      imageMode(CENTER);
      image(img,x,y);  //if not resized images are centered
    }
  }
 
 
}
  
  
  
  



  
 
