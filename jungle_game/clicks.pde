void keyPressed() {
  if(key== 'S' || key == 's') skey = true;
  if(key== 'W' || key == 'w') wkey = true;
  if(key== 'A' || key == 'a') akey = true;
  if(key== 'D' || key == 'd') dkey = true;
  //if(key== 'Q' || key == 'q') qkey = true;
  //if(key== 'E' || key == 'e') ekey = true;
 if(key == ' ') spacekey = true;
 //if(keyCode == DOWN) downkey = true;
 //if(keyCode == UP) upkey = true;
 //if(keyCode == LEFT) leftkey = true;
 if(keyCode == RIGHT) rightkey = true;
}
 
void keyReleased() {
  if(key== 'S' || key == 's') skey = false;
  if(key== 'W' || key == 'w') wkey = false;
  if(key== 'A' || key == 'a') akey = false;
  if(key== 'D' || key == 'd') dkey = false;
  if(key == ' ') spacekey = false;
  
  //if(key== 'Q' || key == 'q') qkey = false;
  //if(key== 'E' || key == 'e') ekey = false;
  //if(keyCode == DOWN) downkey = false;
 //if(keyCode == UP) upkey = false;
 //if(keyCode == LEFT) leftkey = false;
 if(keyCode == RIGHT) rightkey = false;
}
 
void mouseReleased() {
   if (mode == intro) {
   introClicks();
   }
   if (mode == select) {
   selectClicks();
   }
   if (mode == pause) {
   pauseClicks();
   }
   
   //if (mode == game) {
   //gameClicks();
   //}
   if (mode == levelOne) {
   levelOneClicks();
   }
   if (mode == levelTwo) {
   levelTwoClicks();
   }
   if (mode == levelThree) {
   levelThreeClicks();
   }
   if (mode == gameover) {
   gameoverClicks();
   }
}

//---------click SPACEBAR --------
void checkForClick(){
  if (spaceReleased) {
    clicked =true;
  }else {
    clicked=false;
    }
}

void click() {
     spaceReleased = false;
  if (spacekey) wasPressed = true;
  if (wasPressed && !spacekey == true) {
    spaceReleased = true;
    wasPressed = false;
  }
}
