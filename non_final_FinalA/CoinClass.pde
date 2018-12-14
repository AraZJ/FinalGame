class Coin {
  float coinDiameter;
  color coinColor2; //the 
  color coinColor1;
  float coinX;
  float coinY;
  boolean hit;
  boolean offscreen;

  Coin(float y, float coinExpand) {
    coinDiameter=50*coinExpand; //used to be 50, but the good size was 50*0.8 when the trees were *1.5
    coinColor2=color(255, 255, 0);
    coinColor1=color(230, 230, 0);
    coinX=random(coinDiameter+screenLimit, 900-coinDiameter-screenLimit);
    coinY=y;
    hit=false;
    offscreen=false;
  }
  void display() {
    noStroke();
    fill(coinColor1);
    ellipse(coinX, coinY, coinDiameter, coinDiameter);
    fill(coinColor2);
    ellipse(coinX, coinY, coinDiameter*2/3, coinDiameter*2/3);
  }
  void scrollUp() {
    if (gameIsRunning) {
      //screenScrollSpeed=1;
      //screenScrollSpeed=screenScrollSpeed+scrollAccel;
      controlSpeed();
      coinY=coinY-screenScrollSpeed;
    }
  }
  void addToScoreAdv(Player p1) { //maybe don't need this...
    if (rectCircCollide(p1.pX, p1.pY, p1.pWidth, p1.pHeight, coinX, coinY, coinDiameter/2)) {
      hit=true;
      p1.playerScore=p1.playerScore+0.5; //works because the coin is only there for a split second so it can only go up once I guess
    }
  }
  void addToScoreLev(Player p1) { //maybe don't need this...
    if (rectCircCollide(p1.pX, p1.pY, p1.pWidth, p1.pHeight, coinX, coinY, coinDiameter/2)) {
      hit=true;
      p1.playerScore=p1.playerScore+1; //works because the coin is only there for a split second so it can only go up once I guess
    }
  }
}
