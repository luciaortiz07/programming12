class bullet extends GameObject {
 PVector dir;
 float speed;
 
 bullet() {
  super(eyeX, eyeY, eyeZ, 5);
  speed = 50;
  float vx = cos(leftRightHeadAngle);
  float vz = sin(leftRightHeadAngle);
  float vy = tan(upDownHeadAngle);
  dir = new PVector(vx, vy, vz);
  dir.setMag(speed);
 }
 
 void act(){
  int hitx = int(loc.x + 2000) / gridSize;
  int hity = int(loc.z + 2000) / gridSize;
  if(map.get(hitx,  hity) == white && canMoveForward()) {
    loc.add(dir);
  } else {
    lives = 0;
    for (int i = 0; i < 10; i++){
      objects.add(new Particles(loc));
 }
 }
 }
}
