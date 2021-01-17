
//other-----------------------------------------------------------------------------------------
import processing.sound.*;
void settings() {  //makes it fullscreen
  fullScreen();
}

int stage;

//title variables-----------------------------------------------------------------------------------------
PImage startscreen;
PFont title;
SoundFile titlesound;

//stage1 variables-----------------------------------------------------------------------------------------
PImage noah1, noah2;
BackgroundImage s1bg, arkgrey;
Puzzle[] p = new Puzzle[7];
Score s1;
int loopPosition = 0;
int snappedPieces = 0;
int stage1score;

//stage2 variables-----------------------------------------------------------------------------------------
Sprite s;

PImage water, boat, rock, log, TRoof;
PImage[] whirlpool;
boolean up, down;
int counter;
Rock Rock1;
Rock Rock3;
Rock Rock5;
Rock Rock7;
Rock Rock9;
Rock Rock10;
Rock Rock11;
Rock Rock12;
Log Log1;
Log Log2;
Log Log3;
Log Log4;
Wpool whirlpool1;
Wpool whirlpool2;
Wpool whirlpool3;
boolean runonce;
float health = 100;
float MAX_HEALTH = 100;
float rectWidth = 500;

SoundFile file;
SoundFile crash;

//stage3 variables
BackgroundImage s2bg;

Bird  bird1, bird2;  //no branch is b1. with branch is b2
Button buttons;
boolean flying;
int flightCount;

Score s3score;
int stage3score;

int s3scoreaddition = 500;
boolean readytoleave;
boolean left;

//endscreen variables-----------------------------------------------------------------------------------------
float total_score; 
PImage endscreen;
PFont endtitle;


void setup() {
  //title setup-----------------------------------------------------------------------------------------

  stage = 1; //should be 1 

  startscreen = loadImage("data/startscreen.jpg");
  title = loadFont("data/AgencyFB-Bold-48.vlw");
  file = new SoundFile(this, "data/Age of War - Theme Soundtrack.mp3");
  titlesound = new SoundFile(this, "data/titlemusic.mp3");
  file.play();
  file.loop();

  //stage1 setup-----------------------------------------------------------------------------------------
  s1bg = new BackgroundImage("pictures/desertbackground1.jpg", 1);     //loading backgrounds
  arkgrey = new BackgroundImage("pictures/arknobackgrey.png", 0);


  //s1bg.displayBack();
  //arkgrey.displayBack(width/2, height/2);      //displaying background 1

  s1 = new Score(2000);


  for (int i=0; i<p.length; i++) { // generates puzzle pieces and loads images
    p[i] = new Puzzle(i);
  }

  //stage2 setup-----------------------------------------------------------------------------------------

  runonce = false;
  whirlpool = new PImage[9];
  for (int i = 0; i<9; i++) {
    whirlpool[i] = loadImage("data/whirlpool" +i+ ".png");
  }
  crash = new SoundFile(this, "data/18365_1464637302.mp3");
  file = new SoundFile(this, "data/Age of War - Theme Soundtrack.mp3");
  log = loadImage("data/oie_transparent (3).png");
  rock = loadImage("data/oie_transparent (2).png");
  water = loadImage("data/drawn-water-drop-ripple-drawing-323342-2329813.jpg");
  water.resize(width, height);
  boat = loadImage("data/oie_transparent.png");
  boat.resize(162, 97);
  s = new Sprite();
  Rock1 = new Rock();
  Rock3 = new Rock();
  Rock5 = new Rock();
  Rock7 = new Rock();
  Rock9 = new Rock();
  Rock10 = new Rock();
  Rock11 = new Rock();
  Rock12 = new Rock();
  Log1 = new Log();
  Log2 = new Log();
  Log3 = new Log();
  Log4 = new Log();
  whirlpool1 = new Wpool();
  whirlpool2 = new Wpool();
  whirlpool3 = new Wpool();



  //stage3 setup-----------------------------------------------------------------------------------------
  s2bg = new BackgroundImage("pictures/Arkwater1.jpg", 3);

  //s2bg.displayBack();

  readytoleave = false;
  left = false;
  flightCount= int(random(4));
  flying = true;

  bird1 = new Bird(1);
  bird2 = new Bird(2);

  buttons = new Button();

  s3score = new Score(1000);

  //endscreen setup-----------------------------------------------------------------------------------------
  endscreen = loadImage("data/noahs-ark-clipart.jpg");
  endtitle = loadFont("data/AgencyFB-Bold-48.vlw");


  //other-----------------------------------------------------------------------------------------
}



void draw() {
  //title------------------------------------------------------------------------------------------------
  if (stage==1) {
    image(startscreen, 0, 0, width, height);  
    textFont(title, 55);
    textAlign(CENTER);
    fill(0);
    text("Navigating With Noah", width/2, height*0.15);
    fill(0, 0, 0, 255-map(millis()%3000, 0, 3000, 0, 300));
    text("Press any key to start", width/2, height*0.8);
    if (keyPressed==true) {       //changes stage to 2
      titlesound.stop(); //stops music for title page
      stage = 2;
    }
  }
  //stage1----------------------------------------------------------------------------------------------------
  if (stage==2) {
    if (snappedPieces != 7) {

      s1bg.displayBack();
      arkgrey.displayBack(width/2, height/2);


      for (int a=0; a<p.length; a++) {
        if (loopPosition > 6) {
          loopPosition=0;
        }    //prevents loopposition reaching value 7

        if (p[loopPosition].click()) {            //move runs only if mousepressed but within move there is additional conditions to make it work
          //loopPosition = i;

          if (p[loopPosition]==p[a]) {      //if loopPosition and a are the same value then there is no risk of picking two pieces so code runs
            p[loopPosition].click();
            p[loopPosition].move();
            p[loopPosition].snap();
            p[loopPosition].display();
          } else {                           //if it is another value, priority goes to loop position and p[a] is not clicked so it cannot move
            p[loopPosition].click();
            p[a].notClicked();
            p[loopPosition].move();
            p[loopPosition].snap();
            p[loopPosition].display();
          }
        } else {
          loopPosition+=1;                //if loop position is not clicked, it increments by one to check a new piece
        }

        p[a].display();
      }


      //println(p[i].click());


      s1.incrementScore();
      s1.displayScore();


      if (loopPosition==6 && mousePressed == false) {
        loopPosition=0;
      }    //prevents loopPosition staying at 6. Resets to 0 so the sequence can keep happening IF the mouse is not pressed
    } else {
      s1.finalScore1();

      stage = 3; //should be 3

      //text(stage1score, float(width/2), float(height/2)); //this was just to display the final score in the middle but we probably wont need it
    } //this is how level switch happens
  }


  //stage2------------------------------------------------------------------------------------
  if (stage==3) {

    int x = frameCount % water.width + round(.1*counter);
    for (int i = -x; i < width; i += water.width) {
      copy(water, 0, 0, water.width, height, i, 0, water.width, height);    //makes background scroll
    }

    //displays boat
    s.update();
    s.display();
    // makes debris appear based on score
    //***************************************************\\

    Rock1.display();
    Rock1.update();

    if (counter>1000) {
      Log1.display();
      Log1.update();
    }

    if (counter>1800) {
      Rock3.display();
      Rock3.update();
    }

    if (counter>2500) {
      Log2.display();
      Log2.update();
    }

    if (counter>3000) {
      Rock5.display();
      Rock5.update();
    }

    if (counter>7500) {
      Log3.display();
      Log3.update();
    }

    if (counter>4000) {
      Rock7.display();
      Rock7.update();
    }

    if (counter>4500) {
      Log4.display();
      Log4.update();
    }

    if (counter>5000) {
      Rock9.display();
      Rock9.update();
    }

    if (counter>5500) {
      Rock10.display();
      Rock10.update();
    }

    if (counter>6000) {
      Rock11.display();
      Rock11.update();
    }

    if (counter>6500) {
      Rock12.display();
      Rock12.update();
    }

    if (counter>7000) {
      whirlpool3.update();
      whirlpool3.display();
    }

    if (counter>3500) {
      whirlpool2.update();
      whirlpool2.display();
    }

    if (counter>8000) {
      whirlpool1.update();
      whirlpool1.display();
    }
    //***************************************************\\

    //counter
    textFont(title, 30);
    fill(0);
    text( counter, width*.73, height*.06);
    counter++;
    //Health bar
    //***************************************************\\
    //make health change color
    if (health < 25)
    {
      fill(255, 0, 0);
    } else if (health < 50)
    {
      fill(255, 200, 0);
    } else
    {
      fill(0, 255, 0);
    }
    // Draw bar
    noStroke();
    float drawWidth = (health / MAX_HEALTH) * rectWidth;
    rect(width*.73, 5, drawWidth, 30);
    // Outline
    stroke(0);
    noFill();
    rect(width*.73, 5, rectWidth, 30);
    //***************************************************\\


    //collsion detction for rock 1
    //***************************************************\\
    if (round(dist(s.x, s.y, Rock1.xpos, Rock1.ypos))<110) {
      runonce = true;
    }
    if (runonce == true) {
      health -= 0.25;
      counter-= 0.25;
      runonce = false;
    }
    //***************************************************\\

    //collsion detction for rock 3
    //***************************************************\\
    if (round(dist(s.x, s.y, Rock3.xpos, Rock3.ypos))<110) {
      runonce = true;
    }
    if (runonce == true) {
      health -= 0.25;
      counter-= 0.25;
      runonce = false;
    }
    //***************************************************\\

    //collsion detction for rock 5
    //***************************************************\\
    if (round(dist(s.x, s.y, Rock5.xpos, Rock5.ypos))<110) {
      runonce = true;
    }
    if (runonce == true) {
      health -= 0.25;
      counter-= 0.25;
      runonce = false;
    }
    //***************************************************\\

    //collsion detction for rock 7
    //***************************************************\\
    if (round(dist(s.x, s.y, Rock7.xpos, Rock7.ypos))<110) {
      runonce = true;
    }
    if (runonce == true) {
      health -= 0.25;
      counter-= 0.25;
      runonce = false;
    }
    //***************************************************\\

    //collsion detction for rock 9
    //***************************************************\\
    if (round(dist(s.x, s.y, Rock9.xpos, Rock9.ypos))<110) {
      runonce = true;
    }
    if (runonce == true) {
      health -= 0.25;
      counter-= 0.25;
      runonce = false;
    }
    //***************************************************\\

    //collsion detction for rock 10
    //***************************************************\\
    if (round(dist(s.x, s.y, Rock10.xpos, Rock10.ypos))<110) {
      runonce = true;
    }
    if (runonce == true) {
      health -= 0.25;
      counter-= 0.25;
      runonce = false;
    }
    //***************************************************\\

    //collsion detction for rock 11
    //***************************************************\\
    if (round(dist(s.x, s.y, Rock11.xpos, Rock11.ypos))<110) {
      runonce = true;
    }
    if (runonce == true) {
      health -= 0.25;
      counter-= 0.25;
      runonce = false;
    }
    //***************************************************\\

    //collsion detction for rock 12
    //***************************************************\\
    if (round(dist(s.x, s.y, Rock12.xpos, Rock12.ypos))<110) {
      runonce = true;
    }
    if (runonce == true) {
      health -= 0.25;
      counter-= 0.25;
      runonce = false;
    }
    //***************************************************\\

    //collsion detction for log 1
    //***************************************************\\


    if (round(dist(s.x, s.y, Log1.xpos, Log1.ypos))<120) {
      runonce = true;
    }
    if (runonce == true) {
      health -= 0.25;
      counter-= 0.25;
      runonce = false;
    }
    //***************************************************\\

    //collsion detction for log 2
    //***************************************************\\
    if (round(dist(s.x, s.y, Log2.xpos, Log2.ypos))<120) {
      runonce = true;
    }
    if (runonce == true) {
      health -= 0.25;
      counter-= 0.25;
      runonce = false;
    }
    //***************************************************\\

    //collsion detction for log 3
    //***************************************************\\
    if (round(dist(s.x, s.y, Log3.xpos, Log3.ypos))<120) {
      runonce = true;
    }
    if (runonce == true) {
      health -= 0.25;
      counter-= 0.25;
      runonce = false;
    }
    //***************************************************\\

    //collsion detction for log 4
    //***************************************************\\
    if (round(dist(s.x, s.y, Log4.xpos, Log4.ypos))<120) {
      runonce = true;
    }
    if (runonce == true) {
      health -= 0.25;
      counter-= 0.25;
      runonce = false;
    }
    //***************************************************\\

    //collsion detction for whirlpool 3
    //***************************************************\\
    if (round(dist(s.x, s.y, whirlpool3.xpos, whirlpool3.ypos))<140) {
      runonce = true;
    }
    if (runonce == true) {
      health -= 0.25;
      counter-= 0.25;
      runonce = false;
    }
    //***************************************************\\

    //collsion detction for whirlpool 2
    //***************************************************\\
    if (round(dist(s.x, s.y, whirlpool2.xpos, whirlpool2.ypos))<140) {
      runonce = true;
    }
    if (runonce == true) {
      health -= 0.25;
      counter-= 0.25;
      runonce = false;
    }
    //***************************************************\\

    //collsion detction for whirlpool 1
    //***************************************************\\
    if (round(dist(s.x, s.y, whirlpool1.xpos, whirlpool1.ypos))<140) {
      runonce = true;
    }
    if (runonce == true) {
      health -= 0.25;
      counter-= 0.25;
      runonce = false;
    }
    //***************************************************\\


    //What happens when you die
    if (health<=0) {
      //noLoop();
      stage=4; //should be 4 to advance
    }
  }

  //stage3-------------------------------------------------------------------------------------

  if (stage==4) {
    s2bg.displayBack();

    

    if (flightCount<5) {
      bird1.fly();
    } else if (flying) {
      bird2.fly();
      readytoleave = true;
    }
    
    buttons.decision(); //setting stage to 5 if they leave is within this function. also, condition of flying being false is within
    
  }
  //endscreen-----------------------------------------------------------------------------------
  total_score = stage1score + counter + stage3score;

  if (stage==5) {
    image(endscreen, 0, 0, width, height);
    textFont(endtitle, 55);
    textAlign(CENTER);
    fill(0);
    text("Thanks For Playing!", width/2, height*0.15);
    fill(0);
    text("Score:" + total_score, width/2, height*0.3);
    fill(0, 0, 0, 255-map(millis()%3000, 0, 3000, 0, 300));
    text("Press any key to exit", width/2, height*0.8);
    if (keyPressed == true) {
      exit();
    }
  }
}


//spacebar functions---------------------------------------------------------------------------


void keyPressed() {
  if (keyCode==38) {
    up = true;
  } else if (keyCode==40) {
    down = true;
  }
}

void keyReleased() {
  if (keyCode==38) {
    up = false;
  } else if (keyCode==40) {
    down = false;
  }
}
