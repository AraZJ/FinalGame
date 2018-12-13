//Main
//Has an ArrayList

Player me;
//for game screen one, won't keep forever
Tree tree1= new Tree(600, 45, 1);
Tree tree2= new Tree(320, 45, 1);
int gameScreen=0; //gamescreen value for switch statement
int xSpacing=200; //the amount of space between trees...Don't really need anymore, though when I make an algorithm for the distances between trees i might
int ySpacing=200; //height/numOfTrees
//int slideOver=100;
int numOfTrees=5;
int numOfCoins=numOfTrees-1; //probably will change
float snowFallX=random(900);
float scrollSpeed=0.001;
float snowFallY=0;
ArrayList<Coin> coinList = new ArrayList<Coin>();
ArrayList<Tree> treeList=new ArrayList<Tree>();
ArrayList<Snow> snowflakes=new ArrayList<Snow>();
float letterColor=random(100, 255);
char [] gameName={'T', 'r', 'e', 'a', 'c', 'h', 'e', 'r', 'o', 'u', 's', ' ', 'T', 'u', 'n', 'd', 'r', 'a'}; //why
int numOfSnowflakes=80;
float [] snowFallXs=new float[numOfSnowflakes];
float screenLeftEdge=0;
float screenRightEdge=900;
float screenLimit=50;
boolean [] levelsWon= new boolean[5];
boolean gameIsRunning;
void setup() {
  size(900, 600);
  background(255);
  for (int b=0; b<levelsWon.length; b++) {
    levelsWon[b]=false;
    if (!levelsWon[b]) { //set these equal to these
      //scrollSpeed=0.001;
      //numOfTrees=4;
      //numOfCoins=numOfTrees;
      //screenLimit=50;
    } if (levelsWon[0]&&!levelsWon[1]){
      //scrollSpeed=0.002;
      //numOfTrees=5;
      //numOfCoins=numOfTrees;
      //screenLimit=60;
    }
  }
  me = new Player();
  for (int s=0; s<numOfSnowflakes; s++) { 
    snowflakes.add(new Snow());
  }
  for (int r=0; r<numOfTrees; r++) { 
    treeList.add(new Tree(random(screenLimit, width-screenLimit), ySpacing*(r+1), 1)); //r*spacingValue+slideOver // random(100, 300)
  }

  for (int r=0; r<numOfCoins; r++) { 
    coinList.add(new Coin(random(25, 600-25), 0.8)); //r*spacingValue+slideOver //now can I use the local Coin varuables for this part? doesn't seem like it...
  }
}
void draw() {
  //important code for booleans that determine which leel you are on--maybe should go in setup
  //for (int b=0; b<levelsWon.length; b++) {
  //  levelsWon[b]=false;
  //  if(levelsWon[1]){ //set these equal to these

  //  }
  //}
  switch(gameScreen) {

  case 0: //menu
    background(0, 180, 230);
    //triangle that makes the ski slope
    fill(255);
    noStroke();
    triangle(0, 0, width, height, 0, height);
    ////triangles that are suppsoed to help with teh illusion that it's 3d
    //triangle(0, 180, 4*width/5, height, 0, height);
    //fill(230,230,250);
    //triangle(0, 150, width-400, height, 0, height);
    fill(0);
    textAlign(CENTER);
    textSize(80);
    //text("Treacherous Tundra", width/2, height/2);
    //for loop for displaying the game name, where each letter flashes a different color
    for (int n=0; n<gameName.length; n++) { //I hate myself
      frameRate(10);
      fill(letterColor-random(100, letterColor), letterColor-random(20, letterColor), letterColor);
      text(gameName[n], 45+n*45, height/2);
    }
    frameRate(60);
    textSize(50);
    fill(0);
    text("Space to Start", width/2, height/2+100);
    if (keyPressed&&key==' ') {
      gameScreen=1;
    }
    //snow storm
    snowStorm(numOfSnowflakes);
    break;
  case 1:
    background(255);
    //snow storm
    snowStorm(numOfSnowflakes);
    textSize(45);
    fill(0);
    text("FOR LEVEL MODE (PENDING), PRESS 'L'", width/2, 200);
    text("FOR ADVENTURE MODE, PRESS 'A'", width/2, height/2);
    text("FOR TUTORIAL, PRESS 'T'", width/2, height/2+100);
    if (keyPressed&&key=='t') {
      gameScreen=2;
    } else if (keyPressed&&key=='a') {
      gameScreen=3;
    }
    break;
    //tutorial page
  case 2:
    background(255);
    fill(0);
    textSize(30);
    text("Use left and right keys to navigate.", width/2, 100);
    //animation for going left and rihgt, then text saying try it! and once you do for a few seconds (make timer), move on ot the next one
    text("Try to collect coins and avoid trees.", width/2, 300);
    //same thign as oavobe commetn says
    textSize(17);
    text("Note: you only have to press a key once before you start sliding in that direction.", width/2, 500);
    text("press 'b' to go back to the menu", width/2, height/2+100);
    if (keyPressed&&key=='b') {
      gameScreen=0;
    }
    //maybe an affect of, instead of a timr, o the screen slidng up an theres the rest of teh text
    break;
  case 3:
    gameRunning(); //where the magic happens--look in RandomMethods
  }
}
