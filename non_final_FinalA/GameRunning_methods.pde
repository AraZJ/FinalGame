//very important code with all the basics to make a running game
void runLevels(boolean levs) {
  //skyY=skyY-screenScrollSpeed;
  if (!levs) {
  }
  gameIsRunning=true;
  // makeGameOver();
  //pause();
  //restarts level
  if (!me.living&&keyPressed&&key=='r') { //might need to move
    restartLevel();
    //me.reset;
  }
  //running-maybe i can make sub gamescreens in here but i doubt it, jsut multiple game screens, and sme of teh code for running like the methods should go outside of the cases i think
  //loop to remove old trees
  //make sure to backwards
  background(255); //redraws background
  //sky at top of the screen at beginning
  //noStroke();
  //if(skyY>=-290){
  //fill(0);
  //rect(0,skyY,width,290);
  //}
  //side rectangles that set the limit of the ski slope
  fill(209, 243, 238);
  rect(0, 0, screenLimit, height);
  rect(width-screenLimit, 0, screenLimit, height);
  makeSky();
  //me.playerHit=false;
  //run loops backwards...hopefully it doent effect anything else, otherwise ill have to make separate backwards loops for removing and then a forwards loop for everything else like display and all that...hpefully not
  for (int u=numOfObjects-1; u>=0; u--) {//for (int k=0; k<numOfCoins; k++) {
    Coin coinClone = coinList.get(u);
    if (coinClone.coinY<=-coinClone.coinDiameter/2&&!coinClone.hit) {
      coinClone.offscreen=true;
    }
    if (coinClone.hit||coinClone.offscreen) {
      coinList.remove(u);
      coinClone.coinY=600+coinClone.coinDiameter; //might be doing nothing
      coinList.add(new Coin(650, objectScaling));
    }
    //coinClone.scrollUp();
    coinClone.display();
    //coinClone.coinCollide(me);
    coinClone.addToScoreLev(me);
    //}
    // for (int c = 0; c < columns; c=c+1) { //for loop for columns of rows
    //for (int t=numOfObjects-1; t>=0; t--) {//for (int e=0; e<numOfTrees; e++) { //for loop for rows
    Tree treeClone = treeList.get(u);
    if (treeClone.tY<=treeClone.tHeight*-1-treeClone.trunkHeight) {
      treeClone.onscreen=false;
      //treeClone.tY=600;
    }
    if (!treeClone.onscreen) {
      //println("offscreen!");
      treeList.remove(u); 
      treeList.add(new Tree(random(screenLimit, width-screenLimit), 600, objectScaling));
    }
    if (!treeClone.onscreen&&me.living==true) {
      treesPassed=treesPassed+1;
    }
    println(treesPassed);
    if (treesPassed>=specialNumberLimit) {
      println("level ended");
      gameIsRunning=false;
      me.moveDownAuto();
      changeLevel=true;
      levelIsWon=true;
      fill(0);
      rect(0, height-20, width, 20);
      //this needs to affect the similar statement in the levelone/level place
      //levelsWon[0]=true;
    } 
    treeClone.display();
    treeClone.scrollUp();
    coinClone.scrollUp();
    //treeClone.playerTreeCollide(me);
    playerHitG=treeClone.pTCollideB(me); //problem code
    fill(0);
    textSize(30);
    //text("hit bool "+playerHitG, 450, 300); 
    //println(treesPassed(me, treeClone));
    // treeClone.treesPassed(me);
    //println(treeClone.numOfTreesPassed);
  }
  //this should be in the gamescreens
  me.display();
  //me.playerHasBeenHit();
  me.moveSideways(); //apparently I don't actually need a keypressed...
  me.decreaseHealth();

  //me.beenHit();
  //me.moveDownAuto();
  if (!gameIsRunning&&!me.living) {
    textAlign(CENTER);
    textSize(50);
    fill(150, 0, 0);
    text("Game Over Sucka!", width/2, height/2);
    textSize(40);
    fill(0);
    text("Press 'b' to return to start screen and 'r' to restart level", width/2, height/2+50);
    if (keyPressed&&key=='b') {
      restartLevel();
      gameScreen=0;
    }
  }
  //me.display(); //this should be in the gamescreens..but then agian, maybe not..? depends on my graphics for the menu screen
  //me.moveSideways(); //apparently I don't actually need a keypressed...
} 
void runAdventure() {
  //restarts level
  background(255); //redraws background
  //side rectangles that set the limit of the ski slope
  fill(209, 243, 238);
  rect(0, 0, screenLimit, height);
  rect(width-screenLimit, 0, screenLimit, height);
  makeSky(); //draws sky at top of the screen at beginning
  //giant backwards for loop that gets the arraylists of trees and coins and does stuff with them
  for (int u=numOfObjects-1; u>=0; u--) {
    Coin coinClone = coinList.get(u); //gets all the items from the coin arraylist so stuf can be done to them
    //sets the built-in offscreen boolean to true if it hasn't been hit and it's off the screen
    if (coinClone.coinY<=-coinClone.coinDiameter/2&&!coinClone.hit) {
      coinClone.offscreen=true;
    }
    //removes all coins that have been collected or are offscreen and adds new ones
    if (coinClone.hit||coinClone.offscreen) { //||reset
      coinList.remove(u);
      coinList.add(new Coin(500, objectScaling));
    }
    coinClone.scrollUp();
    coinClone.display();
    //coinClone.coinCollide(me);
    coinClone.addToScoreAdv(me);
  }
  for (int t=numOfObjects-1; t>=0; t--) {
    Tree treeClone = treeList.get(t);
    if (treeClone.tY<=treeClone.tHeight*-1-treeClone.trunkHeight) {
      treeClone.onscreen=false;
    }
    if (!treeClone.onscreen) {
      treeList.remove(t); 
      treeList.add(new Tree(random(screenLimit, width-screenLimit), 500, objectScaling));
    }
    //if (reset&&treeClone.tY<=600) {
    //  treeList.remove(t); 
    //  treeList.add(new Tree(random(screenLimit, width-screenLimit), 600, objectScaling));
    //}
    if (!treeClone.onscreen&&me.living==true) {
      treesPassed=treesPassed+1;
    }
    treeClone.display();
    treeClone.scrollUp();
    //coinClone.scrollUp();
    //treeClone.playerTreeCollide(me);
    playerHitG=treeClone.pTCollideB(me); //problem code
    fill(0);
    textSize(30);
    //text("hit bool "+playerHitG, 450, 300); 
    //println(treesPassed(me, treeClone));
    // treeClone.treesPassed(me);
    //println(treeClone.numOfTreesPassed);
  }
  //this should be in the gamescreens

   if (reset) {  
     gameIsRunning=false;
    //background(255); //redraws background
    //side rectangles that set the limit of the ski slope
    fill(209, 243, 238);
    rect(0, 0, screenLimit, height);
    rect(width-screenLimit, 0, screenLimit, height);
    skyY=0;
    makeSky(); //draws sky at top of the screen at beginning 
    treesPassed=0;
    //screenScrollSpeed=0;
    //scrollAccel=0;
    me.reset();
  } 
  if(keyPressed&&key=='s'){
    gameIsRunning=true;
  }
    me.display();
  //me.playerHasBeenHit();
  me.moveSideways(); //apparently I don't actually need a keypressed...
  me.decreaseHealth();
  //me.beenHit();
  //me.moveDownAuto();
  if (!gameIsRunning&&!me.living) {
    textAlign(CENTER);
    textSize(50);
    fill(150, 0, 0);
    text("Game Over Sucka!", width/2, height/2);
    textSize(40);
    fill(0);
    text("Press 'b' to return to start screen and 'r' to restart level", width/2, height/2+50);
    if (keyPressed&&key=='b') {
      restartLevel();
      gameScreen=0;
    }
     
  }
  //me.display(); //this should be in the gamescreens..but then agian, maybe not..? depends on my graphics for the menu screen
println(reset);
  //me.moveSideways(); //apparently I don't actually need a keypressed...
} 
