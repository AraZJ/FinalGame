//very important method with the code of the playable game
void gameRunning() {
  background(255); //redraws background
  ////side rectangles that set the limit of the ski slope horizontally
  //fill(209, 243, 238);
  //noStroke();
  //rect(0, 0, screenLimit, height);
  //rect(width-screenLimit, 0, screenLimit, height);
  makeSky(); //makes a sky appear at the top of the slope
  //backwards for loop that runs through the coins arraylist
  for (int k=numOfCoins-1; k>=0; k--) { //backwards to get rid of flash when objects are removed
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
    //removes and resets coins to be below the sky when the game restarts
    if (coinClone.resetCoins) {
      coinList.remove(k);
      coinList.add(new Coin(325+(k+1)*random(height-25), objectScaling));
    }
    //displays and scrolls the coins and calls the addToScore method 
    coinClone.scrollUp();
    coinClone.display();
    coinClone.addToScore(me); //functions as a collide method but adds a point after every collision and makes the counter go up every time a certain multiple of coins are collected
  }
  //backwards for loop that runs through the trees arraylist
  for (int t=numOfTrees-1; t>=0; t--) { //backwards to get rid of flash when objects are removed
    Tree treeClone = treeList.get(t); //gets all the elements of the arraylist so you can do stuff to them
    //sets the tree variable onscreen to false whenever tree is past the top of the screen
    if (treeClone.tY<=treeClone.tHeight*-1-treeClone.trunkHeight) {
      treeClone.onscreen=false;
    }
    //removes and then adds new trees whenever trees are not onscreen
    if (!treeClone.onscreen) {
      treeList.remove(t); 
      treeList.add(new Tree(random(width), height, objectScaling));
    }
    //removes and resets trees to be below the sky when the game restarts
    if (treeClone.resetTrees) {
      treeList.remove(t); 
      treeList.add(new Tree(random(width), 500+ySpacing*t, objectScaling));
    }
    //displays and scrolls trees and runs the collision method with the player as a parameter
    treeClone.scrollUp();
    treeClone.display();
    treeClone.playerTreeCollide(me);
  }
  me.display(); //displays the player--it's before all the messages so it doesn't block them
  //if the player is dead, stop the screen from scrolling and displays some messages
  if (!me.living) {
    gameIsRunning=false;
    //game over message
    textAlign(CENTER);
    textSize(50);
    fill(150, 0, 0);
    //game over message
    text("Game Over Sucka!", width/2, height/2);
    //highscore and reset instructions
    text("Score: " +int(me.playerScore), width/2, height/2+50);
    text("Highscore: " +highscore, width/2, height/2+100);
    text("Press 'r' to retry", width/2, height/2+150);
  }
  highscore = max(int(me.playerScore), highscore);
  //stops the game and makes messages when you win 
  if (gameWon) {
    gameIsRunning=false;
    textAlign(CENTER);
    textSize(50);
    fill(150, 0, 0);
    //winning messages
    text("You won!", width/2, height/2-50);
    text("You get an imaginary gold star.", width/2, height/2);
    //highscore and reset instructions
    text("Score: " +int(me.playerScore), width/2, height/2+50);
    text("Highscore: " +highscore, width/2, height/2+100);
    text("Press 'r' to retry", width/2, height/2+150);
  }
  //makes everything move if the game is running
  if (gameIsRunning) {
    if (screenScrollSpeed<accelLimit) { //if the screen's scrolling speed is less than a certain number, it increases by scrollAccel 
      screenScrollSpeed=screenScrollSpeed+scrollAccel;
    } else if (screenScrollSpeed>=accelLimit) { //if the screen's scrolling speed reaches a certain point, it stops going up
      screenScrollSpeed=accelLimit;
    }
  } else { //if the game is not running
    screenScrollSpeed=0;
  }
  //runs the counter method and the method for moving sideways on the player
  me.moveSideways();
  me.counter();
  //snowStorm(numOfSnowflakes); //makes it really hard to see when you're playing when uncommented--optional
} 
