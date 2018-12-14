//very important code with all the basics to make a running game
void gameRunning() {
  //skyY=skyY-screenScrollSpeed;

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
  for (int k=numOfObjects-1; k>=0; k--) {//for (int k=0; k<numOfCoins; k++) {
    Coin coinClone = coinList.get(k);
    if (coinClone.coinY<=-coinClone.coinDiameter/2&&!coinClone.hit) {
      coinClone.offscreen=true;
    }
    if (coinClone.hit||coinClone.offscreen) {
      coinList.remove(k);
      coinClone.coinY=600+coinClone.coinDiameter; //might be doing nothing
      coinList.add(new Coin(650, objectScaling));
    }
    //coinClone.scrollUp();
    coinClone.display();
    //coinClone.coinCollide(me);
    coinClone.addToScore(me);
  }
  // for (int c = 0; c < columns; c=c+1) { //for loop for columns of rows
  for (int t=numOfObjects-1; t>=0; t--) {//for (int e=0; e<numOfTrees; e++) { //for loop for rows
    Tree treeClone = treeList.get(t);
    if (treeClone.tY<=treeClone.tHeight*-1-treeClone.trunkHeight) {
      treeClone.onscreen=false;
      //treeClone.tY=600;
    }
    if (!treeClone.onscreen) {
      //println("offscreen!");
      treeList.remove(t); 
      treeList.add(new Tree(random(screenLimit, width-screenLimit), 600, objectScaling));
    }
    if (!treeClone.onscreen&&me.living==true) {
      specialNumber=specialNumber+1;
    }
     println(specialNumber);
      if (specialNumber>=specialNumberLimit) {
    println("level ended");
    gameIsRunning=false;
    //levelsWon[0]=true;
  }
   
    treeClone.display();
    treeClone.scrollUp();
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
