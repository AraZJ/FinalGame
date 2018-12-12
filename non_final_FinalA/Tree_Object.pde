////Tree object

//tree object definition
class Tree {
  float tX;
  float tWidth;
  float tY;
  float tHeight;
  float treeShift1;
  color treeColor;
  float tSpeed;
  float trunkHeight;
  boolean treeCollision;
  boolean onscreen;
  //boolean onscreen/remove

  //tree object constructor
  Tree(float x, float y, float expandValue) { //500, 350, 40, 110 //float tWidth, float tHeight, 
    tY = y; //random(110,490);//
    tX = x; //random(20,880); 
    tWidth = 40*expandValue; //40 is a good value
    tHeight = 100*expandValue; //110 is a good value
    trunkHeight=tHeight/15;
    treeShift1 = tHeight*0.5;
    treeColor=color(0, random(40, 215), 0);
    tSpeed=1;
    treeCollision=false;
    onscreen=true;
    //boolean spawns as false
  }

  //properties
  //trying to get the tree to be made out of my super-awesome triangle method for triangles so I can resize them easier
  void display() {
    //all the trees are the same width at the bottom
    fill(treeColor);
    noStroke();
    upTriangle(tX, tY, tWidth, tHeight); //whole tree leaves
    upTriangle(tX, tY, tWidth, tHeight*0.75); //middle tree leaves
    upTriangle(tX, tY, tWidth, tHeight*0.5); //top tree leaves
    //tree trunk
    rectMode(CENTER);
    noStroke();
    fill(102, 51, 0);
    rect(tX, tY+tHeight+trunkHeight/2, tWidth/6, trunkHeight); //gonna need something different
  }
  void flash() { //what the hell is this??? Oh wait, is it for new colors??
    fill(0, random(40, 215), 0);
  }
  void scrollUp() { //I said scrollDOwn lol but it's going up...*facepalm*
    tY=tY-tSpeed;
    //maybe make something like treePSeedPLaceolder = running treeSPeed before pause and if x happens (the game is unpaused) running tree speed = treeSpeedPALceholder
    //or soemthing really weird..to pause, tY=tY-treeSpeed+treeSpeed;, which apparently doesn't work 
    tSpeed=tSpeed+scrollSpeed;
    //if (tY<=0) {
    //  //println("limit reached!");
    //}
  }
  void pause() {
    tSpeed=0;
  }
  void reWrap() { //since I don't really need this, maybe this can be for randomizing the tree's distances and making them not too close, for later leels at least, or no, making them equal distances! like rows...and then for later levels when we want more than 1 in a clsoer row we'll just make the distances smaller, find a way to have everythig happen twice, like running a for loop by two, or add more than 1 arraylsit
    //since the the trees are going up, once they equal zero they're going to go to 600 
    tY=600;
  }
  void treeCollide(Player thePlayer) { //I wonder if I need to make the paleyr in input like in my flappy bird game...we'll see
    //player top and sides
    if (thePlayer.pY-thePlayer.pHeight/2<=tY+tHeight && thePlayer.pY-thePlayer.pHeight/2>=tY && thePlayer.pX-thePlayer.pWidth/2<=tX+tWidth/2 && thePlayer.pX+thePlayer.pWidth/2>=tX-tWidth/2) {
      treeCollision=true;
      thePlayer.playerHit=true;
    }
    //player bottom and sides
    if (thePlayer.pY+thePlayer.pHeight/2>=tY && thePlayer.pY+thePlayer.pHeight/2<=tY+tHeight && thePlayer.pX-thePlayer.pWidth/2<=tX+tWidth/2 && thePlayer.pX+thePlayer.pWidth/2>=tX-tWidth/2) {
      treeCollision=true;
      thePlayer.playerHit=true;
    }
    //player left and stuff 
    //if (thePlayer.pX+thePlayer.pWidth/2>= &&thePlayer.pX+thePlayer.pWidth/2<=){
      
    //}
    
  }
  void diagonalSlide(){
    
  }
}
