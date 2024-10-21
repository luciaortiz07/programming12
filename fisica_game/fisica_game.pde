import fisica.*;

FWorld world;
FCircle ball;
FBox ground;
FBox player1;
void setup() {
  size(800, 600);
  Fisica.init(this);
  world = new FWorld();
  
  // Set gravity
  world.setGravity(0, 1000);
  
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
  player1.setFill(0, 0, 255);  // Blue
  world.add(player1);
  
  // player 2
  FBox player2 = new FBox(50, 100);
  player2.setStatic(true);
  player2.setPosition(width - 150, height - 100);
  player2.setFill(255, 0, 0);  // Red
  world.add(player2);
}

void draw() {
  background(255);
  world.step();
  world.draw();
}

void keyPressed() {
//  if (key == 'w') {
//    ball.setVelocity(100, -500); 
//  }
  if (key == 'd'){
  }
    player1.setVelocity(0, -500); 
    if (key == 'w'){
    player1.setVelocity(0, 500); 
}
 if (key == 's'){
    player1.setVelocity(500, 0); 
 }
 if (key == 'a'){
    player1.setVelocity(-500, 0); 
 }
}
