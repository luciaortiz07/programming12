class Particles extends GameObject {

  // instance variables
  float w; // random particle size
  int t; // transparency
  

  // constructor
  Particles (PVector l) { //
    t = 255;
    lives = 1;
    loc = l;
    w = (random(5, 10));
     
    vel = new PVector(random(-.5,.5), random(-.5,.5), random(0, 0.5));
    
  }

  // behaviour functions
  void show () {

    // particles visual
  //  fill(red, t);
  
  pushMatrix();
  //translate(loc.x, loc.y, loc.z);
  //box(w);
  
  if(like == true)  texturedCube(loc.x, loc.y, loc.z, thumbup, random(5,10));
  if(like == false) texturedCube(loc.x, loc.y, loc.z, thumbdown, random(5,10));
  
  popMatrix();
  }

  void act () {
    super.act();
    
    loc.x = loc.x + vel.x;
    loc.y = loc.y + vel.y;
    loc.z = loc.z + vel.z;

    // particle transparency timer
    t = t - 7;
    if (t <= 0) lives = 0;
    println(t); 
   
  }
}
