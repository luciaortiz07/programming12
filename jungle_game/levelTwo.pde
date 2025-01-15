void levelTwo(){
cascade.show();
level1Music.pause();
level2Music.play();

//println(level2Music.position());

level = 2;
txtCount = 2;
  
  textSize(220);
  fill(255);
  text("LEVEL 2", 50, 450);
  
  // button
   fill(#03FAF4);
  tactileRect(200, 550, 400, 75);
  textSize(40);
  fill(255);
  text("CLICK TO CONTINUE", 230, 600);
}

void levelTwoClicks(){
if (mouseX > 200 && mouseX < 600 && mouseY > 550 && mouseY < 625) { 
 mode = game;
}
}
