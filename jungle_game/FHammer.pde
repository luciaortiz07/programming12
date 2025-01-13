class FHammer extends FGameObject {

  int timer; // shot range
  float hx, hy, hvx, hvy;
  
 FHammer(float x, float y){
    super();
    timer = 0;

    setPosition (x, y);
   
    setName("hammer");
    attachImage(bullet);
    setRotatable(false);
    
    hx = getX();
    hy = getY();
    
    hvy = 200*(hy - player.getY())/(hx - player.getX());
    
      if (hx < player.getX()) hvx = 500; //move to the right to hit the player
      if (hx > player.getX()){
         hvx = -500; //move to the left to hit the player
         hvy = hvy *-1; //correcting sign for velocity
      }
 
    setVelocity(hvx, hvy);
   
    setSensor(true);
   
 }
  
  void act(){
  //  animate(); 
    
    timer++;
  
  //setVelocity(hvx, hvy);
  
  if(timer == 500){
    world.remove(this);
    enemies.remove(this); 
  }

  if (isTouching("wall")){
    world.remove(this);
    enemies.remove(this); 
  }
  

 if(isTouching("player") && player.state == 1){
     bump.rewind();
     bump.play();
     world.remove(this);
     enemies.remove(this);
     lives--;
     player.setPosition(0,0);
 }

  }
 }
