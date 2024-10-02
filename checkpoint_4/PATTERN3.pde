void pattern3(){
  frameRate(2);
background (yellow);
count=0;
fill(red);

 while (count<20) {

   heart(random(0, 1000), random (0, 750), random(0.5, 1.5));
    count = count +1;
 }
 
  back_botton(50,20);
  noStroke();
}

void pattern3Clicks(){
if (mouseX < 50 && mouseX > 25 && mouseY > height/2 -20 && mouseY < height/2 + 20) {
  mode = pattern2;
  }  
  
}
