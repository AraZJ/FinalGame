//Main
//Has an ArrayList

Player me;
int gameScreen=0; //gamescreen value for switch statement
float accelLimit=9; //the highest amount the scroll speed can accelerate to before it's set to one number
float screenLimit=50; //the width of the blue rectangles on the left and right of the slope that mark its edge
float objectScaling=0.8; //scales all the objects bu the specified value
//int specialNumber; //is set as equal to the number of trees that have gone offscreen--is not really useful without levels
int ySpacing=200;
float screenScrollSpeed=0;
float scrollAccel=0.0008;
int numOfObjects=5;
int numOfSnowflakes=80;
//arrayLists
ArrayList<Coin> coinList = new ArrayList<Coin>(); //ArrayList of coins
ArrayList<Tree> treeList=new ArrayList<Tree>(); //ArrayList of trees
ArrayList<Snow> snowflakes=new ArrayList<Snow>(); //ArrayList of snow flakes
float letterColor=230; 
; //the color value for the snowflakes that determines all the values
char [] gameName={'S', 'l', 'i', 'p', 'p', 'e', 'r', 'y', ' ', 'S', 'l', 'o', 'p', 'e'}; //array of the characters that spell out the game name
boolean gameIsRunning;
boolean playerHitG;
float screenLeftEdge=0;
float screenRightEdge=900;
float myScreenHeight=600;
float skyY=0; //global y postition for the sky, used in the makeSky method

void setup() {
  size(900, 600);
  background(255);
  me = new Player();
  for (int s=0; s<numOfSnowflakes; s++) { 
    snowflakes.add(new Snow());
  }
  for (int r=0; r<numOfObjects; r++) { 
    treeList.add(new Tree(random(screenLimit, width-screenLimit), 300+ySpacing*r, objectScaling)); //r*spacingValue+slideOver // random(100, 300)
  }

  for (int r=0; r<numOfObjects; r++) { 
    coinList.add(new Coin(300+random(25, 600-25), objectScaling)); //r*spacingValue+slideOver //now can I use the local Coin varuables for this part? doesn't seem like it...
  }
}
void draw() {
  switch(gameScreen) {
  case 0: //menu
    background(180, 190, 200); //0, 180, 230
    //triangle that makes the ski slope
    fill(255);
    noStroke();
    triangle(0, 0, width, height, 0, height);
    fill(0);
    textAlign(CENTER);
    textSize(100);
    //for loop for displaying the game name, where each letter flashes a different color
    for (int n=0; n<gameName.length; n++) { //I hate myself
      fill(letterColor-random(100, letterColor), letterColor-random(20, letterColor), letterColor);
      text(gameName[n], 150+n*45, height/2);
    }
    //text settings for messages
    textSize(45);
    fill(0);
    text("To start playing, press SPACE", width/2, height/2+50); //instructions for starting game
    text("For tutorial, press 't'", width/2, height/2+100); //instructions for going to the tutorial
    //takes you to tutorial screen
    if (keyPressed&&key=='t') {
      gameScreen=1;
    }
    //takes you to game screen
    if (keyPressed&&key==' ') {
      gameScreen=2;
    } 
    //makes pretty snowflakes I wasted way too much time on
    snowStorm(numOfSnowflakes);
    break;
  case 1:
    background(255);
    fill(0);
    textSize(30);
    textAlign(CENTER);
    text("Use left and right keys to navigate.", width/2, 100);
    //animation for going left and right, then text saying try it! and once you do for a few seconds (make timer), move on ot the next one
    text("Try to collect coins and avoid trees.", width/2, 300);
    //same thign as oavobe commetn says
    textSize(17);
    text("Note: you only have to press a key once before you start sliding in that direction.", width/2, 500);
    text("press 'b' to go back to the menu", width/2, height/2+100);
    if (keyPressed&&key=='b') {
      gameScreen=0;
    }
    break;
    //the place where the playable game code is actually run
  case 2:
    gameRunning(); //where the magic happens--code is in GameRunning_method
    //println(gameIsRunning);
  }
}
