//------- buttons

void tactileRect(float x, float y, int w, int h){
  fill(#226A1D);
  noStroke();
  rect(x, y, w, h);
  if(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h){
  strokeWeight(4);
  stroke(0);
   rect(x, y, w, h);
}
}

//-----reverse image ----

PImage revImage(PImage img){
  scale(-1, 1);
  return img;
}
