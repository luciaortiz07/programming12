class FKnife extends FGameObject {

  int timer; // shot range
  int knifeSpeed;
  
  float kx, ky, kvx, kvy;
  
 FKnife(float x, float y){
    super();
    timer = 0;

    setPosition (x, y);
   
    setName("knife");
    attachImage(knife);
    setRotatable(false);
    
    kx = getX();
    ky = getY();
   
    
    setVelocity(500, -300);
   
    setSensor(true);
   
 }
  
  void act(){
    
    timer++;
  
  if(timer == 100){
    world.remove(this);
    enemies.remove(this); 
  }

  if (isTouching("wall")){
    world.remove(this);
    enemies.remove(this); 
  }
  

  }
 }
