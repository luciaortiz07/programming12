import fisica.*;
Gif soccer;
boolean wkey, akey, skey, dkey, upkey, downkey, rightkey, leftkey;
int scoreL, scoreR;

//mode framework
int mode;
int intro = 1;
int game = 2;
//int pause = 3;
int gameover= 3;

//images
PImage messi;
PImage mabappe;
PImage soccerball;

//PImage arena;
FWorld world;
FCircle ball;
FBox ground;
FBox player1;
FBox player2;
FBox line1;
FBox line2;
FBox scoreboard;
//FBox background;

void setup() {
  size(800, 600);

  //initializting variables
  mode = intro;
  wkey = akey = skey = dkey = upkey = downkey = rightkey = leftkey = false;
  scoreL= scoreR = 0;
  
 //load resourses   
  soccer= new Gif("soccer/frame_", "_delay-0.06s.png", 26, 5, 0, 0,850,600);
  messi = loadImage("messi.png");
  mabappe = loadImage("mabappe.png");
  soccerball = loadImage("soccerball.png");

//world
createWorld();

// scoreboard
createBoard();

//lines
createLines();

//reset();

  //ball  
createBall();

//players
createPlayer1();
createPlayer2();

//-------
////  // ground
//  ground = new FBox(width, 50);
//  ground.setStatic(true);
//  ground.setPosition(width / 2, height - 5);
//  ground.setFill(28, 145, 68);  // green
//  world.add(ground);

}

// --------- draw ----------------------
void draw() {
if (mode == intro) {
  intro();
 }else if (mode == game) {
  game();
  } else if (mode == gameover) {
  gameover();
  } else {
  println("mode: " + "error");
  }
}
