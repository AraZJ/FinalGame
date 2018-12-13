

//for my flappy bird game, I couldn't find a way to have the poles reroll when their locations were moved from one side to the other after they went off the first side, I mean it was just the same poles, but maybe if I made their spacing more of a choice like an actual outside constraint iun the constructor Tree(RandomVAlue) wjhich would have to be for color and for x location and eventually when there's levesl, for the number per row.
//so for some actual pseudocode...here we GO:
//so I want the starting screen to be like "play" but have animation that's good, maybe, or just a still picture of the player and the slope, and then mabe liek a place for skins and a tutorial and all that/
//once you hit play, it shows the view as if the camera is behind you and looks down the slope maybe, then it turns around to face you, then the game starts. I might have to make it the top of his head since it wont be 3d most likely but mayve it will...but maybe it will be a t a slight angle so that you can see the front of the opalyer a little
//maybe ill have a top view, a vievw form the bottom of the slope up whih might actually be the same as the top view i dont knwo, and then a 3/4 view or side-ish view, but Ill start with like form teh top where the whole screen is the sliope but it would have to actualy look like a slope--ooh, ask Luna for help with a moving camera, like you would have multiple perspecives and stuff like that, but anyway...
//you would start off with a few trees every few rows of snow, but some coins and some random stuff, and once you get to the bottom it would be like "Ooh, you won the first level!" then "continue ot level two" and score and all that for this screen, then level two would jsut be harder, and there would be ten(?) levels I guess for now, but maybe more evenetually
//so, like what
//when you hit a tree, an animation of shock, falling sideways then to the ground, maybe flashing red, then getting back up. 
//order of business: nice trees so I can make them bigger, simple collide method, random placement (hard because the array is all confusing), levels/gameScreens (need menu and tutorials), health+coins, nice graphics/animations maybe

//middle of ski slope in early levels should be not covered by trees
//something like Luna's space game that's 3-D ish

//ther will also be random gusts of wind cuz...why not? But only in harder levels. so far i'll make 10 levels prbably
//so it seems that I need to move the collision to the player because every tree can be both to the left and the rihgt...but that wont work either will it?
//its checking all the trees...maybe I can get it to check only the closest tree...
//for coin collide...disappear should be it getting removed from teh screen, becasue what i called disappear before was just checking if it should be removed, and then there shoudl be an if-statement in the oop of coins--"if hit is true, remove from arraylist and add one to score
//maybe somhing for if coins spawn ontop of trees like a conditional display an then a remove
//I dont think i need a new case for each screen, just new variables like maybe level1=beat, and then it saves that in a file that you beat this level and this was your score and if the boolean doesn't stat true it can refer back to the daa in the saved file but hopefully I wont have to, then the elements and maybe the randomness but probaly not increase and size increases/decreases (I havent figured out, but ooh, a zoom in and zoom out function!) Maybe...but its not a real one, it jsut resizes everything
//oh my god, I HAVE to add random gusts of wind!!!
//the trees all have the same y distance from each other, so I will need to randomize the distance past 600, or coins also..differs during levels
//how to make the menu screen graphics 3d...the trees will have to get smaller as they get closer to the left edge, nd there will have to be lines like in art that they are set on...sounds like a problem for future me ;)
//make snowfall really cool and put it in all of the games but transparet so you can have an excuse to makube make it more complicated than it needs to be...thouh I don't know
//maybe evrything gets bigger as you go down and then finally you're at the bttom. also, maybe I can calculate the time it would take for the player to reach the bottom wiht the auto scroll down! and then use that to figure out how long every level should be
//question; could you access the value of a objects vaiable if you hadnt actually declaed an object, but if i wanted to get to the widhof something which was set in teh construcot rcould i dont think so really dont thin so
//make all the letters of teh game flash different colors that are related to the bluColor variable from the snow class. is ther a way I can run a loop? oohk an array!
//cool font...though it's reallt=y frickin comp,icated horst roman gothic font is good

//algorithm for tree spacing: 4 trees max onscreen and also in array first level, 5 second maybe, and so on...same amount of coins? MArgins will shrink too, so there're be a black barrier that encoraches on the player
//question: how does duration work for mouse and key? is it only for a fe seconds and then it goes bakc to beig what it awas befreo, or once it apens foes it stay that way?
//previous grapics are stored even when you cahgne your game screen...
//question: can I just let all the code that makes the game run (player movement, arrays, all that) be in the level one gamescreen but still hold for the coming levels whcih are in there own gamescreens and noly change numbers and spacing (separate cases fr each level), or should I jsut have if statements based onwhcih levels were won that change thennumenrs? (one case for jsut a running game and elvels chagne based on if statemnts). We'll see...

//timer sets at the beginning of the game for its length, and timer for animation and death length starts whenever you die, naturally. If a certain amoutn of time passes, collide resets to false (there will have to be something short too for losing health maber) but if health=0, game is over
//my coin adding works because there's such a small amount of time that the player touches the coin since it disappears so it can only go up once...so if my player gets thrown to the side instantly it will only decrease by 1, hopefully...
//(I'll do the same for the player, making it thrown to the side quickly and hopefully that will work,  and maybe I won't need that timer...but I think I still do, at least for the length of the animation...but then the animation will probably be cut short if the condition is only true for a second--but wait, I have the leftFll and right Falll! 
