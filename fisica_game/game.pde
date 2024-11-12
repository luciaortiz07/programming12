void game(){
 background(#2FAD38);
  
  
  world.step();
  world.draw();


  PImage resizedImage = messi.copy();
  resizedImage.resize((int)50, (int)100);
  player1.attachImage(resizedImage);

  PImage resizedImage2 = mabappe.copy();
  resizedImage2.resize((int)50, (int)100);
  player2.attachImage(resizedImage2);

  PImage resizedImage3 = soccerball;
  resizedImage3.resize((int)50, (int)50);
  ball.attachImage(resizedImage3);
  
  handlePlayer();
  
  if(hitNet(line1)){
    scoreR++;
    reset();
  }
  
  if(hitNet(line2)){
    scoreL++;
    reset();
  }
  
  fill(#FC0317);
  textSize(50);
  text(scoreL, 350, 55);
  fill(#1A03FC);
  text(scoreR, 430, 55);
}
