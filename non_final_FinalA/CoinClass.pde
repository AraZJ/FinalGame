class Coin {
  float coinDiameter;
  color coinColor;
  float coinX;
  float coinY;
  boolean hit;
  boolean offscreen;

  Coin(float y, float coinExpand) {
    coinDiameter=50*coinExpand; //used to be 50, but the good size was 50*0.8 when the trees were *1.5
    coinColor=color(255, 255, 0);
    coinX=random(coinDiameter+screenLimit, 900-coinDiameter-screenLimit);
    coinY=y;
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
      //screenScrollSpeed=1;
      screenScrollSpeed=screenScrollSpeed+scrollAccel;
      coinY=coinY-screenScrollSpeed;
    }
  }

  
  void addToScore(Player p1) { //maybe don't need this...
    if (rectCircCollide(p1.pX,p1.pY,p1.pWidth,p1.pHeight,coinX,coinY,coinDiameter/2)) {
      hit=true;
      p1.playerScore=p1.playerScore+1; //works because the coin is only there for a split second so it can only go up once I guess
    }
  }
}
