class Bird {
  int x;
  float y;
  int xspeed;
  int currentFrame = 0;
  int frameslow = 0;
  int frames = 6;
  PImage[] pics;
  
  
  Bird(int a) {
    x=0;
    y= height*0.25;
    xspeed = 20;
    pics = new PImage[6];
      for (int i=0; i<frames; i++) {
        if (a==1) {
        pics[i] = loadImage("dovestuff/nobranch/dove" + str(i+1) +".png");
        }
        if (a==2) {
          pics[i] = loadImage("dovestuff/wbranch/dovebranch" + str(i+1) + ".png");
      }
   
    
    }
  } 
  
  void fly() {
    if (flying==true) {
    frameslow++;
    
    if (frameslow==6) {frameslow=0;}
    if (frameslow%5==0) {
    currentFrame++;
    frameslow=0;
    }
    if (currentFrame==6) {currentFrame = 0;}
    
    imageMode(CENTER);
    
    
      
    if (x<width) {
    image(pics[currentFrame], x, y);
    x+= xspeed;
    }else {
    flying=false;         //when bird goes off screen then the bird stops flying
    flightCount++;
    x=0; 
    
      
    }
    
     
    }
  } 
  
  
  
  
  
  
  
  
}
