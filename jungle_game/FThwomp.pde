class FThwomp extends FGameObject {
  int direction = L;
  int speed = 50;
  int fallSpeed = 50;
  int riseSpeed = 50;
  int frame = 0;
  int frameCounter = 0;
  float originalY;
  
  // Thwomp behavior states
  final int WAITING = 0;
  final int FALLING = 1;
  final int RISING = 2;
  int stateThw = WAITING;

  FThwomp(float x, float y) {
    super();
    setPosition (x, y);
    setName("thwomp");
    setRotatable(false);
    setStatic(true);
    originalY = x;
  }


  void act() {
    
    if (stateThw == WAITING) { // Waiting
      attachImage(thwomp[WAITING]);
      if (isPlayerUnderneath()) {
        setStatic(false);
        attachImage(thwomp[1]);
        stateThw = FALLING; // Transition to Falling
      } else {
        setVelocity(0, 0);
        setPosition(getX(), originalY - 8*gridSize);
      }
    } 
    else if (stateThw == 1) { // Falling
      setVelocity(0, fallSpeed);
      if (hasReachedGroundOrPlayer()) {
        stateThw = 2; // Transition to Rising
      }
    } 
    else if (stateThw == 2) { // Rising
      if (getY() > originalY) {
        setVelocity(0, -riseSpeed);
      } else {
        setVelocity(0, 0);
        setPosition(getX(), originalY- 8*gridSize);
        stateThw = 0; // Transition to Waiting
      }
    }
  }


  boolean isPlayerUnderneath() {

    return player.getX() > getX() - gridSize / 2 && player.getX() < getX() + gridSize / 2;
  }

  boolean hasReachedGroundOrPlayer() {

   // return false;
    return player != null && ((getY() >= player.getY() - gridSize && isPlayerUnderneath()) || isTouching("dirt"));
    
  }

}
