class FLava extends FGameObject {
  //  FLava (float x, float y, PImage[] frames) {
    
    int fl;
    int speed;
    int frameCounter;
    
  FLava (float x, float y) {
    super();
    speed = 5;
    frameCounter = 0;
    fl = (int)random(0,6);
    setPosition(x, y);
    setName("lava");
    setStatic(true);
  }


  void act() {
    animate();
  // collide();
  }
  
  void animate(){
    frameCounter++;
    
    attachImage(lavaFrames[fl]);
    if(frameCounter >= speed) {
    fl++;
    if (fl > 5) fl = 0;
    frameCounter = 0;
    }
  }
  
//void collide(){
//  if(isTouching("player")){
//    println(isTouching("player"));
    
//       player.lives--;
//       player.setPosition(0,0);
//       player.setVelocity(0, -10);
//       }
//    }
}
