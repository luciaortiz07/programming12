class FGoomba extends FGameObject {
  int direction = L;
  int speed = 50;
  int frame = 0;
  int frameCounter = 0;
  
  FGoomba(float x, float y){
    super();
    setPosition (x,y);
    setName("goomba");
    setRotatable(false);
  }
  
  void act(){
    animate();
    collide();
    move();
}

void animate(){
   frameCounter++;
   if(frameCounter >= 5) {
   if(frame >=goomba.length) frame =0;
  //if(frameCount % 5 ==0) {
    if(direction == R) attachImage(goomba[frame]);
    if(direction == L) attachImage(goomba[frame]);
   // if(direction == L) attachImage(reverseImage(goomba[frame]));
    frame++;
    frameCounter = 0;
  }
}


void collide(){
  if(isTouching("wall")) {
    direction *= -1;
    setPosition(getX()+direction, getY());
  }
   
   if(isTouching("player")){
     if(player.getY() < getY()-gridSize/2 || player.state == 2) {
     tarzanYell.rewind();
     tarzanYell.play();  
     world.remove(this);
     enemies.remove(this);
     player.setVelocity(player.getVelocityX(), -300);
     } else {
       bump.rewind();
       bump.play();
       lives--;
       player.setPosition(0,0);
   }
 }
   
   if (isTouching("knife")) {
     tarzanYell.rewind();
     tarzanYell.play();
     world.remove(this);
}
}

void move(){
  float vy = getVelocityY();
  setVelocity(speed*direction, vy);
}

}
