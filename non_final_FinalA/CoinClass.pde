class Coin {
  float coinDiameter;
  color coinColor;
  float coinX;
  float coinY;
  float coinSpeed;
  boolean hit;
  boolean offscreen;

  Coin(float y, float coinExpand) {
    coinDiameter=50*coinExpand; //used to be 50, but the good size was 50*0.8 when the trees were *1.5
    coinColor=color(255, 255, 0);
    coinX=random(coinDiameter+screenLimit, 900-coinDiameter-screenLimit);
    coinY=y;
    coinSpeed=0;
    hit=false;
    offscreen=false;
  }
  void display() {
    noStroke();
    fill(coinColor);
    ellipse(coinX, coinY, coinDiameter, coinDiameter);
  }
  void scrollUp() {
    if(gameIsRunning){
      coinSpeed=1;
    coinY=coinY-coinSpeed;
    coinSpeed=coinSpeed+scrollSpeed;
    }
  }
  //void coinCollide(Player p1) { //maybe this should be called "collide" 
  ////float rx, float ry, float rectW, float rectT, float cx, float cy, float r 
  //hit=rectCircCollide(p1.pX,p1.pY,p1.pWidth,p1.pHeight,coinX,coinY,coinDiameter/2);
  //  //top corners
  ////  if (dist(player2.pX-player2.pWidth/2, player2.pY-player2.pHeight/2, coinX, coinY)<=coinDiameter/2||dist(player2.pX+player2.pWidth/2, player2.pY-player2.pHeight/2, coinX, coinY)<=coinDiameter/2) {
  ////    hit=true;
  ////    //fill(255, 255, 0);
  ////    //textSize(50);
  ////    //text("collision!", 300, height/2);
  ////  }
  ////  //bottom corners
  ////  if (dist(player2.pX-player2.pWidth/2, player2.pY+player2.pHeight/2, coinX, coinY)<=coinDiameter/2||dist(player2.pX+player2.pWidth/2, player2.pY+player2.pHeight/2, coinX, coinY)<=coinDiameter/2) {
  ////    hit=true;
  ////    //fill(255, 255, 0);
  ////    //textSize(50);
  ////    //text("collision!", 300, height/2);
  ////  }
  ////  if (player2.pY-player2.pHeight/2<=coinY+coinDiameter/2 && player2.pY-player2.pHeight/2>=coinY-coinDiameter/2 && player2.pX-player2.pWidth/2<=coinX+coinDiameter/2 && player2.pX+player2.pWidth/2>=coinX-coinDiameter/2) {
  ////    hit=true; 
  ////    //fill(255, 255, 0);
  ////    //textSize(50);
  ////    //text("collision!", 300, height/2);
  ////  }
  ////  if (player2.pY+player2.pHeight/2>=coinY-coinDiameter/2 && player2.pY+player2.pHeight/2<=coinY+coinDiameter/2 && player2.pX-player2.pWidth/2<=coinX+coinDiameter/2 && player2.pX+player2.pWidth/2>=coinX-coinDiameter/2) {
  ////    hit=true;
  ////    //fill(255, 255, 0);
  ////    //textSize(50);
  ////    //text("collision!", 300, height/2);
  ////  }
  //}
  
  void addToScore(Player p1) { //maybe don't need this...
    if (rectCircCollide(p1.pX,p1.pY,p1.pWidth,p1.pHeight,coinX,coinY,coinDiameter/2)) {
      hit=true;
      p1.playerScore=p1.playerScore+1; //works because the coin is only there for a split second so it can only go up once I guess
    }
  }
}
