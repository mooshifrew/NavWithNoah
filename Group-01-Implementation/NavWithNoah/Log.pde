class Log {
  float xpos;
  float ypos;
  float xspeed;

  Log() {
    xpos = width+140;
    ypos = int(random(height));
    xspeed = 1;
  }  

  void display() {
    
    image(log, xpos, ypos);
    if (xpos<width-width-254) {
      ypos = int(random(height));
    }
  }

  void update() {  
    xspeed = 1 + .001*counter;
    xpos = xpos + -xspeed;
    if (xpos < width-width-260) {
      xpos = width + 254;
    }
  }
}
