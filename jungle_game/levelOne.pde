void levelOne(){
  croc.show();
  introMusic.pause();
  level1Music.play();
 
  level = 1;
  txtCount = 0;
  
  textSize(220);
  fill(255);
  text("LEVEL 1", 50, 450);
  
  // button
   fill(#03FAF4);
  tactileRect(200, 550, 400, 75);
  textSize(40);
  fill(255);
  text("CLICK TO CONTINUE", 230, 600);
}

void levelOneClicks(){
if (mouseX > 200 && mouseX < 600 && mouseY > 550 && mouseY < 625) { 
 mode = game;
}
}
