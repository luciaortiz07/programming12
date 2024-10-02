void pattern1() {
  count = 0;
  background(red);
  frameRate(1);
  
  while (count<500) {
    flower(random(0, 1000), random (0, 750), random(0.5, 2.5));
    count = count +1;
  }
  
  forward_botton(50,20);
  noStroke();
}

void pattern1Clicks(){
if (mouseX > width - 50 && mouseX < width - 25 && mouseY > height/2 -20 && mouseY < height/2 + 20) {
  mode = pattern2;
  }
}
