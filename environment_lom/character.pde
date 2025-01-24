void drawFocalPoint () {
  pushMatrix();
  translate(focusX, focusY, focusZ);
  sphere(5);
  popMatrix();
}

void controlCamera() {
  
  if (wkey && canMoveForward()) {
    eyeZ = eyeZ + sin(leftRightHeadAngle) * 10;
    eyeX = eyeX + cos(leftRightHeadAngle) * 10;
  }
  if (skey) {
    eyeZ = eyeZ - sin(leftRightHeadAngle) * 10;
    eyeX = eyeX - cos(leftRightHeadAngle) * 10;
  }
  if (akey) {
    eyeZ = eyeZ - sin(leftRightHeadAngle + PI/2) * 10;
    eyeX = eyeX - cos(leftRightHeadAngle + PI/2) * 10;
  }
  if (dkey && canMoveRight()) {
    eyeZ = eyeZ - sin(leftRightHeadAngle - PI/2) * 10;
    eyeX = eyeX - cos(leftRightHeadAngle - PI/2) * 10;
  }
  
  if (upkey){
      objects.add(new bullet());
      like = true;
  }
  
  if (downkey){
      objects.add(new bullet());
      like = false;
  }

  if (skipFrame == false) {
    leftRightHeadAngle = leftRightHeadAngle + (mouseX - pmouseX) * 0.01;
    upDownHeadAngle = upDownHeadAngle + (mouseY - pmouseY) * 0.01;
  }
  if (upDownHeadAngle > PI/2.5) upDownHeadAngle = PI/2.5;
  if (upDownHeadAngle < -PI/2.5) upDownHeadAngle = -PI/2.5;

  focusX = eyeX + cos(leftRightHeadAngle) * 300;
  focusZ = eyeZ + sin(leftRightHeadAngle) * 300;
  focusY = eyeY + tan(upDownHeadAngle) * 300;


  if (mouseX > width-2) {
    rbt.mouseMove(3, mouseY);
    skipFrame = true;
  } else if (mouseX < 2) {
    rbt.mouseMove(width-3, mouseY);
    skipFrame = true;
  } else {
    skipFrame = false;
  }
  
  println(eyeX + cos(leftRightHeadAngle)*250, eyeX + cos(leftRightHeadAngle + radians(90))*250);
}
  
  boolean canMoveForward() {
    float fwdx,  fwdz; //,fwdy,;
    float leftx, leftz; //lefty, 
    float rightx,  rightz; //righty,
    int mapx, mapz, maplx, maply, maprx, mapry;
    
    fwdx = eyeX + cos(leftRightHeadAngle)*250;
    fwdz = eyeZ + sin(leftRightHeadAngle)*250;
    
    leftx = eyeX + cos(leftRightHeadAngle + radians(20))*200;
    leftz = eyeZ + sin(leftRightHeadAngle + radians(20)) * 200;
    
    rightx = eyeX + cos(leftRightHeadAngle - radians(20))*200;
    rightz = eyeZ + sin(leftRightHeadAngle - radians(20)) * 300;
     
    mapx = int(fwdx + 2000)/gridSize;
    mapz = int(fwdz + 2000)/gridSize;
    
   // println(fwdx, mapx, fwdz, mapz);
    
    maplx = int(leftx + 2000)/gridSize;
    maply = int(leftz + 2000)/gridSize;
    
    maprx = int(rightx + 2000)/gridSize;
    mapry = int(rightz + 2000)/gridSize;
    
    if (map.get(mapx, mapz) == white && map.get(maplx, maply) == white && map.get(maprx, mapry) == white) {
      return true;
    } else {
      return false;
    }
}


boolean canMoveRight() {
    float fwdx,  fwdz; //,fwdy,;
    //float leftx, leftz; //lefty, 
    //float rightx,  rightz; //righty,
    int mapx, mapz; //, maplx, maply, maprx, mapry;
    
    fwdx = eyeX + cos(leftRightHeadAngle + radians(90))*200;
    fwdz = eyeZ + sin(leftRightHeadAngle + radians(90))*200;
    
    //leftx = eyeX + cos(leftRightHeadAngle + radians(110))*200;
    //leftz = eyeZ + sin(leftRightHeadAngle + radians(110)) * 200;
    
    //rightx = eyeX + cos(leftRightHeadAngle - radians(110))*200;
    //rightz = eyeZ + sin(leftRightHeadAngle - radians(110)) * 300;
     
    mapx = int(fwdx + 2000)/gridSize;
    mapz = int(fwdz + 2000)/gridSize;
    
   // println(fwdx, mapx, fwdz, mapz);
    
    //maplx = int(leftx + 2000)/gridSize;
    //maply = int(leftz + 2000)/gridSize;
    
    //maprx = int(rightx + 2000)/gridSize;
    //mapry = int(rightz + 2000)/gridSize;
    
    //if (map.get(mapx, mapz) == white && map.get(maplx, maply) == white && map.get(maprx, mapry) == white) {
      if (map.get(mapx, mapz) == white){
      return true;
    } else {
      return false;
    }
}


void loadImages(){
map = loadImage("map.png");
floor = loadImage("floor.jpg");
quartz = loadImage("quartz.png");
diam = loadImage("diamond.png");
thumbup = loadImage("thumbup.tiff");
thumbdown = loadImage("thumbdown.png");
art1 = loadImage("art1.jpg");
art2 = loadImage("art2.jpg");
art3 = loadImage("art3.jpg");
art4 = loadImage("art4.jpg");
art5 = loadImage("art5.jpg");
lace = loadImage("lace.jpg");
lace2 = loadImage("lace2.jpg");
}
