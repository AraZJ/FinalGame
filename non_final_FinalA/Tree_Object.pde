////Tree object

//tree object definition
class Tree {
  float treePosX;
  float treeWidth;
  float treePosY;
  float treeHeight;
  float treeShift1;
  color treeColor;
  float treeSpeed;

  //tree object constructor
  Tree(float x, float y, float tWidth, float tHeight) {
    treePosY = y;
    treePosX = x;
    treeWidth = tWidth; //10 is a good value
    treeHeight = tHeight; //110 is also
    treeShift1 = treeHeight*0.5;
    treeColor=color(0, random(40, 215), 0);
    treeSpeed=1;
  }

  //properties
  void display() { //display method
    rectMode(CENTER);

    //tree trunk
    stroke(102, 51, 0);
    strokeWeight(5);
    fill(102, 51, 0);
    rect(treePosX, treePosY+treeHeight, treeWidth/2, 20);

    //tree top of first tree
    strokeWeight(2);
    noStroke();
    fill(treeColor);
    //fill(0, random(40, 215), 0); //color of tree leaves
    triangle(treePosX, treePosY, treePosX-20, treePosY+treeHeight, treePosX+20, treePosY+treeHeight); //bottom of tree leaves
    triangle(treePosX, treePosY, treePosX-20, treePosY+treeHeight*0.5, treePosX+20, treePosY+treeHeight*0.5);  //top of tree leaves
    triangle(treePosX, treePosY, treePosX-20, treePosY+treeHeight*0.75, treePosX+20, treePosY+treeHeight*0.75); //middle of tree leaves
  }
  void flash() {
    fill(0, random(40, 215), 0);
  }
  void scrollDown() {
    treePosY=treePosY-treeSpeed;
    treeSpeed=treeSpeed+0.01;
    if (treePosY<=0) {
      //println("limit reached!");
    }
  }
}
