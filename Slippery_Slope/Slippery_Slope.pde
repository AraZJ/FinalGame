//Final project--Arabelle Jones
//A survival/skiing game called "Slippery Slope"
//Now, is this game full of features, or are they just bugs? Well...let's just say that it's a slippery slope
//Main
Player me;
int gameScreen=0; //gamescreen value for switch statement
float accelLimit=9; //the highest amount the scroll speed can accelerate to before it's set to one number (that number being accelLimit)
float screenLimit=50; //the width of the blue rectangles on the left and right of the slope that mark its edge
float objectScaling=0.8; //scales all the objects in arrays the specified value (mostly just to look nicer compared to the player)
int ySpacing=200; //the initial amount of spacing between trees before they start to get removed
float screenScrollSpeed=0; //sets the scroll speed of the objects in arrays
float scrollAccel=0.0005; //the rate of speed which screenScrollSpeed accelerates at 
int numOfTrees=5; //the number of trees
int numOfCoins=7; //the number of coins
int numOfSnowflakes=80; //the number of snowflakes
//arrayLists
ArrayList<Coin> coinList = new ArrayList<Coin>(); //ArrayList of coins
ArrayList<Tree> treeList=new ArrayList<Tree>(); //ArrayList of trees
ArrayList<Snow> snowflakes=new ArrayList<Snow>(); //ArrayList of snow flakes
float letterColor=230; //the color value for the snowflakes that determines all the values
char [] gameName={'S', 'l', 'i', 'p', 'p', 'e', 'r', 'y', ' ', 'S', 'l', 'o', 'p', 'e'}; //array of the characters that spell out the game name because why not?
boolean gameIsRunning; //determines if the game is running and thus if the objects in arrays are scrolling
float skyY=0; //global y postition for the sky, used in the makeSky method
boolean gameWon=false;
//you can play with the countdown's value and the amount of coins til the counter goes up below
float countdownValue=700;
float countUp=5;


void setup() {
  size(900, 600);
  background(255);
  me = new Player();
  for (int s=0; s<numOfSnowflakes; s++) { 
    snowflakes.add(new Snow());
  }
  for (int r=0; r<numOfTrees; r++) { 
    treeList.add(new Tree(random(screenLimit, width-screenLimit), 500+ySpacing*r, objectScaling)); //r*spacingValue+slideOver // random(100, 300)
  }

  for (int r=0; r<numOfCoins; r++) { 
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
    //ridiculous for loop for displaying the game name, where each letter flashes a different color
    for (int n=0; n<gameName.length; n++) {
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
      gameIsRunning=true;
      gameScreen=2;
    } 
    //makes pretty snowflakes I wasted way too much time on
    snowStorm(numOfSnowflakes);
    break;
  case 1:
    background(255);
    snowStorm(numOfSnowflakes);
    fill(0);
    textSize(20);
    textAlign(CENTER);
    //instructions
    text("Welcome to Slippery Slope, a horrible game by Arabelle Jones!", width/2, 50);
    text("Some pointers:", width/2, 75);
    text("Use left and right keys to navigate, and remember that the slope is slippery", width/2, 100);
    text("so you only have to hit a key once before you start sliding in that direction.", width/2, 126);
    text("Warning: the moment you start this game, you're living on borrowed time:", width/2, 150);
    text("a countdown will start, and the only way you can survive it is by getting enough coins.", width/2, 175);
    text("For every "+int(countUp)+" coins you get, the timer will start going up,", width/2, 200);
    text("And if you get to the amount the countdown started at, you win!", width/2, 225);
    text("But remember, every time you hit a tree the countdown will start going down again, so be careful!", width/2, 250);
    text("press 'b' to go back to the menu and space if you're ready to start", width/2, 300);
    //return to start screen
    if (keyPressed&&key=='b') {
      gameScreen=0;
    }
    if (keyPressed&&key==' '){
      gameIsRunning=true;
      gameScreen=2;
    }
    break;
    //the place where the playable game code is actually run
  case 2:
    gameRunning(); //where the magic happens--code is in GameRunning_method
  }
}
