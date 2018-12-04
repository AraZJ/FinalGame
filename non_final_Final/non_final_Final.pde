//Main
Tree tree1;
Skier me;
int gameScreen=1;
int spacingValue=100;
int columns=5;
int rows=4;
Tree[] [] treez = new Tree[columns][rows];

void setup(){
  size(900,600);
  background(255);
  //tree1=new Tree(width/2,height/2,10,110);
  me = new Skier();
  
  
    //grid of trees
  //nested for loops for initializing two dimensional array of trees 
  for (int c = 0; c < columns; c=c+1) { //for loop for columns of rows
    for (int r=0; r<rows; r=r+1) { //for loop for rows

      //if statements that make every other row of trees 30 to the left
      //if (r%2==0 && c%2==0) {//runs if r is even
      //  treeTranslation = -30;
      //} else if (r%2!=0 && c%2!=0) { //runs if r is odd
      //  treeTranslation=0;
      //}
      
      treez [c][r] = new Tree(r*200+spacingValue, c*100,10,110); //sets for loops to run treez array
    }
  }
}

void draw(){
  switch(gameScreen){
    
    case 0:
    fill(0);
    textSize(100);
    text("gameScreen is 0!",0,height/2);
  //  tree1.display();
  //tree1.scrollDown();
  //  tree1.treeSpeed=0;
    break;
    
    case 1:
  background(255);
  for (int c = 0; c < columns; c=c+1) { //for loop for columns of rows
    for (int r=0; r<rows; r=r+1) { //for loop for rows
      treez[c][r].display(); //sets for loops to display treez array
      treez[c][r].scrollDown();
    }
  }
  //tree1.display();
  //tree1.scrollDown();
  //tree1.treeSpeed=1;
  } 
  me.display();
  me.move();
}
