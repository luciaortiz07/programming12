void levelThree(){
  grass.show();
  level2Music.pause();
  level3Music.play();
  
  level = 3;
 
  textSize(220);
  fill(255);
  text("LEVEL 3", 50, 450);
  
  // button
   fill(#F5E992);
  tactileRect(200, 550, 400, 75);
  textSize(40);
  fill(255);
  text("CLICK TO CONTINUE", 230, 600);
}

void levelThreeClicks(){
if (mouseX > 200 && mouseX < 600 && mouseY > 550 && mouseY < 625) { 
 mode = game;
}
}
