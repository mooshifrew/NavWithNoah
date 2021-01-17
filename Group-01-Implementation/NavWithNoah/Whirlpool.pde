class Wpool {
  float xpos;
  float ypos;
  float xspeed;
  int currentFrame;
  int frames =8;

  Wpool() {
    xpos = width-140;
    ypos = int(random(height));
    xspeed = 1;
    currentFrame = 0;
  }  


  void display() {
    image(whirlpool[currentFrame], xpos, ypos);
    if (xpos<width-width-230) {
      ypos = int(random(height));
    }
  }

  void update() {  
    if (currentFrame==frames) {
      currentFrame = 0;
    }

    if (frameCount % 4 == 0) {
      currentFrame++;
    }
    
    xspeed = 1 + .001*counter;
    xpos = xpos + -xspeed;
    if (xpos < width-width-235) {
      xpos = width + 150;
    }
  }
}
