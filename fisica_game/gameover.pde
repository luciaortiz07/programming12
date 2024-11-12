void gameover(){
  
 if (scoreR == 5) {
    fill(#3F55DE);
    rect(0, 0, 1000, 1000);
    image(mabappe, 350, 115, 130, 170);
    
    fill(255);
    textSize(100);
    textAlign(CENTER);
    text("Mbappé WIN!", 400, 430);  
  }
  
   if (scoreL == 5) {
    fill(#C9E7F2);
    rect(0, 0, 1000, 1000);
    image(messi, 350, 115, 130, 170);
    
    fill(255);
    textSize(100);
    textAlign(CENTER);
    text("Messi WIN!", 400, 430);  
  }
  
 // //backbutton
 // fill(255);
 // tactilePlayer(400, 550);
 // tactilePlayer(400, 650);
 //  noStroke();
 //  stroke(0);
 //  fill(0);
 //  textSize(20);
 //text("BACK", 495, 583);
 //text("PLAY AGAIN", 495, 683);
}

//void gameoverClicks () {
//if (mouseX > 400 && mouseX < 600 && mouseY > 550 && mouseY < 600) {
//mode = GAME;
//reset();

//}
//if (mouseX > 400 && mouseX < 600 && mouseY > 650 && mouseY < 700) {
//mode = INTRO;
//reset();
//}
//}
