//assortment of various custom methods used in game
//much easier way to make an upright triangle with the top point, the base and the height as parameters
void upTriangle(float topX, float topY, float base, float triHi) { //has the single point on top
  noStroke();
  triangle(topX, topY, topX+base/2, topY+triHi, topX-base/2, topY+triHi);
}
//method that draws a horizontal or vertical line based on a given length and coordinates for its center
void centeredLine(float lLength, float lCenterX, float lCenterY, boolean upright) {
  strokeWeight(2);
  if (upright) { //this is for vertical lines
    line(lCenterX, lCenterY-lLength/2, lCenterX, lCenterY+lLength/2);
  } else if (!upright) { //this is for horizontal lines
    line(lCenterX-lLength/2, lCenterY, lCenterX+lLength/2, lCenterY);
  }
}
//makes a snow storm with arraylist of snow objects
void snowStorm(int snowAmount) {
  for (int s=snowAmount-1; s>0; s--) {
    Snow snowClone=snowflakes.get(s);
    snowClone.display();
    snowClone.fall();
    if (snowClone.offscreen) {
      snowflakes.remove(s);
      snowflakes.add(new Snow());
    }
  }
}
//checks if a circle and a rectangle have collided and returns true if they have
boolean rectCircCollide(float rx, float ry, float rectW, float rectT, float cx, float cy, float r ) { //thank you sm for this method, Joe
  float rectCenterX = rx +rectW/2;
  float rectCenterY = ry + rectT/2;
  //top &bottom
  if (abs(cx-rectCenterX)<=rectW/2 && abs(cy-rectCenterY)<=rectT/2 + r) {
    return true;
  }
  //left and right
  if (abs(cy-rectCenterY)<=rectT/2 && abs(cx-rectCenterX)<=rectW/2 +r) {
    return true;
  }
  //corners
  if (dist(rx, ry, cx, cy)<=r || dist(rx+rectW, ry, cx, cy)<=r || dist(rx, ry+rectT, cx, cy)<=r || dist(rx+rectW, ry+rectT, cx, cy)<=r) {
    return true;
  }
  return false;
}
//makes a sky behind the player at the top of the ski slope
void makeSky() {
  skyY=skyY-screenScrollSpeed;
  noStroke();
  fill(180, 190, 200);
  rect(0, skyY, width, 210);
}
