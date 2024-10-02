//setup screen
void game() {
  

noStroke();
//background
fill(#85C5F5);
rect(0, 0, width, height);

//pause
pauseTact();
noStroke();

//paddles
//blue
fill(#0C12F7);
circle(rx, 590, prd);
//red
fill(#F70C28);
circle(lx, 590, pld);
// -------  end set-up --------------

//persons position
person(plx, ply, 1, red, true);
person(prx, pry, 1, blue, true);
  
// person movement with timer
timerL = timerL - 1;
timerR = timerR - 1;

if (timerL < 0){
plx = plx + vlx;
ply = ply + vly;
}

if (timerR < 0){
prx = prx + vrx;
pry = pry + vry;
}

// person left bouncing on sides and top
 if (plx > width/2 -80 || plx < 55) {
 vlx = vlx * -1;
 }
 
 if (ply < 110) {
    vly =vly * -1;
   }
   
  if (dist(plx, ply, 700, 680) < 185 || dist(plx, ply, 700, 20) < 185) {
   vlx = vlx * -1;
   vly = vly * -1;
   }   
   
// person right bouncing on sides and top
 if (prx < width/2 + 80 || prx > width - 55) {
 vrx = vrx * -1;
 }
 
 if (pry < 110) {
    vry = vry * -1;
   }

if (dist(prx, pry, 700, 680) < 185 || dist(prx, pry, 700, 20) < 185) {
 vrx = vrx * -1;
 vry = vry * -1;
 }
 
// move left paddle
  if (akey == true) lx = lx - 5;
  if (dkey == true) lx = lx + 5;
  if (lx - pld/2 < 0) lx = 0 + pld/2 ;
  if (lx + pld/2 > width/2 -30) lx = width/2 - 30 - pld/2;
   
    
// move right paddle
  if (rightkey == true) rx = rx + 5;
  if (leftkey == true) rx = rx - 5;
  if (rx - prd/2 < width/2 + 30) rx = width/2 + 30 + prd/2;
  if (rx + prd/2 > width) rx = width- prd/2;
   
// LEFT paddle and person collisions
   
  if (dist(plx, ply, lx, 590) <= pld/2 + 35) {
   vlx = (plx - lx)/(pld/6 + 11);
   vly = (ply - 590)/(pld/6 + 11);
    }
   
// RIGHT paddles and persons collisions
  
  if (dist(prx, pry, rx, 590) <= prd/2 + 35) {
   vrx = (- prx + rx)/(prd/6 + 11);
   vry = ( pry - 590)/(prd/6 + 11);
  }

// LEFT: touching LAVA   
  if(ply > height) {
    livesL = livesL - 1;
    timerL = 50;
    plx = 320;
    ply = 200;
  }
  if (livesL == 0) mode = gameover;


// RIGHT: touching LAVA   
  if(pry > height) {
    livesR = livesR - 1;
    timerR = 50;
    prx = 1000;
    pry = 200;
  }
  if (livesR == 0) mode = gameover;
   
 //clouds
cloud(150,200);
cloud(500,400);
cloud(1300,400);
cloud(850,200);  

//lava
fill(#FA620A);
rect(0, 650, width, 50);

//score frame
fill(0);
rect(670, 0, 60, 700);
ellipse(700, 700, 300, 200);
ellipse(700, 0, 300, 200);
textSize(42);
fill(255);
text("LIVES", 650, 650);

 fill(red);
 text(livesL, 610, 680);  
 
 fill(blue);
 text(livesR, 770, 680);
}

void gameClicks(){
  if(dist(mouseX, mouseY, 697, 40)< 20){
    mode = pause;
  }
}
