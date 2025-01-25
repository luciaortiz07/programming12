void drawFocalPoint () {
  pushMatrix();
  translate(focusX, focusY, focusZ);
  sphere(5);
  popMatrix();
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
