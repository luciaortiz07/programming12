void intro() {
  background(#FA620A);
  fill(0);
  textSize(100);
  
  
  text("F", 300, 300 - 2* vletters);
  if (up == true) {
    vletters = vletters + 0.5;
    if (vletters > 50) up = false;
  } else {
    vletters = vletters - 0.5;
    if (vletters < 0) up = true;
  }
 
  text("L", 350, 320 - 1.5 * vletters);
  text("O", 400, 300 - vletters);
  text("O", 470, 280 + 0.5 * vletters);
  text("R", 540, 300 + 1.5 * vletters);
  
  text("I", 650, 310 - 0.5 * vletters);
  text("S", 680, 290 + 1 * vletters);
  
  text("L", 780, 310 + 0.8 * vletters);
  text("A", 840, 285 - 0.2 * vletters);
  text("V", 920, 330 + 1.5 * vletters);
  text("A", 980, 310 + 0.5 * vletters);
  
  noStroke();
  //fill(#0C12F7);
  //rect(500, 450, 300, 100);
  tactileRect(500, 450, 300, 100);
  fill(#F70C28);
  textSize(70);
  text("PLAY", 575, 520);
  
 
  noStroke();
  person(1000, 500, 1, blue, false);
  person(320, 500, 1, blue, false);
  

fill(#D3481A);
int xtriang = 0;

while(xtriang < 1300){
  triangle(xtriang, 700, xtriang + 200, 700, xtriang + 100, 600);
  triangle(xtriang, 0, xtriang + 200, 0, xtriang + 100, 100);
  xtriang = xtriang + 200;
}
}

void introClicks(){
if (mouseX > 500 && mouseX < 800 && mouseY > 450 && mouseY < 550) {
 mode = game;
}
}
