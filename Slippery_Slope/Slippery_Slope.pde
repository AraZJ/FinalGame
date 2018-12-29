//Final project--Arabelle Jones
//A skiing game of survival called "Slippery Slope"
//Main
Player me;
int gameScreen=0; //gamescreen value for switch statement
float objectScaling=0.8; //scales all the objects in arrays the specified value (mostly just to look nicer compared to the player)
int ySpacing=200; //the initial amount of spacing between trees before they start to get removed
float screenScrollSpeed=0; //sets the scroll speed of the objects in arrays
float scrollAccel=0.005; //the rate of speed which screenScrollSpeed accelerates at 
int numOfTrees=5; //the number of trees
int numOfCoins=5; //the number of coins
int numOfSnowflakes=80; //the number of snowflakes
//arrayLists
ArrayList<Coin> coinList = new ArrayList<Coin>(); //ArrayList of coins
ArrayList<Tree> treeList=new ArrayList<Tree>(); //ArrayList of trees
ArrayList<Snow> snowflakes=new ArrayList<Snow>(); //ArrayList of snow flakes
float letterColor=230; //the color value for the snowflakes that determines all the values
char [] gameName={'S', 'l', 'i', 'p', 'p', 'e', 'r', 'y', ' ', 'S', 'l', 'o', 'p', 'e'}; //array of the characters that spell out the game name because why not?
boolean gameIsRunning; //determines if the game is running and thus if the objects in arrays are scrolling
float skyY=0; //global y postition for the sky, used in the makeSky method
boolean gameWon=false; //determines if the game has been won
int highscore=0;
float textY=100; //this is the top of the message in the tutorial screen
//you can play with the values below--my default is is 700, 5 and 10
float counterValue=700; //the starting value for the counter--the lower it is, the quicker you die
float countUp=5; //the amount of coins that will set the coutner to increase--the larger it is, the harder it is to win
float accelLimit=10; //the highest amount the scroll speed can accelerate to before it stops going up

void setup() {
  size(1000, 600);
  background(255);
  me = new Player();
  for (int s=0; s<numOfSnowflakes; s++) { 
    snowflakes.add(new Snow());
  }
  for (int r=0; r<numOfTrees; r++) { 
    treeList.add(new Tree(random(width), 500+ySpacing*r, objectScaling));
  }
  for (int r=0; r<numOfCoins; r++) { 
    coinList.add(new Coin(325+(r+1)*random(height-25), objectScaling));
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
    snowStorm(numOfSnowflakes);
    fill(0);
    textAlign(CENTER);
    textSize(100);
    //ridiculous for loop for displaying the game name, where each letter flashes a different color
    for (int n=0; n<gameName.length; n++) {
      fill(letterColor-random(100, letterColor), letterColor-random(20, letterColor), letterColor);
      text(gameName[n], 200+n*45, height/2);
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
    break;
  case 1:
    background(255);
    //snowStorm(numOfSnowflakes);
    fill(0);
    textSize(40);
    textAlign(LEFT);
    //makes the text scroll past
    textY=textY-.5;
    //very long instructions for how to play the game
    text("Hello and welcome to Slippery Slope, a\nhorrible game by Arabelle Jones! Some\npointers: use left and right keys to\nnavigate, and remember that the slope\nis slippery, so you only have to hit a key\nonce before you start sliding in that\ndirection. If you try to hold down the\nkeys, turns won’t go well. Also, you’re on\na mountainside, so try not to fall off the\nedge or it’ll be instant, painful death for\nyou. Now, on to how you can win: this is\na survival game, so you can win by…not\ndying. The way you die is when your\ncounter, shown at the upper right of the\nscreen, reaches zero. It automatically\nstarts counting down with every new\ngame, and hitting trees speeds it up.\nThis may sound hopeless, but here’s the\ndeal—if you get "+int(countUp)+" coins, the counter will\ngo upwards, and if it reaches the original\nstarting number, you win! But every tree\nyou hit sends the counter down again, so\nif you hit a tree after getting "+int(countUp)+" coins you\nwill have to get "+int(countUp)+" more in order to make\nit go up again.\nNow be careful, and remember to have fun!\nPress press 'b' to go back to the menu and\n'space' if you're ready to start.",100,textY);
    if (keyPressed&&key=='b') {
      gameScreen=0;
    }
    if (keyPressed&&key==' ') {
      gameIsRunning=true;
      gameScreen=2;
    }
    break;
    //the place where the playable game code is actually run
  case 2:
    gameRunning(); //where the magic happens--code is in GameRunning_method
  }
}
void keyPressed() {
  //the reset button
  if (!gameIsRunning&&gameScreen==2&&key=='r') {
    gameIsRunning=true; //makes everything start moving again
    me.living=true;
    me.xDirection=0; //makes the player not move left or right at the beginning
    me.playerScore=0; //resets score
    me.playerCounter=counterValue; //puts counter back at original value
    gameWon=false;
    me.counterAmount=-0.5; //makes the counter count down slower at the start of the game 
    //sets the reset boolean for trees to true which causes the old trees to be removed and new ones put down
    for (int t=0; t<numOfTrees; t++) { 
      Tree treeClone2=treeList.get(t);
      treeClone2.resetTrees=true;
    }
    //sets the reset boolean for coins to true which causes the old coins to be removed and new ones to appear
    for (int c=0; c<numOfCoins; c++) { 
      Coin coinClone2 = coinList.get(c);
      coinClone2.resetCoins=true;
    }
    //makes the sky appear again
    skyY=0;
    makeSky();
    //resets the player's x position
    me.pX=width/2-me.pWidth/2;
  }
}
