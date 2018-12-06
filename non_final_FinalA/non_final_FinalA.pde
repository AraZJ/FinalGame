//Main

Skier me;
Tree tree1= new Tree(450, 350, 40, 110);
Tree tree2= new Tree(500, 350, 40, 110);
int gameScreen=0;
int spacingValue=200;
int slideOver=100;
int columns=5;
int rows=4;
//Tree[] [] treez = new Tree[columns][rows]; //I thnk it should actual;y be rows columns...
Tree[] treez = new Tree[rows];
//ArrayList<Tree> innerTreeList;
//ArrayList<innerTreeList> outerTreeList;
//ArrayList<ArrayList<Tree>> treeList; //My attempt

void setup() {
  size(900, 600);
  background(255);

  me = new Skier();
  // treeList=new ArrayList<ArrayList<Tree>>();
  //grid of trees
  //nested for loops for initializing two dimensional array of trees 
  //for (int c = 0; c < columns; c=c+1) { //for loop for columns of rows
  for (int r=0; r<rows; r=r+1) { //for loop for rows
    //treez [c][r] = new Tree(r*200+spacingValue, c*100, 10, 110); //sets for loops to run treez array ////old, fixwd array
    treez [r] = new Tree(r*spacingValue+slideOver, 100, 40, 110); //sets for loops to run treez array ////old, fixwd array

    // treeList.add(new ArrayList<Tree>(r*200+spacingValue, c*100, 10, 110));
  }
  // }
}

void draw() {
  switch(gameScreen) {

  case 0:
    fill(0);
    textSize(100);
    text("gameScreen is 0!", 0, height/2);
    //fill(tree1.treeColor);
    //upTriangleOld(tree1.treePosX+40, tree1.treeHeight/2+tree1.treePosY, 40, tree1.treeHeight); //whole tree leaves
    //upTriangle(tree1.treePosX-20, tree1.treeHeight/2+tree1.treePosY, 40, tree1.treeHeight);
    //tree1.displayOld();
    tree2.display();
    break;

  case 1:
    background(255);
    // for (int c = 0; c < columns; c=c+1) { //for loop for columns of rows
    for (int r=0; r<rows; r=r+1) { //for loop for rows
      //treez[c][r].display(); //sets for loops to display treez array
      //treez[c][r].scrollDown();
      treez[r].display(); //sets for loops to display treez array
      treez[r].scrollUp();

      if (treez[r].treePosY<0) {
        treez[r].reWrap();
      }
      if (key=='p') {
        treez[r].pause();
      } else if (keyPressed&&key!='p') { //this is a bit strange but it works for now...it just messes up the speed
        treez[r].scrollUp();
      } //'r' for loop end
    }
    // }
    //upTriangle(width/2,height/2,20,100);
    //println(treez.length);
    me.display(); //this should be in the gamescreens
    me.moveSideways(); //apparently I don't actually need a keypressed...
  } 
  //me.display(); //this should be in the gamescreens
  //me.moveSideways(); //apparently I don't actually need a keypressed...
}
void keyPressed() {
  //me.moveSideways();
}
void upTriangle(float topX, float topY, float triBase, float triHeight) { //has the single point on top
  //I should make it the top, not the center...
  //if width = 10 and height = ten and center = center of screen
  //top of triangle = center - height/2, right point of triangle is center + height/2+width/2, left point is enter+height/2-width/2
  //top: x=triCenterX, y=triCenterY-triHeight/2, right: x=triCenterX+width/2, y=triCenterY+triHeight/2, left: x=triCenterX-width/2, y=triCenterY+triHeight/2
  triangle(topX, topY, topX+triBase/2, topY+triHeight, topX-triBase/2, topY+triHeight);
}
