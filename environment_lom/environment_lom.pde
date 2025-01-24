import java.awt.Robot;
//color pallette
color black = #000000;   // quartz
color white = #FFFFFF;   // empty space
color dullBlue = #7092BE; //#07092b;  // nether
color red = #f44336; // camara
color magenta = #e91e63; //art1
color purple = #673ab7; //art2
color blue = #03a9f4; //art3
color yellow = #ffeb3b; //art4
color orange = #ff9800; //art5
color grey = #9e9e9e; // sculpt
color pink = #f8bbd0; //dress

//map
int gridSize;
PImage map;
PImage floor;
PImage quartz;
PImage diam;
PImage thumbup;
PImage thumbdown;
PImage art1;
PImage art2;
PImage art3;
PImage art4;
PImage art5;
PImage lace;
PImage lace2;

PShape globeSmall;
PShape globeBig;


Robot rbt;
boolean skipFrame;

boolean wkey, skey, akey, dkey, upkey, downkey, like;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, upX, upY, upZ;
float leftRightHeadAngle, upDownHeadAngle;


//Game Objects
ArrayList<GameObject> objects;

void setup () {
  
  //instanciate game object list
  objects = new ArrayList<GameObject>();
  
  //size(800,800,P3D);
  fullScreen(P3D);
  textureMode(NORMAL);
  wkey = skey = akey = dkey = upkey = downkey = false;
  like = true;
  eyeX = width/2;
  eyeY = 9*height/10; //things look higher 
  eyeZ = height/2;
  
  focusX = width/2;
  focusY = height/2;
  focusZ = height/2-100;
  
  upX = 0;
  upY = 1;
  upZ = 0;
  leftRightHeadAngle = radians(270);
  noCursor();
  
  //initialize map
  loadImages();
  gridSize = 100;

  try {
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  skipFrame = false;
  println("?");
  noStroke();
  globeSmall = createShape(SPHERE, 20);
  globeSmall.setTexture(quartz);
  
  globeBig = createShape(SPHERE, gridSize*0.7);
  globeBig.setTexture(lace);
 
}



void draw () {
  background(0);
  pointLight(255, 255, 255, eyeX, eyeY, eyeZ);
  
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, upX, upY, upZ);

  drawFloor(-2000, 2000, height , gridSize); //floor
  drawFloor(-2000, 2000, height - gridSize * 4, gridSize); //ceiling
  drawFocalPoint();
  controlCamera();
  drawMap();
  
  int i = 0;
  while (i< objects.size()){
   GameObject obj = objects.get(i);
   obj.act();
   obj.show();
   if (obj.lives == 0){
     objects.remove(i);
   } else {
     i++;
   }
  }
   
}
