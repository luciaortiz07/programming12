void person(float x, float y,float s, color c, boolean p) {
  pushMatrix();
  translate(x,y);
  scale(s);

if (p == true){
  //parachute red
//fill(#F70C28);
fill(c);
ellipse(0, -60, 92, 100);
fill(#85C5F5);
ellipse(0, -40, 92, 100);
strokeWeight(2);
stroke(0);
line(-40, -60, 0, 0);
line(40, -60, 0, 0);
} 

//person red
noStroke();
fill(#F5DDB7);
ellipse(0, 0, 70, 70); // (200,500) 
rect(10, 20, 5, 30);
rect(-15, 20, 5, 30);
ellipse(-15, 50, 15, 10);
ellipse(15, 50, 15, 10);
ellipse(25, 10, 50, 5);
ellipse(-25, 10, 50, 5);
fill(255);
ellipse(-15, -5, 10, 15);
ellipse(12, -5, 10, 15);
fill(0);
ellipse(-15, -5, 5, 5);
ellipse(12, -5, 5, 5);
ellipse(-1, 10, 20, 20);
fill(#F5DDB7);
ellipse(-1, 5, 25, 20);
popMatrix();
}

void cloud(int x, int y){
fill(255);
ellipse(x, y, 100, 70);
ellipse(x+50, y+30, 100, 70);
ellipse(x-20, y+30, 100, 70);
}

//medal : 650, 340
void medal(int x, int y){
noStroke();
  fill(#F70C28);
triangle(x - 50, y - 40, x + 50, y - 40, x, y + 50);
fill(#FA620A);
triangle(x - 50, y - 90, x + 50, y - 90, x, y);
rect(x - 20, y + 25, 50, 20);

fill(#E3DA27);
circle(x, y + 60, 60);
fill(#FFF862);
text("1", x - 13, y + 75);
}

// --------- bottons --------------------

// pause botton

void pauseTact(){
fill(0);
circle(697, 40, 40);
fill(255);
rect(687, 20, 5, 40);
rect(707, 20, 5, 40);

if(dist(mouseX, mouseY, 700, 40) < 20){
  strokeWeight(4);
  stroke(255);
  rect(687, 20, 5, 40);
  rect(707, 20, 5, 40);
}
}

void playTactile (){
  fill(0);
  noStroke();
  circle(700, 40, 60);
  fill(255);
  noStroke();
  triangle(687, 20, 687, 60, 722, 40);
  
  if(dist(mouseX, mouseY, 700, 40) < 20){
    strokeWeight(4);
    stroke(255);
    triangle(687, 20, 687, 60, 722, 40);
}
}

//-----------------------------------------------
// play botton

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


// ---------------------------------------------
// -------------- start RESET function -------------------

void reset(){
// initialize positions
  prx = 1000;
  pry = 200;
  plx = 320;
  ply = 200;
  lx = 350;
  rx = 1000;
  
// initialize paddle sizes
  pld = 70; 
  prd = 70;
  
// initialize ball speed variables

  vrx = random(-3, 3);
    if(vrx < 0.5 && vrx > -.5) vrx = random(-3, 3);
  vry = random(-3, 3);
    if(vry < 0.5 && vry > -.5) vry = random(-3, 3);
  
  vlx = random(-3, 3);
    if(vlx < 0.5 && vlx > -.5) vlx = random(-3, 3);
  vly = random(-3, 3);
    if(vly < 0.5 && vly > -.5) vly = random(-3, 3);
  
// timers
  timerL = 50;
  timerR = 50;
  
// initialize lives if all == true
  livesL = 3;
  livesR = 3; //change back to 0

}
