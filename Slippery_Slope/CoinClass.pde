//Coin class
class Coin {
  color coinColor2; //the color on the inside 
  color coinColor1; //the color on the outside
  boolean resetCoins; //this is for when the game needs to be reset
  //pretty self-explanatory  
  float coinDiameter;
  float coinX;
  float coinY;
  boolean hit;
  boolean offscreen;
  Coin(float y, float coinExpand) {
    resetCoins=false;
    coinDiameter=50*coinExpand;
    coinColor1=color(230, 230, 0);
    coinColor2=color(255, 255, 0);
    coinX=random(coinDiameter, width-coinDiameter); //random between the two blue rectangles that make the sides of the slope
    coinY=y;
    //both spawn as false
    hit=false;
    offscreen=false;
  }
  //displays two circles
  void display() {
    noStroke();
    //the outer coin
    fill(coinColor1);
    ellipse(coinX, coinY, coinDiameter, coinDiameter);
    //the inner coin
    fill(coinColor2);
    ellipse(coinX, coinY, coinDiameter*2/3, coinDiameter*2/3);
  }
  //makes the coins appear to be left behind
  void scrollUp() {
    coinY=coinY-screenScrollSpeed;
  }
  //method that checks if there is a collision, adds to the score and makes the counter go up if a certain amount of coins are hit
  void addToScore(Player p1) {
    if (rectCircCollide(p1.pX, p1.pY, p1.pWidth, p1.pHeight, coinX, coinY, coinDiameter/2)) {
      hit=true;
      p1.playerScore=p1.playerScore+0.5; //it doesn't work when I set the increase value to one, possibly because a collision is happening twice (but I'm not really sure)
    }
    //every time a multiple of a certain amount of coins are hit, the counter goes up
    if (p1.playerScore>0&&p1.playerScore%countUp==0) {
      p1.counterAmount=1;
    }
  }
}
