class Button {
  //instance variables
 int x, y, w, h;
 boolean clicked;
 color highlight, normal;
 String text;
 PImage img;
 
 //constructer
 Button(String t, int _x, int _y, int _w, int _h, color norm, color high) {
 x= _x;
 y= _y;
 w= _w;
 h= _h;
 text = t;
 highlight = high;
 normal = norm;
 clicked = false;
}
Button(PImage pic, int _x, int _y, int _w, int _h, color norm, color high) {
 x= _x;
 y= _y;
 w= _w;
 h= _h;
img = pic;
highlight = high;
 normal = norm;
 clicked = false;
}

void show() {
  drawRect();
  drawLabel();
  checkForClick(); 
  }

 boolean touchingMouse(){
  return mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2;
 }


 void drawRect() {
    rectMode(CENTER);
  if (touchingMouse()) {
  fill(highlight);
}else {
  fill(normal);
}
stroke(0);
strokeWeight(4);
rect(x, y, w, h, 30);
}


 void drawLabel() {
  //text label
textAlign(CENTER, CENTER);
if(touchingMouse()) {
fill(normal);
}else {
  fill(highlight);
}
if(img == null){
textSize(w/4);
text(text, x, y);
 } else {
   imageMode(CENTER);
   image(img, x,y, w*.8, h*.8);
}
}

 void checkForClick(){
  if (mouseReleased && touchingMouse()) {
clicked =true;
}else {
  clicked=false;
    }
}

}
