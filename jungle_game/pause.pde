void pause(){
   introMusic.pause();
   level1Music.pause();
   level2Music.pause();
   level3Music.pause();
   
   
  // button
  tactileRect(300, 550, 200, 75);
  textSize(45);
  fill(#CB8108);
  text("PLAY", 350, 605);
    
}

void pauseClicks() {
  
if (mouseX > 300 && mouseX < 500 && mouseY > 550 && mouseY < 625) {
  if(level == 1){
    level1Music.play();
  }
  if(level == 2){
    level2Music.play();
  }
  if(level == 3){
    level3Music.play();
  }
 mode = game;
}
}
