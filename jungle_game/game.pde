void game() {
  
  //background images
  image(jungle, 0, 0, width, height);
  
  if (player.state == 1) {
    noTint();
    image(jungle, 0, 0, width, height);
    }
    
  //  // button PAUSE
  //tactileRect(width/2-300, height/2-300, 200, 75);
  //textSize(45);
  //fill(#CB8108);
  //text("PAUSE", width/2-260, height/2-248); 
    
  //music restart   
   if(level == 1 && level1Music.position() >= 65227){
    level1Music.cue(10000);
    level1Music.play();
  }
  
  if(level == 2 && level2Music.position() >= 132414){
    level2Music.cue(7500);
    level2Music.play();
  }
  
  if(level == 3 && level3Music.position() >= 60943){
    level3Music.rewind();
  }
 
  //World
  drawWorld();
  actWorld();
  //println(lives);
}

void actWorld(){
  player.act();
  for(int i = 0; i < terrain.size(); i++) {
    FGameObject t =terrain.get(i);
    t.act();
    //if(b instanceof FBridge) ((FBridge) b).act();
  }

   for(int i = 0; i < enemies.size(); i++) {
    FGameObject e = enemies.get(i);
    e.act();
}
}
  
void drawWorld() {
  pushMatrix();
  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2);
  scale(zoom);
  world.step();
  world.draw();
  
    if (player.state == 2) {
    tint(0, 153, 204, 126);
    inmuneMusic.play();
    
    if(inmuneMusic.position() >= 36000){
    inmuneMusic.rewind();
  }
  
    } else {
      noTint();
      inmuneMusic.pause();
    }
  
  
  if(npcText == true){
    txtTimer++;
    
    if(nMom >0 && abs(player.momX - locTxt[txtCount-1]) < 30){
        txtCount--;
        nMom--;
           } 
           
    textSize(15);
    fill(#CB8108);
    text(npcMom[txtCount], player.getX() - 200, player.getY() + 200);
    
 
   
     if(txtTimer > 60){
       npcText = false;
       locTxt[txtCount] = player.momX;
       txtCount = nMom + 1;
       nMom++;
       txtTimer = 0;
       if(txtCount > 4) txtCount = 1;
      }
     
  }
  
//println(npcText, txtTimer, txtCount, locTxt[0],locTxt[1],player.momX,nMom);
  
  float life = map(lives, 0, 5, 0, 29);

    //-------- LIFE BAR -----------------------
    fill(255, 0, 0);
    stroke(0);
    strokeWeight(3);
    rect(player.getX() - gridSize*0.7, player.getY() - gridSize*2.5, 30, 5);
    fill(50, 234, 9);
    noStroke();
    rect(player.getX() - gridSize*0.7, player.getY() - gridSize*2.5, life, 4);  
    
  popMatrix();
}

//void gameClicks() {
//  if (mouseX > width/2-300 && mouseX < width/2-100 && mouseY > height/2-300 && mouseY < height/2-225) { 
//    mode = pause;
//  } 
//  }
