class FLava extends FGameObject {
    
    int fl;
    int speed;
    int frameCounter;
    
  FLava (float x, float y) {
    super();
    speed = 50;
    frameCounter = 0;
    fl = (int)random(0,6);
    setPosition(x, y);
    setName("lava");
    setStatic(true);
  }


  void act() {
    frameCounter++;
    
    attachImage(waterFrames[fl]);
    if(frameCounter >= speed) {
    fl++;
    if (fl > 5) fl = 0;
    frameCounter = 0;
    }
    
  }
}
