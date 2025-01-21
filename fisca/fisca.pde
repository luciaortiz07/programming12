import fisica.*;
int x;
int xn;
Button gravityButton;
Button FBodyButton;
int n = 1;
//palette
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);
color blueb = #2D0EE5;


boolean mouseReleased;
boolean wasPressed;

//assets
PImage redBird;
PImage boxImage;

FPoly topPlatform;
FPoly bottomPlatform;

//fisica
FWorld world;

void setup() {
  //make window
  fullScreen();
  x=-130;
  xn=-103;
  //load resources
  redBird = loadImage("red-bird.png");
  boxImage = loadImage("box-image.png");
  gravityButton = new Button("GRAVITY", 180, 800, 300, 100, blueb, yellow);
  FBodyButton = new Button("FBody", 580, 800, 300, 100, red, yellow);

  //initialise world
  makeWorld();
  //add terrain to world
  makeTopPlatform();
  makeBottomPlatform(); //bucketshape
}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}

//===========================================================================================

void makeTopPlatform() {
  topPlatform = new FPoly();

  //plot the vertices of this platform
  topPlatform.vertex(-100, height*.1);
  topPlatform.vertex(width*0.8, height*0.4);
  topPlatform.vertex(width*0.8, height*0.4+100);
  topPlatform.vertex(-100, height*0.1+100);

  // define properties
  topPlatform.setStatic(true);
  topPlatform.setFillColor(brown);
  topPlatform.setFriction(0.1);

  //put it in the world
  world.add(topPlatform);
}

//===========================================================================================

void makeBottomPlatform() {
  bottomPlatform = new FPoly();

  // Create a bucket shape by defining vertices
  bottomPlatform.vertex(width * 0.7, height * 0.8);  // bottom-right corner
  bottomPlatform.vertex(width * 0.3, height * 0.8);  // bottom-left corner
  bottomPlatform.vertex(width * 0.25, height * 0.6); // top-left vertex
  bottomPlatform.vertex(width * 0.5, height * 0.75);  // inward (concave) vertex
  bottomPlatform.vertex(width * 0.75, height * 0.6); // top-right vertex

  // define properties
  bottomPlatform.setStatic(true);
  bottomPlatform.setFillColor(brown);
  bottomPlatform.setFriction(0.1);

  //put it in the world
  world.add(bottomPlatform);
}

//===========================================================================================

void draw() {
  println("x: " + mouseX + " y: " + mouseY);
  background(blue);
  click();

  //if (frameCount % 20 == 0) {  //Every 20 frames ...
  //  makeCircle();
  //  makeBlob();
  //  makeBox();
  //  makeBird();
  //  click();

  //  stroke(0);
  //  fill(255);
  //  strokeWeight(5);
  //}
  
  
   FBodyButton.show();
  if (FBodyButton.clicked) {
    if (frameCount % 20 == 0) {  //Every 20 frames ...
    makeCircle();
    makeBlob();
    makeBox();
    makeBird();
    click();

    stroke(0);
    fill(255);
    strokeWeight(5);
  }
  }
  
  textSize(70);
  text("FBody", 580, 800);
  
  stroke(0);
    fill(255);
    strokeWeight(5);
  println(mouseReleased, wasPressed, gravityButton.clicked);

  world.step();  //get box2D to calculate all the forces and new positions
  noStroke();
  ellipse(x+100, 100, 100, 70);
  ellipse(x+110, 130, 100, 70);
  ellipse(x+135, 110, 100, 70); //-------------------- behind
  x=x+3;
  if (x > 1500) {
    x=-130;
  }

  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw
  ellipse(xn+100, 100, 100, 70);
  ellipse(xn+110, 130, 100, 70);
  ellipse(xn+135, 110, 100, 70);  //---------------infront
  xn=xn+2;
  if (xn > 1500) {
    xn=-130;
  }
  
   gravityButton.show();
    if (gravityButton.clicked) {
  //    background(0);
    world.setGravity(0, -100); 
  }else{
  world.setGravity(0, 900);
  }
  textSize(70);
  text("GRAVITY", 180, 800);
}

//===========================================================================================

void makeCircle() {
  FCircle circle = new FCircle(50);
  circle.setPosition(random(width), -5);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(red);

  //set physical properties
  circle.setDensity(0.2);
  circle.setFriction(1);
  circle.setRestitution(1);

  //add to world
  world.add(circle);
}

//===========================================================================================

void makeBlob() {
  FBlob blob = new FBlob();

  //set visuals
  blob.setAsCircle(random(width), -5, 50);
  blob.setStroke(0);
  blob.setStrokeWeight(2);
  blob.setFillColor(yellow);

  //set physical properties
  blob.setDensity(0.2);
  blob.setFriction(1);
  blob.setRestitution(0.25);

  //add to the world
  world.add(blob);
}

//===========================================================================================

void makeBox() {
  float boxSize = 50; // Make it a square
  FBox box = new FBox(boxSize, boxSize); // Create square box
  box.setPosition(random(width), -5);

  // Set visuals
  box.setStroke(0);
  box.setStrokeWeight(2);
  box.setFillColor(green); // Keep the green color for now

  PImage resizedImage = boxImage.copy();
  resizedImage.resize((int)boxSize, (int)boxSize);
  box.attachImage(resizedImage);

  // Set physical properties
  box.setDensity(0.2);
  box.setFriction(1);
  box.setRestitution(1); // Increase restitution to make it bouncier

  // Add to the world
  world.add(box);
}

//===========================================================================================

void makeBird() {
  FCircle bird = new FCircle(48);
  bird.setPosition(random(width), -5);

  //set visuals
  bird.attachImage(redBird);

  //set physical properties
  bird.setDensity(0.8);
  bird.setFriction(1);
  bird.setRestitution(0.5);
  world.add(bird);
}
