import fisica.*;
Gif soccer;
boolean wkey, akey, skey, dkey, upkey, downkey, rightkey, leftkey;

//mode framework
int mode;
int intro = 1;
int game = 2;
//int pause = 3;
//int gameover= 4;

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
  soccer= new Gif("soccer/frame_", "_delay-0.06s.png", 26, 5, 0, 0,850,600);
  
  mode = intro;
  wkey = akey = skey = dkey = upkey = downkey = rightkey = leftkey = false;
  
 
  Fisica.init(this);
  world = new FWorld(); 
  world.setGravity(0, 0);  // Set gravity
  world.setEdges();

  //load resourses
  messi = loadImage("messi.png");
  mabappe = loadImage("mabappe.png");
  soccerball = loadImage("soccerball.png");
  
  //// ball
  ball = new FCircle(50);
  ball.setPosition(width / 2, height / 2);
  ball.setRestitution(1.5);
  ball.setDensity(1);
  ball.setFill(0);
  world.add(ball);
  
//scoreboard
scoreboard= new FBox(150, 70);
scoreboard.setStatic(true);
scoreboard.setPosition(width/2, 40);
scoreboard.setFill(255);
world.add(scoreboard);

//-------
////  // ground
//  ground = new FBox(width, 50);
//  ground.setStatic(true);
//  ground.setPosition(width / 2, height - 5);
//  ground.setFill(28, 145, 68);  // green
//  world.add(ground);

//-------
//line
createLines();

createPlayer1();
createPlayer2();

}
void draw() {
  
  if (mode == intro) {
    intro();
  } else {
 //   game();
  //}
  
  background(#2FAD38);
  
  
  world.step();
  world.draw();


  PImage resizedImage = messi.copy();
  resizedImage.resize((int)50, (int)100);
  player1.attachImage(resizedImage);

  PImage resizedImage2 = mabappe.copy();
  resizedImage2.resize((int)50, (int)100);
  player2.attachImage(resizedImage2);

  PImage resizedImage3 = soccerball;
  resizedImage3.resize((int)50, (int)50);
  ball.attachImage(resizedImage3);
  
  handlePlayer();
  
  
  fill(#FC0317);
  textSize(50);
  text("0", 350, 55);
  fill(#1A03FC);
  text("0", 430, 55);
}
}

void createLines(){
  line1 = new FBox(30, 200);
  line1.setStatic(true);
  line1.setPosition(20, height/2);
  line1.setFill(255);
  world.add(line1);

  line2 = new FBox(30, 200);
  line2.setStatic(true);
  line2.setPosition(780, height/2);
  line2.setFill(255);
  world.add(line2);
}

void createPlayer1(){
  player1 = new FBox(50, 100);
  player1.setStatic(false);
  player1.setPosition(150, 300);
  player1.setRotatable(false);
  player1.setFill(0, 0, 255);  // Blue
  world.add(player1);
}

void createPlayer2(){
  player2 = new FBox(50, 100);
  player2.setStatic(false);
  player2.setPosition(width - 150, 300);
  player2.setRotatable(false);
  player2.setFill(255, 0, 0);  // Red
  world.add(player2);
}

void handlePlayer(){

//----- moving player1
float left_vx = player1.getVelocityX();
float left_vy = player1.getVelocityY();

if (wkey) player1.setVelocity(left_vx, -500);
if (skey) player1.setVelocity(left_vx, 500);
if (akey) player1.setVelocity(-500, left_vy);
if (dkey) player1.setVelocity(500, left_vy);

//----- moving player2

}
