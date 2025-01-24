PImage dirt;
PImage grasst;
PImage grass1;
PImage grass2;

float rotx, roty;

void setup(){
  size(800, 800, P3D);
  dirt = loadImage("Dirt_(texture)_JE2_BE2.png");
  grass1 = loadImage("Grass_Block_Side1.png");
  grass2 = loadImage("Grass_Block_Side2.png");
  grasst = loadImage("Grass_Block_Top_C.png");
  textureMode(NORMAL);
}

void draw() {
 background(0); 
 
  pushMatrix();
  translate(width/2, height/2, 0);
  scale(200);
  rotateX(rotx);
  rotateY(roty);
  
  noStroke();
  
beginShape(QUADS);
texture(grasst);
//top
//     x,y,z,tx,ty
vertex(0,0,0,0,0);
vertex(1,0,0,1,0);
vertex(1,0,1,1,1);
vertex(0,0,1,0,1);
endShape();

beginShape(QUADS);
texture(dirt);
//bottom
vertex(0,1,0,0,0);
vertex(1,1,0,1,0);
vertex(1,1,1,1,1);
vertex(0,1,1,0,1);
endShape();

beginShape(QUADS);
texture(grass1);
//front
vertex(0, 0, 1, 0, 0); 
vertex(1, 0, 1, 1, 0); 
vertex(1, 1, 1, 1, 1); 
vertex(0, 1, 1, 0, 1); 

//back
vertex(0, 0, 0, 0, 0); 
vertex(1, 0, 0, 1, 0); 
vertex(1, 1, 0, 1, 1); 
vertex(0, 1, 0, 0, 1); 
endShape();

beginShape(QUADS);
texture(grass2);
//left
vertex(0, 0, 0, 0, 0); 
vertex(0, 1, 0, 1, 0); 
vertex(0, 1, 1, 1, 1); 
vertex(0, 0, 1, 0, 1); 

//right
vertex(1, 0, 0, 0, 0);
vertex(1, 1, 0, 1, 0); 
vertex(1, 1, 1, 1, 1); 
vertex(1, 0, 1, 0, 1); 
endShape();

  popMatrix();
}
void mouseDragged(){
  rotx = rotx + (pmouseY - mouseY)*0.01;
  roty = roty + (pmouseX - mouseX)*-0.01;
}
