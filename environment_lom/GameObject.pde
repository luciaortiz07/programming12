class GameObject{
  PVector loc;
  PVector vel;
  float size;
  float lives;
  
  //default
  GameObject(){
   loc = new PVector(0,0,0);
   size = 10;
   lives = 1;
  }
  
  GameObject(float x, float y, float z, float s){
   loc = new PVector(x,y,z);
   size = s;
   lives = 1;
  }
  
  void act(){
    
  }
  
  void show(){
  pushMatrix();
  translate(loc.x, loc.y, loc.z);
  fill(white);
  stroke(100);
  box(size);
  popMatrix();
  }
  
  
}
