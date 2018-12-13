//Main
//Has an ArrayList

Player me;
int gameScreen=0; //gamescreen value for switch statement
////valus that differentiate levels form each other
float screenScrollSpeed=0; //0 ////important for 
float scrollAccel=0.001; //0.001 for start
int xSpacing=200; //the amount of space between trees...Don't really need anymore, though when I make an algorithm for the distances between trees i might
int ySpacing=200; //height/numOfTrees
float screenLimit; //50 for start
int specialNumber; //My BABY I LOVE you!!!!!
int specialNumberLimit;
int [] levelEnders={5, 10{; // 15, 20, 25};
//everything else
//don't really need a different numebr of trees, just different spacing, plus I don;t think the for loops will wokr if it's changed form setup to draw
int numOfTrees=5;
int numOfCoins=numOfTrees-1; //probably will change
int numOfSnowflakes=80;
//arrayLists
ArrayList<Coin> coinList = new ArrayList<Coin>(); //ArrayList of coins
ArrayList<Tree> treeList=new ArrayList<Tree>(); //ArrayList of trees
ArrayList<Snow> snowflakes=new ArrayList<Snow>(); //ArrayList of snow flakes
float letterColor=random(100, 255); //the color value for the snowflakes that determines all the values
char [] gameName={'T', 'r', 'e', 'a', 'c', 'h', 'e', 'r', 'o', 'u', 's', ' ', 'T', 'u', 'n', 'd', 'r', 'a'}; //array of the characters that spell out the game name
//array of the booleans that, when true, mean you have won a level
boolean [] levelsWon= new boolean[2];
//boolean that determines if the game is running
boolean gameIsRunning;
boolean playerHitG;
//long levelTimer;
//long levelStartingTime;
//int numOfTreesPassedG=0;
//will probably replace with width and height
float screenLeftEdge=0;
float screenRightEdge=900;
float skyY=0; //global y postition for the sky in makeSky();

void setup() {
  size(900, 600);
  background(255);
  //for (int b=0; b<levelsWon.length; b++) {
  //  levelsWon[b]=false;
  //  if (!levelsWon[b]) { //set these equal to these
  //    //scrollSpeed=0.001;
  //    //numOfTrees=4;
  //    //numOfCoins=numOfTrees;
  //    //screenLimit=50;
  //  } if (levelsWon[0]&&!levelsWon[1]){
  //    //scrollSpeed=0.002;
  //    //numOfTrees=5;
  //    //numOfCoins=numOfTrees;
  //    //screenLimit=60;
  //  }
  //}
  me = new Player();
  for (int s=0; s<numOfSnowflakes; s++) { 
    snowflakes.add(new Snow());
  }
  for (int r=0; r<numOfTrees; r++) { 
    treeList.add(new Tree(random(screenLimit, width-screenLimit), 300+ySpacing*r, 1)); //r*spacingValue+slideOver // random(100, 300)
  }

  for (int r=0; r<numOfCoins; r++) { 
    coinList.add(new Coin(300+random(25, 600-25), 0.8)); //r*spacingValue+slideOver //now can I use the local Coin varuables for this part? doesn't seem like it...
  }
}
void draw() {
  //important code for booleans that determine which leel you are on--maybe should go in setup
  //for (int b=0; b<levelsWon.length; b++) {
  //  levelsWon[b]=false;
  //  if (!levelsWon[0]) { //set these equal to these

  //    scrollSpeed=0.001;
  //    numOfTrees=4;
  //    numOfCoins=numOfTrees;
  //    screenLimit=50;
  //  } else if (levelsWon[0]){
  //      println("level 1 is won");
  //    scrollSpeed=0.002;
  //    numOfTrees=5;
  //    numOfCoins=numOfTrees;
  //    screenLimit=60;
  //  }
  //}
  //for (int b=0; b<levelsWon.length; b++) {
  //  levelsWon[b]=false;
  //  if(levelsWon[1]){ //set these equal to these

  //  }
  //}
  switch(gameScreen) {

  case 0: //menu
    background(180, 190, 200); //0, 180, 230
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
    } else if (keyPressed&&key=='l') {
      gameScreen=4;
    }
    break;
    //tutorial page
  case 2:
    background(255);
    fill(0);
    textSize(30);
    textAlign(CENTER);
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
    me.display();
    //me.moveSideways(); //apparently I don't actually need a keypressed...
    //me.moveDownManual();
    //me.decreaseHealth();
    //me.moveDownAuto();
    me.beenHit();

    break;
    //adventure mode!
  case 3:

    //forloop for ammoiutnoflevels the first one is the amount of actual millisseconds...
    //levelStartingTime=millis();
    //levelTimer=levelStartingTime/millis()+1;
    adventureTime();
    gameRunning(); //where the magic happens--look in RandomMethods
    //println(levelStartingTime);
    //if(levelTimer>=5000){
    //println("level one won!"); 
    //textSize(50);
    //text("millis(): "+millis(),width/2,height/2);
    //text("levelStartingTime "+levelStartingTime,width/2,height/2+50);
    //text("levelTimer: "+levelTimer,width/2,height/2+100);
    // }
    if (specialNumber>=10) {
      levelsWon[0]=true;
      println("level's end!");
    }
    break;
  case 4: //level  mode
    ////for (int b=0; b<levelsWon.length; b++) {
    //  //levelsWon[b]=false;
    //  if (!levelsWon[0]) { //set these equal to these
    //println("level 1 is ongoing");
    //    scrollSpeed=0.005;
    //    numOfTrees=4;
    //    numOfCoins=numOfTrees;
    //    screenLimit=50;
    //  } else if (levelsWon[0]){
    //      println("level 1 is won");
    //    scrollSpeed=0.002;
    //    numOfTrees=5;
    //    numOfCoins=numOfTrees;
    //    screenLimit=60;
    //  }
    //}
    levelOne();
    gameRunning();
    textAlign(CENTER);
    textSize(70);
    fill(0);
    text("level 1", 450, 70);
    //if (specialNumber>=specialNumberLimit) {
    //  levelsWon[0]=true;
    //  println("level's end!");
    //}
    //}
    for (int n=0; n<levelEnders.length; n++) {
      if (specialNumber>=levelEnders[n]) {
        levelsWon[n]=true;
        println("level's end!");
      }
    }
  }
}
