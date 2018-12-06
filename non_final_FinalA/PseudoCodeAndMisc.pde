//if statements that make every other row of trees 30 to the left
//if (r%2==0 && c%2==0) {//runs if r is even
//  treeTranslation = -30;
//} else if (r%2!=0 && c%2!=0) { //runs if r is odd
//  treeTranslation=0;
//}
//Tree tree1;
//tree1=new Tree(width/2,height/2,10,110);
//tree1.display();
//tree1.scrollDown();
//tree1.treeSpeed=1;

//for my flappy bird game, I couldn't find a way to have the poles reroll when their locations were moved from one side to the other after they went off the first side, I mean it was just the same poles, but maybe if I made their spacing more of a choice like an actual outside constraint iun the constructor Tree(RandomVAlue) wjhich would have to be for color and for x location and eventually when there's levesl, for the number per row.
//so for some actual pseudocode...here we GO:
//so I want the starting screen to be like "play" but have animation that's good, maybe, or just a still picture of the player and the slope, and then mabe liek a place for skins and a tutorial and all that/
//once you hit play, it shows the view as if the camera is behind you and looks down the slope maybe, then it turns around to face you, then the game starts. I might have to make it the top of his head since it wont be 3d most likely but mayve it will...but maybe it will be a t a slight angle so that you can see the front of the opalyer a little
//maybe ill have a top view, a vievw form the bottom of the slope up whih might actually be the same as the top view i dont knwo, and then a 3/4 view or side-ish view, but Ill start with like form teh top where the whole screen is the sliope but it would have to actualy look like a slope--ooh, ask Luna for help with a moving camera, like you would have multiple perspecives and stuff like that, but anyway...
//you would start off with a few trees every few rows of snow, but some coins and some random stuff, and once you get to the bottom it would be like "Ooh, you won the first level!" then "continue ot level two" and score and all that for this screen, then level two would jsut be harder, and there would be ten(?) levels I guess for now, but maybe more evenetually
//so, like what
//when you hit a tree, an animation of shock, falling sideways then to the ground, maybe flashing red, then getting back up. 
//order of business: nice trees so I can make them bigger, simple collide method, random placement (hard because the array is all confusing), levels/gameScreens (need menu and tutorials), health+coins, nice graphics/animations maybe
//upTriangleOld(treePosX, treeHeight/2+treePosY, treeWidth, treeHeight); //whole tree leaves
//middle of ski slope in early levels should be not covered by trees
//something like Luna's space game that's 3-D ish
//    upTriangleOld(treePosX, treeHeight/2+treePosY, treeWidth, treeHeight); //middle tree leaves
//    upTriangleOld(treePosX, treeHeight/2+treePosY, treeWidth, treeHeight); //top tree leaves

//void displayOld() { //old display method
//  rectMode(CENTER);

//  //tree trunk
//  stroke(102, 51, 0);
//  strokeWeight(5);
//  fill(102, 51, 0);
//  rect(treePosX, treePosY+treeHeight, treeWidth/8, 20);

//  //tree top of first tree
//  strokeWeight(2);
//  noStroke();
//  fill(treeColor);
//  //fill(0, random(40, 215), 0); //color of tree leaves
//  //treePos- X and Y is the top, treePosX-20, treePosY+treeHeight*something is the left bottom and treePosX+20, treePosY+treeHeight*something is the irght bottom
//  //the width of the base is 40, the height is treeHeight (duh!), the middle is treeHeight/2+treeY
//  triangle(treePosX, treePosY, treePosX-20, treePosY+treeHeight, treePosX+20, treePosY+treeHeight); //bottom of tree leaves
//  triangle(treePosX, treePosY, treePosX-20, treePosY+treeHeight*0.75, treePosX+20, treePosY+treeHeight*0.75); //middle of tree leaves
//  triangle(treePosX, treePosY, treePosX-20, treePosY+treeHeight*0.5, treePosX+20, treePosY+treeHeight*0.5);  //top of tree leaves

//  println(treeHeight/2+treePosY);
//}
//  void upTriangleOld(float triCenterX, float triCenterY, float triBase, float triHeight) { //has the single point on top
////I should make it the top, not the center...
//  //if width = 10 and height = ten and center = center of screen
//  //top of triangle = center - height/2, right point of triangle is center + height/2+width/2, left point is enter+height/2-width/2
//  //top: x=triCenterX, y=triCenterY-triHeight/2, right: x=triCenterX+width/2, y=triCenterY+triHeight/2, left: x=triCenterX-width/2, y=triCenterY+triHeight/2
//  triangle(triCenterX, triCenterY-triHeight/2, triCenterX+triBase/2, triCenterY+triHeight/2, triCenterX-triBase/2, triCenterY+triHeight/2);
//}
//Tree[] [] treez = new Tree[columns][rows]; //I thnk it should actual;y be rows columns...
//Tree[] treez = new Tree[rows];
//ArrayList<Tree> innerTreeList; //this is my arraylist of an arraylist
//ArrayList<innerTreeList> outerTreeList;
//ArrayList<ArrayList<Tree>> treeList; //My attempt //you dont actually NEED list, ya dingus!
  // treeList=new ArrayList<ArrayList<Tree>>();
  //grid of trees
  //nested for loops for initializing two dimensional array of trees 
  //for (int c = 0; c < columns; c=c+1) { //for loop for columns of rows
 // for (int r=0; r<2; r++) { //for loop for rows that's not actually for rows 
    //treez [c][r] = new Tree(r*200+spacingValue, c*100, 10, 110); //sets for loops to run treez array ////old, fixed array
    //treez [r] = new Tree(r*spacingValue+slideOver, 100, 40, 110); //sets for loops to run treez array ////old, fixed array
// treeList.add(new Tree(r*spacingValue+slideOver, r*100, 40, 110));
// treeList.add(new Tree(r*spacingValue+slideOver, 100, 40, 110));
 //}
 // }
 //  treeClone.scrollUp();
    //treez[c][r].display(); //sets for loops to display treez array
    //treez[c][r].scrollDown();

    //treez[r].display(); //sets for loops to display treez array
    //treez[r].scrollUp();

    //if (treez[r].treePosY<0) {
    //  treez[r].reWrap();
    //}
    //if (key=='p') {
    //  treez[r].pause();
    //} else if (keyPressed&&key!='p') { //this is a bit strange but it works for now...it just messes up the speed
    //  treez[r].scrollUp();
    //} //'r' for loop end
    // }
    // }
    //upTriangle(width/2,height/2,20,100);
    //println(treez.length);
