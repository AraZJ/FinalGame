//very important code with all the basics to make a running game
void gameRunning() {
  //skyY=skyY-screenScrollSpeed;
  gameIsRunning=true; //sets the game to running so things move
  if (screenLimit<300) { //makes the screen limit slowly expland as long as it's less than 300
    screenLimit=screenLimit+scrollAccel;
  }
  // makeGameOver();
  //pause();
  //restarts level
  if (!me.living&&keyPressed&&key=='r') { //might need to move
    //restartLevel();
    //me.reset;
  }
  background(255); //redraws background
  //side rectangles that set the limit of the ski slope horizontally
  fill(209, 243, 238);
  rect(0, 0, screenLimit, height);
  rect(width-screenLimit, 0, screenLimit, height);
  makeSky(); //makes a sky appear at the top of the slope
  //backwards for loop that runs through the coins arraylist
  for (int k=numOfObjects-1; k>=0; k--) { //backwards to get rid of flash when objects are removed
    Coin coinClone = coinList.get(k); //gets all the elements of the arraylist so you can do stuff to them
    //sets the local variable offscreen to true whenever the coins are offscreen and uncollected
    if (coinClone.coinY<=-coinClone.coinDiameter/2&&!coinClone.hit) {
      coinClone.offscreen=true;
    }
    //removes coins whenever they're offscreen or have been collected
    if (coinClone.hit||coinClone.offscreen) {
      coinList.remove(k);
      coinList.add(new Coin(650, objectScaling));
    }
    //displays, scrolls and calls the addToScore method on the coins 
    coinClone.scrollUp();
    coinClone.display();
    coinClone.addToScore(me); //functions as a collide method and adds a point after every collision 
  }
 //backwards for loop that runs through the trees arraylist
  for (int t=numOfObjects-1; t>=0; t--) { //backwards to get rid of flash when objects are removed
    Tree treeClone = treeList.get(t); //gets all the elements of the arraylist so you can do stuff to them
    //sets the tree variable onscreen to false whenever tree is past the top of the screen
    if (treeClone.tY<=treeClone.tHeight*-1-treeClone.trunkHeight) {
      treeClone.onscreen=false;
    }
    //removes and then adds new trees whenever trees are not onscreen
    if (!treeClone.onscreen) {
      treeList.remove(t); 
      treeList.add(new Tree(random(screenLimit, width-screenLimit), 600, objectScaling));
    }
    //displays, scrolls and runs collision method
    treeClone.display();
    treeClone.scrollUp();
    treeClone.playerTreeCollide(me);
    //playerHitG=treeClone.pTCollideB(me); //old collision method--problem code
  }
  //displays and calls methods for moving sideways and decreasing health
  me.display();
  me.moveSideways();
  me.decreaseHealth();
  me.moveDownManual();
  //println(me.playerHitL);
  //if the player is dead, stop the screen from scrolling and print two messages
  if (!me.living) {
    gameIsRunning=false;
    //game over message
    textAlign(CENTER);
    textSize(50);
    fill(150, 0, 0);
    text("Game Over Sucka!", width/2, height/2);
    //restart and return to selection screen message
    textSize(40);
    fill(0);
    text("Press 'b' to return to start screen and 'r' to restart level", width/2, height/2+50);
    if (keyPressed&&key=='b') {
      gameScreen=0;
    }
  }
} 
