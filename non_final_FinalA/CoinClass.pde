class Coin {
  float coinDiameter;
  color coinColor;
  float coinX;
  float coinY;
  boolean hit;

  Coin(float coinExpand) {
    coinDiameter=50*coinExpand;
    coinColor=color(255, 255, 0);
    coinX=random(coinDiameter, 900-coinDiameter);
    coinY=random(coinDiameter, 600-coinDiameter);
    hit=false;
  }
  void display() {
    noStroke();
    fill(coinColor);
    ellipse(coinX, coinY, coinDiameter, coinDiameter);
  }
  void coinCollide(Player player2) { //maybe this should be called "collide" 
    //top corners
    if (dist(player2.pX-player2.pWidth/2, player2.pY-player2.pHeight/2, coinX, coinY)<=coinDiameter/2||dist(player2.pX+player2.pWidth/2, player2.pY-player2.pHeight/2, coinX, coinY)<=coinDiameter/2) {
      hit=true;
      fill(255, 255, 0);
      textSize(50);
      text("collision!", 300, height/2);
    }
    //bottom corners
    if (dist(player2.pX-player2.pWidth/2, player2.pY+player2.pHeight/2, coinX, coinY)<=coinDiameter/2||dist(player2.pX+player2.pWidth/2, player2.pY+player2.pHeight/2, coinX, coinY)<=coinDiameter/2) {
      hit=true;
      fill(255, 255, 0);
      textSize(50);
      text("collision!", 300, height/2);
    }
    //if (thePlayer.pY-thePlayer.pHeight/2<=coinY+coinRadius/2 && thePlayer.pY-thePlayer.pHeight/2>=coinY-coinRadius/2 && thePlayer.pX-thePlayer.pWidth<=tX+tWidth/2 && thePlayer.pX+thePlayer.pWidth>=tX-tWidth/2){

    //if (coinX+coinRadius>=player2.pX-player2.pWidth/2&&

    //thePlayer.pY-thePlayer.pHeight/2<=tY+tHeight && thePlayer.pY-thePlayer.pHeight/2>=tY && thePlayer.pX-thePlayer.pWidth<=tX+tWidth/2 && thePlayer.pX+thePlayer.pWidth>=tX-tWidth/2){
    //        hit=true;
    //  fill(255, 255, 0);
    //  textSize(50);
    //  text("collision!", 300, height/2);
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
  void addToScore() { //maybe don't need this...
  }
}
