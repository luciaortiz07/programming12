class FPlayer extends FGameObject {
  int frame;
  int direction;
  int lives;
  
  // Player behavior state
  final int RESET = 0;
  final int PLAY = 1;
 
  int state = PLAY;
  
  FPlayer () {
    super();
    setPosition(0, gridSize/2);
    setVelocity(0,-10);
    setName("player");
    setFillColor(red);
  }
  
  void act() {
   handleInput();
   if (isTouching("spikes")) {
     setPosition(0,0);
     setVelocity(0,-10);
     state = RESET;
   }
   if (isTouching("lava")) {
     setPosition(0,0);
     setVelocity(0,-10);
     state = RESET;
   }
 
   if (isTouching("thwomp")) {
     setPosition(0,0);
     setVelocity(0,-10);
     state = RESET;
   }
   
   if (isTouching("hammer")) {
     setPosition(0,0);
     setVelocity(0,-10);
     state = RESET;
   }
  }
  
  void handleInput(){
    float vy = getVelocityY();
    float vx = getVelocityX();
    
    if(state == RESET){
      if(vy == 0) state = PLAY;
    }
    if(state == PLAY){
     
// trying to return to initial position, velocity of X keeps changing    
    //if(akey){
    //  if (isTouching("lava")) {
    //    setVelocity(0,-10);
    //  } else {
    //  setVelocity(-100,vy);
    //  }
    //}
    //if(dkey){
    //  if (isTouching("lava")) {
    //    setVelocity(0,-10);
    //  } else{
    //  setVelocity(100,vy);
    //  }
    //}
  
    if(akey) setVelocity(-100,vy);
    if(dkey) setVelocity(100,vy);
    
    if(wkey) setVelocity(vx,-100);
    if(skey) setVelocity(vx, 100);
      println(getX(),getY(),getVelocityX(), getVelocityY());
}

//void checkForCollisions(){
//  ArrayList<FContact> contacts = getContacts ();
//  for(int i = 0; i< contacts.size(); i++){
//    FContact fc = contacts.get(i);
//    if(fc.contains("spikes")) {
//      setPosition(0,0);
//    }
//}

  }
}
