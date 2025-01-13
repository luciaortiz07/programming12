class FHammerBro extends FGameObject {
  int direction = L;
  int speed = 50;
  int frame = 0;
  int frameCounter = 0;

  int hmTimer, threshold;


  FHammerBro(float x, float y) {
    super();
    setPosition(x, y);
    setName("hammerbro");
    setRotatable(false);

    hmTimer = 0;
    threshold = 100;
  }

  void act() {
    animate();
    collide();
    move();
    throwH();
  }

  void animate() {
    frameCounter++;
    if (frameCounter >= 5) {
      if (frame >= hammerbro.length) frame =0;
      if (direction == R) attachImage(hammerbro[frame]);
      if (direction == L) attachImage(hammerbro[frame]);
      frame++;
      frameCounter = 0;
    }
  }


  void collide() {
    if (isTouching("wall")) {
      direction *= -1;
      setPosition(getX()+direction, getY());
    }

    if (isTouching("player")) {
      if (player.getY() < getY()-gridSize/2) {
        tarzanYell.rewind();
        tarzanYell.play();
        world.remove(this);
        enemies.remove(this);
        player.setVelocity(player.getVelocityX(), -300);
      } else {
        bump.rewind();
        bump.play();
        lives--;
        player.setPosition(0, 0);
      }
    }
    
    if (isTouching("knife")) {
     tarzanYell.rewind();
     tarzanYell.play();
     world.remove(this);
   }
    
  }
  
  

  void throwH() {
    //hx = getX();
    //hy = getY();

    hmTimer++;
    if (hmTimer >= threshold) {

      FHammer hm = new FHammer(getX(), getY()- 2* gridSize);
      enemies.add(hm); //may need to be hammers
      world.add(hm);
      
      hmTimer = 0;
    }
  }


  void move() {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
  }
}
