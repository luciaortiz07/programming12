class FGorillaz extends FGameObject {
  int direction = U;
  int speed = 200;
  int frame = 0;
  int frameCounter = 0;
  float originalY;
  
  FGorillaz(float x, float y){
    super();
    setPosition (x,y);
    setName("gorillaz");
    setRotatable(false);
    originalY = y;
  }
  
  void act(){
    animate();
    collide();
    move();
}

void animate(){
   frameCounter++;
   if(frameCounter >= 5) {
   if(frame >=gorillaz.length) frame =0;
  //if(frameCount % 5 ==0) {
    if(direction == R) attachImage(gorillaz[frame]);
    if(direction == L) attachImage(gorillaz[frame]);
   // if(direction == L) attachImage(reverseImage(goomba[frame]));
    frame++;
    frameCounter = 0;
  }
}


void collide(){
  if(isTouching("dirt")) {
    direction *= -1; 
    setPosition(getX(), getY() + direction);
  }
  
  if(getY() <= originalY - 3*gridSize) {
    direction *= -1; 
    setPosition(getX(), getY() + direction);
  }
   
   if(isTouching("player")){
       bump.rewind();
       bump.play();
       lives--;
       player.setPosition(0,0);
   }

  if (isTouching("knife")) {
     tarzanYell.rewind();
     tarzanYell.play();
     world.remove(this);
   }
}


void move(){
   setVelocity(0, speed*direction);
}

}
