class FHammer extends FGameObject {

  int timer; // shot range
  float hx, hy, hvx, hvy;
  
 FHammer(float x, float y){
    super();
    timer = 0;

    setPosition (x, y);
   
    setName("hammer");
    attachImage(hammer);
    setRotatable(false);
    
    hx = getX();
    hy = getY();
    
    hvy = -25;
    if (hx < player.getX()){
      hvx = 50; //move to the right to hit the player
    } else {
      hvx = -50;
    }
      
    setVelocity(hvx, hvy);
    setAngularVelocity(-5);
   
    setSensor(true);
   
 }
  
  void act(){
  //  animate(); 
    
    timer++;
  
  //setVelocity(hvx, hvy);
  
  if(timer == 1000){
    world.remove(this);
    hammers.remove(this);
  }

  if (isTouching("wall")){
    world.remove(this);
    hammers.remove(this);
  }
  
  //if (isTouching("player")){
  //  world.remove("this");
  //  hammers.remove(this);
  //  player.setVelocity(player.getVelocityX(), -300);
  //   } else {
  //     player.lives--;
  //     player.setPosition(0,0);
  // }
//}

 if(isTouching("player")){
     if(player.getY() < getY()-gridSize/2) {
     world.remove(this);
     enemies.remove(this);
     player.setVelocity(player.getVelocityX(), -300);
     //} else {
       //player.lives--;
       player.setPosition(0,0);
   }
}
    
  //  if (hvx >0){
  //    player.setVelocity(350, 150);
  //}
  
  //   if (hvx < 0){
  //    player.setVelocity(-350, 150);
  //}
//}

  }
 }
