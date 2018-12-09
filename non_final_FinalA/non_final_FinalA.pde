//Main
//Has an ArrayList

Player me;
Tree tree1= new Tree(600, 45, 1);
Tree tree2= new Tree(320, 45, 1);
Coin coin1=new Coin(1);
int gameScreen=1;
int spacingValue=200;
int slideOver=100;
int numOfTrees=5;
int numOfCoins=3;
ArrayList<Coin> coinList = new ArrayList<Coin>();
ArrayList<Tree> treeList=new ArrayList<Tree>();

void setup() {
  size(900, 600);
  background(255);
  me = new Player();
  for (int r=0; r<numOfTrees; r++) { 
    treeList.add(new Tree(random(20, 880), random(100, 300), 1.5)); //r*spacingValue+slideOver
  }
  for (int r=0; r<numOfCoins; r++) { 
    coinList.add(new Coin(0.8)); //r*spacingValue+slideOver
  }
}

void draw() {
  switch(gameScreen) {

  case 0: //menu
    background(255);
    fill(0);
    textSize(100);
    text("gameScreen is 0!", 0, height/2);
    tree1.display();
    tree1.treeCollide(me);
    tree2.display();
    tree2.treeCollide(me);
    me.display(); //this should be in the gamescreens
    me.Straighten();
    if (key=='s'||tree2.treeCollision||tree1.treeCollision) {
      me.stop();
    }
    me.moveSideways();
    coin1.display();
    coin1.coinCollide(me);
    //apparently I don't actually need a keypressed...
    //me.moveDownAuto();
    break;

  case 1: //running-maybe i can make sub gamescreens in here but i doubt it, jsut multiple game screens, and sme of teh code for running like the methods should go outside of the cases i think
    //loop to remove old trees
    //make sure to backwards
    background(255);
    //run loops backwards...hopefully it doent effect anything else, otherwise ill have to make separate backwards loops for removing and then a forwards loop for everything else like display and all that...hpefully not
    for (int k=0; k<numOfCoins; k++) {
      Coin coinClone = coinList.get(k);
      if (coinClone.hit) {
        println("got a coin!");
      }
      coinClone.display();
      coinClone.coinCollide(me);
    }
    // for (int c = 0; c < columns; c=c+1) { //for loop for columns of rows
    for (int e=0; e<numOfTrees; e++) { //for loop for rows
      Tree treeClone = treeList.get(e);
      if (treeClone.tY<=treeClone.tHeight*-1-treeClone.trunkHeight) {
        treeClone.onscreen=false;
        //treeClone.tY=600;
      }
      if (!treeClone.onscreen) {
        //println("offscreen!");
        treeList.remove(e); 
        treeList.add(new Tree(random(20, 880), 600, 1.5));
      }
      treeClone.display();
      treeClone.scrollUp();
      treeClone.treeCollide(me);
    }
    me.display(); //this should be in the gamescreens
    me.moveSideways(); //apparently I don't actually need a keypressed...
    me.Straighten();
    me.moveDownManual();
    //me.moveDownAuto();
  } 
  //me.display(); //this should be in the gamescreens..but then agian, maybe not..? depends on my graphics for the menu screen
  //me.moveSideways(); //apparently I don't actually need a keypressed...
}
void keyPressed() {
  //me.moveSideways();
}
void upTriangle(float topX, float topY, float base, float triHi) { //has the single point on top
  //I should make it the top, not the center...
  //if width = 10 and height = ten and center = center of screen
  //top of triangle = center - height/2, right point of triangle is center + height/2+width/2, left point is enter+height/2-width/2
  //top: x=triCenterX, y=triCenterY-triHeight/2, right: x=triCenterX+width/2, y=triCenterY+triHeight/2, left: x=triCenterX-width/2, y=triCenterY+triHeight/2
  triangle(topX, topY, topX+base/2, topY+triHi, topX-base/2, topY+triHi);
}
