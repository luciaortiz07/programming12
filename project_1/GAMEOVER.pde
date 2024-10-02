void gameover() {
  background(#FA620A);
  textSize(150);
  fill(0);
  text("GAMEOVER", 300, 200);
  noStroke();
  tactileRect(500, 450, 300, 100);
  fill(#F70C28);
  textSize(50);
  text("PLAY AGAIN", 525, 520);
  noStroke();
  

 if (livesR == 0) {
medal(320, 300);
 }
 
 if (livesL == 0) {
medal(1000, 300);
 }

 noStroke();
fill(#F5DDB7);
person(1000, 450, 1, blue, false);
fill(#0C12F7);
circle(1000, 540, prd);

person(320, 450, 1, red, false);
fill(#F70C28);
circle(320, 540, pld);
  
}

void gameoverClicks () {
if (mouseX > 500 && mouseX < 800 && mouseY > 450 && mouseY < 550) {
mode = intro;
reset();
}
}
