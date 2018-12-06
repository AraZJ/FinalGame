//Main
Tree tree1;
Skier me;
int gameScreen=1;
int spacingValue=100;
int columns=5;
int rows=4;
//Tree[] [] treez = new Tree[columns][rows]; //I thnk it should actual;y be rows columns...
Tree[] treez = new Tree[columns];
//ArrayList<Tree> innerTreeList;
//ArrayList<innerTreeList> outerTreeList;
//ArrayList<ArrayList<Tree>> treeList; //My attempt

void setup() {
  size(900, 600);
  background(255);
  //tree1=new Tree(width/2,height/2,10,110);
  me = new Skier();
  // treeList=new ArrayList<ArrayList<Tree>>();
  //grid of trees
  //nested for loops for initializing two dimensional array of trees 
  //for (int c = 0; c < columns; c=c+1) { //for loop for columns of rows
    for (int r=0; r<rows; r=r+1) { //for loop for rows
      //treez [c][r] = new Tree(r*200+spacingValue, c*100, 10, 110); //sets for loops to run treez array ////old, fixwd array
      treez [r] = new Tree(r*200+spacingValue, 100, 10, 110); //sets for loops to run treez array ////old, fixwd array

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
    //  tree1.display();
    //tree1.scrollDown();
    //  tree1.treeSpeed=0;
    break;

  case 1:
    background(255);
   // for (int c = 0; c < columns; c=c+1) { //for loop for columns of rows
      for (int r=0; r<rows; r=r+1) { //for loop for rows
      //treez[c][r].display(); //sets for loops to display treez array
      //treez[c][r].scrollDown();
      treez[r].display(); //sets for loops to display treez array
      treez[r].scrollUp();
      if(treez[r].treePosY<0){
       treez[r].reWrap();
      }
    }
 // }
  //tree1.display();
  //tree1.scrollDown();
  //tree1.treeSpeed=1;
} 
me.display();
me.moveSideways(); //apparently I don' actually need a keypressed...
}
void keyPressed() {
  //me.moveSideways();
}
