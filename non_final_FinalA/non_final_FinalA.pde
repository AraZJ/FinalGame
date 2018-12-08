//Main
//Has an ArrayList

Player me;
Tree tree1= new Tree(600, 45, 1);
Tree tree2= new Tree(320, 45, 1);
int gameScreen=0;
int spacingValue=200;
int slideOver=100;
//int columns=5;
int elements=5;
ArrayList<Tree> treeList=new ArrayList<Tree>();

void setup() {
  size(900, 600);
  background(255);

  me = new Player();
  for (int r=0; r<elements; r++) { 
    treeList.add(new Tree(random(20, 880), random(100, 300), 1.5)); //r*spacingValue+slideOver
  }
}

void draw() {
  switch(gameScreen) {

  case 0: //menu
    background(255);
    fill(0);
    textSize(100);
    text("gameScreen is 0!", 0, height/2);
    //fill(tree1.treeColor);
    //upTriangleOld(tree1.treePosX+40, tree1.treeHeight/2+tree1.treePosY, 40, tree1.treeHeight); //whole tree leaves
    //upTriangle(tree1.treePosX-20, tree1.treeHeight/2+tree1.treePosY, 40, tree1.treeHeight);
    tree1.display();
    tree1.treeCollide(me);
    tree2.display();
    tree2.treeCollide(me);
    me.display(); //this should be in the gamescreens
    me.Straighten();
    if (key=='s'||tree2.collision||tree1.collision) {
      me.stop();
    }
    me.moveSideways(); //apparently I don't actually need a keypressed...
    //me.moveDown();
    break;

  case 1: //running-maybe i can make sub gamescreens in here but i doubt it, jsut multiple game screens, and sme of teh code for running like the methods should go outside of the cases i think
    //loop to remove old trees
    //make sure to backwards
    background(255);
    // for (int c = 0; c < columns; c=c+1) { //for loop for columns of rows
    for (int e=0; e<elements; e++) { //for loop for rows
      Tree treeClone = treeList.get(e);
      treeClone.display();
      treeClone.scrollUp();
      treeClone.treeCollide(me);
      if (treeClone.treePosY<=-115) {
        treeClone.treePosY=600;
      }
    }
    me.display(); //this should be in the gamescreens
    me.moveSideways(); //apparently I don't actually need a keypressed...
    me.Straighten();
    //me.moveDown();
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
