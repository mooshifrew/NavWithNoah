class Sprite {
  float x, y, w, h;
  float speedX, speedY;
  Sprite() {
    x=100;
    y=100;
    w=32;
    h=32;
    speedX=0;
    speedY=0;
  }
  void update() {
    if (up) {
      speedY=-2;
    } else if (down) {
      speedY=2;
    } else {
      speedX=0;
      speedY=0;
    } 
    x+=speedX;
    y+=speedY;
  }

  void display() {
    float a;
    a = height - height;
    imageMode(CORNER);
    image(boat, x, y);
    if (y+100 > height) {
      y = height - 100;
    }

    if (y < a) {
      y= a;
    }
  }
}
