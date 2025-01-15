void gameover(){
  
  textFont(africanF);
  
  if(rescue == true){
    win.show();
    
    level1Music.pause();
    level2Music.pause();
    level3Music.pause();
    rescueMusic.play();
    
    textSize(200);
    fill(#D835FA);
    text("VICTORY", 50, 400);
  }
  
  if(lives == 0){
    lose.show();
    
    level1Music.pause();
    level2Music.pause();
    level3Music.pause();
    loseMusic.play();
    
    textSize(90);
    fill(#F70C28);
    text("YOU LOST", 200, 150);
  }
  
    // button
    tactileRect(450, 650, 300, 75);
    fill(#F70C28);
    textSize(45);
    fill(0);
    text("PLAY AGAIN", 490, 705);
  
  
    tactileRect(450, 550, 300, 75);
    fill(#F70C28);
    textSize(45);
    fill(0);
    text("EXIT", 550,605);
 
}

void gameoverClicks(){
if (mouseX > 450 && mouseX < 750 && mouseY > 650 && mouseY < 725) {
 reset(0); 
 mode = intro;
}
if (mouseX > 450 && mouseX < 750 && mouseY > 550 && mouseY < 625) {
 exit();
}
}
