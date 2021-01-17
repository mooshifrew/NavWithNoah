class Rock {
  float xpos;
  float ypos;
  float xspeed;

  Rock() {
    xpos = width+140;
    ypos = int(random(height));
    xspeed = 1;
  }  

  void display() {
    
    image(rock, xpos, ypos);
    if (xpos<width-width-130) {
      ypos = int(random(height));
    }
  }

  void update() {  
    xspeed = 1 + .001*counter;
    xpos = xpos + -xspeed;
    if (xpos < width-width-140) {
      xpos = width + 150;
    }
  }
}
