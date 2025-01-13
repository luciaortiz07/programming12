class FPlayer extends FGameObject {
  
  int direction;
  int frame = 0;
  int frameCounter = 0;
  int fs = 0;
  float momX;
  int thrInmune = 500;
  
  FKnife tarzanKnife;

  
  // Player behavior state
  //final int RESET = 0;
  final int PLAY = 1;
  final int INMUNE = 2;
  int inmuneTimer;
  
  int state = PLAY;
  
  FPlayer () {
    super();
    setPosition(0, gridSize/2);
    setName("player");
    setFillColor(red);
    inmuneTimer = 0;
    setRestitution(0);
    
  } 
  
  void act() {
   animate();
   handleInput();
   
   if (state == 2) {
       inmuneTimer++;
       if(inmuneTimer > thrInmune){
    state = 1;
    inmuneTimer = 0;
    frameTint = 0;
    }   
  }
   
   if(isTouching("dirt")) {
     setRestitution(0);
   }
  
   if (isTouching("spikes")) {
     if(state == 1){
       bump.rewind();
       bump.play();
       world.remove(this);
       lives--;
       loadPlayer();
     }
     if(state == 2) setRestitution(1);
   }
   
   if (isTouching("lava")) {
     if(state == 1){
       bump.rewind();
       bump.play();
       world.remove(this);
       lives--;
       loadPlayer();
     }
     if(state == 2) setRestitution(1);
   }
   
   if (isTouching("thwomp")) {
     if (state == 1) {
       lives--;
       bump.rewind();
       bump.play();
     world.remove(this);
     loadPlayer();
     }
   }
   
//------------NPC --------------------   
     if (isTouching("mom")){
     npcText = true;
     momX=getX();
   } 
  
   
   
//----------- INMUNE -------------------   

    if (isTouching("banana")) {
      state = 2;
    }


//------------------------------

if (isTouching("pause")) {
      mode = pause;
    }

//-----------CHANGE LEVELS--------------

  if (isTouching("waterfall")) {
     loadWorld(map1);
     loadPlayer();
     mode = levelTwo;
   }
  
   if (isTouching("liana")) {
     loadWorld(map2);
     loadPlayer();
     mode = levelThree;
   }
   
    if (isTouching("love")) {
     rescue = true;
     mode = gameover;
   }
   
   if (lives == 0) {
     mode = gameover;
   }
  }
  
   void animate(){
   
   frameCounter++;
   if(frameCounter >= 5) {
   if(frame >=tarzan.length) frame =0;
    if(player_sel =="TARZAN") attachImage(tarzan[frame]);
    if(player_sel =="JANE") attachImage(jane[frame]);
    frame++;
    frameCounter = 0;
  }
  


//---------- TRHOW KNIFES -----------------
  checkForClick(); 
  click();
  
  
if (clicked){
      knifeMusic.rewind();
      knifeMusic.play();
      tarzanKnife = new FKnife(getX(), getY()- gridSize/2);
      enemies.add(tarzanKnife);
      world.add(tarzanKnife);
}
//-----------------------------------------
}
  
  void handleInput(){
    float vy = getVelocityY();
    float vx = getVelocityX();
    
   
    if(akey) setVelocity(-100,vy);
    if(dkey)setVelocity(100,vy);
    if(wkey) setVelocity(vx,-200);
    if(skey) setVelocity(vx, 100);    
    
  }

}
