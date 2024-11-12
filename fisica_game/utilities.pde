void keyPressed () {
 if (key == 'w' || key == 'W') wkey = true;
 if (key == 's' || key == 'S') skey = true;
 if (key == 'a' || key == 'A') akey = true;
 if (key == 'd' || key == 'D') dkey = true;
 if (keyCode == UP) upkey = true;
 if (keyCode == DOWN) downkey = true;
 if (keyCode == LEFT) leftkey = true;
 if (keyCode == RIGHT) rightkey = true;
}

void keyReleased () {
 if (key == 'w' || key == 'W') wkey = false;
 if (key == 's' || key == 'S') skey = false;
 if (key == 'a' || key == 'A') akey = false;
 if (key == 'd' || key == 'D') dkey = false;
 if (keyCode == UP) upkey = false;
 if (keyCode == DOWN) downkey = false;
 if (keyCode == LEFT) leftkey = false;
 if (keyCode == RIGHT) rightkey = false;
}

 
//------- buttons

void tactileRect(int x, int y, int w, int h){
  fill(#0C12F7);
  noStroke();
  rect(x, y, w, h);
  if(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h){
  strokeWeight(4);
  stroke(0);
   rect(x, y, w, h);
}
}

//-------------- functions -------------

void reset(){
 //world
createWorld();

//lines
createLines();

// scoreboard
createBoard();
  
  //ball  
createBall();

//players
createPlayer1();
createPlayer2();
}

// ------- create objects ---------------

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


void createBoard(){
scoreboard= new FBox(150, 70);
scoreboard.setStatic(true);
scoreboard.setPosition(width/2, 40);
scoreboard.setFill(255);
world.add(scoreboard);
}

void createBall(){
  ball = new FCircle(50);
  ball.setPosition(width / 2, height / 2);
  ball.setRestitution(1.5);
  ball.setDensity(1);
  ball.setFill(0);
  world.add(ball);
}

void createWorld(){
  Fisica.init(this);
  world = new FWorld(); 
  world.setGravity(0, 0);  // Set gravity
  world.setEdges();
}

// ----------- movement --------------

void handlePlayer(){

//----- moving player1
float left_vx = player1.getVelocityX();
float left_vy = player1.getVelocityY();

if (wkey) player1.setVelocity(left_vx, -500);
if (skey) player1.setVelocity(left_vx, 500);
if (akey) player1.setVelocity(-500, left_vy);
if (dkey) player1.setVelocity(500, left_vy);

//----- moving player2
float right_vx = player2.getVelocityX();
float right_vy = player1.getVelocityY();

if (upkey) player2.setVelocity(right_vx, -500);
if (downkey) player2.setVelocity(right_vx, 500);
if (leftkey) player2.setVelocity(-500, right_vy);
if (rightkey) player2.setVelocity(500, right_vy);

}

boolean hitNet(FBox net){
 ArrayList<FContact> contactList = ball.getContacts();
 int i = 0;
 while (i < contactList.size()){
  FContact myContact = contactList.get(i);
  if(myContact.contains(net))
    return true;
    i++;
 }
 return false;
}
