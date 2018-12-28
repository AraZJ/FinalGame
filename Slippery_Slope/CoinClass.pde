//Coin class
class Coin {
    color coinColor2; //the color on the inside 
  color coinColor1; //the color on the outside
  //pretty self-explanatory  
  float coinDiameter;
  float coinX;
  float coinY;
  boolean hit;
  boolean offscreen;

  Coin(float y, float coinExpand) {
    coinDiameter=50*coinExpand;
    coinColor1=color(230, 230, 0);
    coinColor2=color(255, 255, 0);
    coinX=random(coinDiameter+screenLimit, 900-coinDiameter-screenLimit); //random between the two blue rectangles that make the sides of the slope
    coinY=y;
    //both spawn as false
    hit=false;
    offscreen=false;
  }
  void display() {
    //displasy two circles with specified values
    noStroke();
    fill(coinColor1);
    ellipse(coinX, coinY, coinDiameter, coinDiameter);
    fill(coinColor2);
    ellipse(coinX, coinY, coinDiameter*2/3, coinDiameter*2/3);
  }
  //if the game is running
  void scrollUp() {
      //screenScrollSpeed=screenScrollSpeed+scrollAccel;
      coinY=coinY-screenScrollSpeed;
  }
  //method that checks if there is a collision and then adds to the score if there is
  void addToScore(Player p1) {
    if (rectCircCollide(p1.pX, p1.pY, p1.pWidth, p1.pHeight, coinX, coinY, coinDiameter/2)) {
      hit=true;
      p1.playerScore=p1.playerScore+0.5; //works because the coin is only there for a split second so it can only go up once I think
    }
    if(p1.playerScore>0&&p1.playerScore%countUp==0){
      p1.countdownAmount=1;
    }
  }
}
