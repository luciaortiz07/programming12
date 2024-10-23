import fisica.*;
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
//FBox background;
void setup() {
  size(800, 600);
  Fisica.init(this);
  world = new FWorld();
  //load resourses
  //arena = loadImage("arena.png");
  messi = loadImage("messi.png");
  mabappe = loadImage("mabappe.png");
  soccerball = loadImage("soccerball.png");
  // Set gravity
  world.setGravity(0, 1000);
  //background
  //background = new FBox(width, height);
  //background.setStatic(true);
  //background.setPosition(0, 0);
  //world.add(background);
  // ball
  ball = new FCircle(30);
  ball.setPosition(width / 2, height / 2);
  //ball.setRestitution(1.5);
  ball.setDensity(4);
  ball.setFill(0);
  world.add(ball);


  // ground
  ground = new FBox(width, 50);
  ground.setStatic(true);
  ground.setPosition(width / 2, height - 5);
  ground.setFill(28, 145, 68);  // green
  world.add(ground);


  // player 1
  player1 = new FBox(50, 100);
  player1.setStatic(false);
  player1.setPosition(150, height - 100);
  player1.setRotatable(false);
  player1.setFill(0, 0, 255);  // Blue
  world.add(player1);

  // player 2
  player2 = new FBox(50, 100);
  player2.setStatic(false);
  player2.setPosition(width - 150, height - 100);
  player2.setRotatable(false);
  player2.setFill(255, 0, 0);  // Red
  world.add(player2);
}
void draw() {
  background(#9CE2FC);
  world.step();
  world.draw();
  //PImage resizedImage4 = arena.copy();
  //resizedImage4.resize((int)800, (int)600);
  //arena.attachImage(resizedImage4);

  PImage resizedImage = messi.copy();
  resizedImage.resize((int)50, (int)100);
  player1.attachImage(resizedImage);

  PImage resizedImage2 = mabappe.copy();
  resizedImage2.resize((int)50, (int)100);
  player2.attachImage(resizedImage2);

  PImage resizedImage3 = soccerball.copy();
  resizedImage3.resize((int)50, (int)50);
  ball.attachImage(resizedImage3);
}

void keyReleased() {
  if (key == 'd') {
  }
  player1.setVelocity(0, -500);
  if (key == 'w') {
    player1.setVelocity(0, 500);
  }
  if (key == 's') {
    player1.setVelocity(500, 0);
  }
  if (key == 'a') {
    player1.setVelocity(-500, 0);
  }
}
void keyPressed() {
  if (keyCode == RIGHT) {
    player2.setVelocity(500, 0);
  } else if (keyCode == LEFT) {
    player2.setVelocity(-500, 0);
  } else if (keyCode == UP) {
    player2.setVelocity(0, -500);
  } else if (keyCode == DOWN) {
    player2.setVelocity(0, 500);
  }
}
