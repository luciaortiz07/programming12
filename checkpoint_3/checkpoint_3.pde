void setup() {
  size(400, 400); 
  background(255); 
}
void draw() {
  drawHouse(100, 200, 200); 
}
void drawHouse(float x, float y, float size) {
  pushMatrix(); 
  translate(x, y);
  fill(150, 100, 50); 
  rect(0, 0, size, size);
  fill(200, 0, 0);
  triangle(0, 0, size / 2, -size / 2, size, 0); 
  drawWindow(120, 50, 50);  // Left window
  drawWindow(60, 150, 80);  // Right window
  drawWindow(30, 50, 50);  // Door window
  popMatrix(); 
}
void drawWindow(float x, float y, float size) {
  pushMatrix(); 
  translate(x, y); 
  fill(0, 255, 255); 
  rect(0, 0, size, size); 
  popMatrix();
}
