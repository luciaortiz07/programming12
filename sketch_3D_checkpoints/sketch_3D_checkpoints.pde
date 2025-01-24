float rotx, roty;

void setup(){
  size(800, 800, P3D);
}
void draw(){
  background (255);
 ball(200, 600, 0, #A735FA, 150);
  cube(300, 200, 0, #FF0000, 200);
  cube(600, 500, 0, #0000FF, 200);
}
void ball(float x, float y, float z, color c , float size) {
  pushMatrix();
translate(x, y, z);
  rotateX(rotx);
  rotateY(roty);
  fill(c);
  strokeWeight(3);
  sphere(size);
  popMatrix();
}
void cube(float x, float y, float z, color c , float size) {
  pushMatrix();
 translate(x, y, z);
  rotateX(rotx);
  rotateY(roty);
  //rotateZ();
  fill(c);
  stroke(0);
  strokeWeight(3);
  box(size); //side length
  popMatrix();
}
  
void mouseDragged(){
  rotx = rotx + (pmouseY - mouseY)*0.01;
  roty = roty + (pmouseX - mouseX)*-0.01;
}
