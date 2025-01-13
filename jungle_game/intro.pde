void intro(){
  tarzanIntro.show();
  introMusic.play();
  
  textSize(200);
  fill(#CB8108);
  text("TARZAN", 50, 250);
  fill(255);
  textSize(50);
  text("TROUBLE IN THE JUNGLE", 140, 300);
  
  //// button
  tactileRect(300, 550, 200, 75);
  textSize(45);
  fill(#CB8108);
  text("PLAY", 350, 605);
}

void introClicks(){
if (mouseX > 300 && mouseX < 500 && mouseY > 550 && mouseY < 625) {
 mode = select;
}
}
