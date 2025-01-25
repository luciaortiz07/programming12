void controlCamera() {
  
  if (wkey && canMoveForward()) {
    eyeZ = eyeZ + sin(leftRightHeadAngle) * 10;
    eyeX = eyeX + cos(leftRightHeadAngle) * 10;
  }
  if (skey && canMoveBackward()) {
    eyeZ = eyeZ - sin(leftRightHeadAngle) * 10;
    eyeX = eyeX - cos(leftRightHeadAngle) * 10;
  }
  if (akey  && canMoveLeft()) {
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
}
  
  boolean canMoveForward() {
    float fwdx,  fwdz; //,fwdy,;
    float leftx, leftz; //lefty, 
    float rightx,  rightz; //righty,
    int mapx, mapz, maplx, maplz, maprx, maprz;
    
    fwdx = eyeX + cos(leftRightHeadAngle)*150;
    fwdz = eyeZ + sin(leftRightHeadAngle)*150;
    
    //---- corners -----
    
    leftx = eyeX + cos(leftRightHeadAngle + radians(30)) * 200;
    leftz = eyeZ + sin(leftRightHeadAngle + radians(30)) * 200;
    
    rightx = eyeX + cos(leftRightHeadAngle - radians(30)) * 200;
    rightz = eyeZ + sin(leftRightHeadAngle - radians(30)) * 200;
     
    //-------------------
     
    mapx = int(fwdx + 2000)/gridSize;
    mapz = int(fwdz + 2000)/gridSize;
      
    maplx = int(leftx + 2000)/gridSize;
    maplz = int(leftz + 2000)/gridSize;
    
    maprx = int(rightx + 2000)/gridSize;
    maprz = int(rightz + 2000)/gridSize;
    
    if (map.get(mapx, mapz) == white && map.get(maplx, maplz) == white && map.get(maprx, maprz) == white) {
      return true;
    } else {
      return false;
    }
}


boolean canMoveRight() {
    float fwdx,  fwdz, leftx, leftz, rightx, rightz;
    int mapx, mapz, maplx, maplz, maprx, maprz;
    
    
    fwdz = eyeZ - sin(leftRightHeadAngle - PI/2) * 100;
    fwdx = eyeX - cos(leftRightHeadAngle - PI/2) * 100;
    
    //---- corners -----
    
    leftz = eyeZ - sin(leftRightHeadAngle - PI/2 + radians(30)) * 200;
    leftx = eyeX - cos(leftRightHeadAngle - PI/2 + radians(30)) * 200;
    
    rightz = eyeZ - sin(leftRightHeadAngle - PI/2 - radians(30)) * 200;
    rightx = eyeX - cos(leftRightHeadAngle - PI/2 - radians(30)) * 200;
    
    //-------------------
     
    mapx = int(fwdx + 2000)/gridSize;
    mapz = int(fwdz + 2000)/gridSize;
    
    maplx = int(leftx + 2000)/gridSize;
    maplz = int(leftz + 2000)/gridSize;
    
    maprx = int(rightx + 2000)/gridSize;
    maprz = int(rightz + 2000)/gridSize;
    
    if (map.get(mapx, mapz) == white && map.get(maplx, maplz) == white && map.get(maprx, maprz) == white) {
      return true;
    } else {
      return false;
    }
}
boolean canMoveLeft() {
    float fwdx,  fwdz, leftx, leftz, rightx, rightz;
    int mapx, mapz, maplx, maplz, maprx, maprz;
    
    
    fwdz = eyeZ - sin(leftRightHeadAngle + PI/2) * 100;
    fwdx = eyeX - cos(leftRightHeadAngle + PI/2) * 100;
    
    //---- corners -----
    
    leftz = eyeZ - sin(leftRightHeadAngle + PI/2 + radians(30)) * 200;
    leftx = eyeX - cos(leftRightHeadAngle + PI/2 + radians(30)) * 200;
    
    rightz = eyeZ - sin(leftRightHeadAngle + PI/2 - radians(30)) * 200;
    rightx = eyeX - cos(leftRightHeadAngle + PI/2 - radians(30)) * 200;
    
    //-------------------
     
    mapx = int(fwdx + 2000)/gridSize;
    mapz = int(fwdz + 2000)/gridSize;
    
    maplx = int(leftx + 2000)/gridSize;
    maplz = int(leftz + 2000)/gridSize;
    
    maprx = int(rightx + 2000)/gridSize;
    maprz = int(rightz + 2000)/gridSize;
    
    if (map.get(mapx, mapz) == white && map.get(maplx, maplz) == white && map.get(maprx, maprz) == white) {
      return true;
    } else {
      return false;
    }
}

boolean canMoveBackward() {
    float bwdx,  bwdz, leftx, leftz, rightx, rightz;
    int mapx, mapz, maplx, maplz, maprx, maprz;
    
    bwdz = eyeZ - sin(leftRightHeadAngle) * 50;
    bwdx = eyeX - cos(leftRightHeadAngle) * 50;
    
    //---- corners -----
    
    leftz = eyeZ - sin(leftRightHeadAngle + radians(30)) * 200;
    leftx = eyeX - cos(leftRightHeadAngle + radians(30)) * 200;
    
    rightz = eyeZ - sin(leftRightHeadAngle - radians(30)) * 200;
    rightx = eyeX - cos(leftRightHeadAngle - radians(30)) * 200;
    
    //-------------------
     
    mapx = int(bwdx + 2000)/gridSize;
    mapz = int(bwdz + 2000)/gridSize;
    
    maplx = int(leftx + 2000)/gridSize;
    maplz = int(leftz + 2000)/gridSize;
    
    maprx = int(rightx + 2000)/gridSize;
    maprz = int(rightz + 2000)/gridSize;
    
    if (map.get(mapx, mapz) == white && map.get(maplx, maplz) == white && map.get(maprx, maprz) == white) {
      return true;
    } else {
      return false;
    }
}
