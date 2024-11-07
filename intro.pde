void intro(){
  
soccer.show();

// button

  noStroke();
  //fill(#0C12F7);
  tactileRect(250, 450, 300, 75);
  fill(#F70C28);
  textSize(45);
  text("FISICA SOCCER", 260, 505);
  
}

void introClicks(){
if (mouseX > 250 && mouseX < 550 && mouseY > 450 && mouseY < 525) {
 mode = game;
}
}
