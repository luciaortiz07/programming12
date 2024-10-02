void forward_botton(int x, int y){
strokeWeight(6);
  stroke(120);
  line(width-x,height/2 - y, width-x/2,height/2);
  line(width-x,height/2 + y, width-x/2,height/2);
  if (mouseX > width - x && mouseX < width - x/2 && mouseY > height/2 - y && mouseY < height/2 + y) {
  stroke(0);
  strokeWeight(10);
  line(width-x,height/2 - y, width-x/2,height/2);
  line(width-x,height/2 + y, width-x/2,height/2);
}
}

void back_botton(int x, int y){
strokeWeight(6);
  stroke(120);
  line(0 + x,height/2 - y, 0 + x/2,height/2);
  line(0 + x,height/2 + y, 0 + x/2,height/2);
  if (mouseX < 0 + x && mouseX > 0 + x/2 && mouseY > height/2 - y && mouseY < height/2 + y) {
  stroke(0);
  strokeWeight(10);
  line(0 + x,height/2 - y, 0 + x/2,height/2);
  line(0 + x,height/2 + y, 0 + x/2,height/2);
}
}

//-------- FLOWER FUNCTION ---------
void flower(float x, float y, float s) {
  pushMatrix();
  translate(x, y);
  scale(s);
  fill(purple);
  ellipse(5, -5, 10, 10);
  ellipse(5, 5, 10, 10);
  ellipse(-5, -5, 10, 10);
  ellipse(-5, 5, 10, 10);
  fill(yellow);
  ellipse(0, 0, 8, 8);
  popMatrix();
}

//-------- POLKADOT FUNCTION ---------
void polkadot(float x, float y, float s) {
  pushMatrix();
  translate(x, y);
  scale(s);
  fill(random(0, 255));
  circle(x, y, 70);
  popMatrix();
}

//-------- HEART FUNCTION ---------
void heart(float x, float y, float s){
  pushMatrix();
  translate(x, y);
  scale(s);
  noStroke();
  fill(red);
  //circle(100, 100, 70);
  //circle(150, 100, 70);
  //triangle(71, 120, 179, 120, 130, 190);
   circle(-25, -20, 70);
   circle(25, -20, 70);
   triangle(-54, 0, 54, 0, 5, 70);
  popMatrix();
}
