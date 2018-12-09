class Coin {
  int coinRadius;
  color coinColor;
  float coinX;
  float coinY;

  Coin() {
    coinRadius=50;
    coinColor=color(255, 255, 0);
    coinX=random(coinRadius*2, 900-coinRadius*2);
    coinY=random(coinRadius*2, 600-coinRadius*2);
  }
  void display() {
    fill(coinColor);
    ellipse(coinX, coinY, coinRadius, coinRadius);
  }
  void disappear(Player playVar2) {
    //    if (dist(poleX, topPoleHeight, theBird.x, theBird.y)<=theBird.radius) {
    //  theBird.alive=false;
    //}
    ////top pole right corner
    //if (dist(poleX+poleWidth, topPoleHeight, theBird.x, theBird.y)<=theBird.radius) {
    //  theBird.alive=false;
    //}
    ////bottom pole left corner
    //if (dist(poleX, bottomPoleHeight, theBird.x, theBird.y)<=theBird.radius) {
    //  theBird.alive=false;
    //}
    ////bottom pole right corner
    //if (dist(poleX+poleWidth, bottomPoleHeight, theBird.x, theBird.y)<=theBird.radius) {
    //  theBird.alive=false;
    //}
    ////top pole perimeter collision
    //if (theBird.y-theBird.radius<=topPoleHeight&&poleX<=theBird.x+theBird.radius && poleX+50>=theBird.x-theBird.radius) {
    //  theBird.alive=false;
    //}
    ////bottom pole perimeter collision
    //if (theBird.y+theBird.radius>=bottomPoleHeight&&poleX<=theBird.x+theBird.radius && poleX+50>=theBird.x-theBird.radius) {
    //  theBird.alive=false;
    //}
    ////top of screen and ground collision
    //if (theBird.y >=480 || theBird.y<=theBird.radius) {
    //  theBird.alive=false;
  }
}
void addToScore() { //maybe don't need this...
}
}
