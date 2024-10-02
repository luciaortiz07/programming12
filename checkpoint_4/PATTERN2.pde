void pattern2() {
  frameRate(3);
  count = 0;
  fill(pink);
  noStroke();
  rect(0, 0, 1000, 750);
  while (count<200) {

    polkadot(random(0, 1000), random (0, 750), random(0.5, 2.5));
    count = count +1;
  }
  
  forward_botton(50,20);
  back_botton(50,20);
  noStroke();
}

void pattern2Clicks(){
if (mouseX > width - 50 && mouseX < width - 25 && mouseY > height/2 -20 && mouseY < height/2 + 20) {
  mode = pattern3;
  }
if (mouseX < 50 && mouseX > 25 && mouseY > height/2 -20 && mouseY < height/2 + 20) {
  mode = pattern1;
  }  
}
