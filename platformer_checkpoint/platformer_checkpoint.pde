//platformer game
import fisica.*;

FWorld world;
//FBox player;

color black = #000000;
color red = #FA353C;
color redt= #f51d00;
color blue= #00b7ef;
color yellow = #ffff00;
color brown = #795548;
color grey = #9e9e9e;
color green = #8bc34a;
color pink = #f48fb1;
color orange = #f7790a;
color purple= #d500f9;
color white = #ffffff;
color cyan = #18ffff;
color indigo = #e1bee7;
color violet = #4a148c;
color navyblue = #2f3699;
PImage map;
PImage ice;
PImage bridge;
PImage stone;
PImage trampoline;
PImage treetopc;
PImage treetopl;
PImage treetopr;
PImage trunk;
PImage spikes;
PImage connector;
PImage hammer;

int gridSize = 20;
float zoom = 1.5;
int hammerCounter = 0;

boolean wkey, akey, skey, dkey, upkey, downkey, rightkey, leftkey;

float playerSpeed = 3;
boolean movingLeft = false;
boolean movingRight = false;
boolean jumping = false;
float jumpForce = 5;

//FPlayer;
FPlayer player;
ArrayList<FGameObject> terrain;
ArrayList<FGameObject> enemies;
ArrayList<FGameObject> hammers;

//------ LAVA ------
ArrayList<FLava> lavaBlocks;
PImage[] lavaFrames;

//------Image arrays------
PImage[] goomba;
PImage[] thwomp;
PImage[] hammerbro;

int frameCount = 6; 

//-----------------------

void setup() {
  size(600, 600);
  
  // Set up Fisica world
  Fisica.init(this);
  terrain = new ArrayList<FGameObject>();
  enemies = new ArrayList<FGameObject>();
  hammers = new ArrayList<FGameObject>();
  loadImages();
  loadWorld(map);
  loadPlayer();
  
  //lavaBlocks = new ArrayList<FLava>();
  lavaFrames = new PImage[frameCount];
  
   // Load all lava animation frames
  for (int i = 0; i < frameCount; i++) {
    lavaFrames[i] = loadImage("lava" + i + ".png");
    lavaFrames[i].resize(gridSize, gridSize);
  }


}

void loadImages(){
  // Load map image
  map = loadImage("map1.png");
  ice = loadImage("ice.png");
  ice.resize(gridSize, gridSize);
  stone = loadImage("stone.png");
  stone.resize(gridSize, gridSize);
  trampoline = loadImage("trampoline.png");
  trampoline.resize(gridSize, gridSize);
  trunk = loadImage("trunk.png");
  trunk.resize(gridSize, gridSize);
  treetopc = loadImage("treetopc.png");
  treetopc.resize(gridSize, gridSize);
  treetopr = loadImage("treetopr.png");
  treetopr.resize(gridSize, gridSize);
  treetopl = loadImage("treetopl.png");
  treetopl.resize(gridSize, gridSize);
  connector = loadImage("connector.png");
  connector.resize(gridSize, gridSize);
  spikes = loadImage("spike.png");
  spikes.resize(gridSize, gridSize);
  bridge = loadImage("bridge.png");
  bridge.resize(gridSize, gridSize);

  //----GOOMBA----
goomba = new PImage[2];
goomba[0] = loadImage("goomba0.png");
goomba[0].resize(gridSize, gridSize);
goomba[1] = loadImage("goomba1.png");
goomba[1].resize(gridSize, gridSize);

//----THWOMP----
thwomp = new PImage[2];
thwomp[0] = loadImage("thwomp0.png");
thwomp[0].resize(gridSize, gridSize);
thwomp[1] = loadImage("thwomp1.png");
thwomp[1].resize(gridSize, gridSize);

//----HAMMERBRO----
hammerbro = new PImage[2];
hammerbro[0] = loadImage("hammerbro0.png");
hammerbro[0].resize(gridSize, gridSize);
hammerbro[1] = loadImage("hammerbro1.png");
hammerbro[1].resize(gridSize, gridSize);

hammer = loadImage("hammer.png");
hammer.resize(gridSize, gridSize);
}

//------------------------------------------

void loadPlayer() {
  player = new FPlayer();
  world.add(player);
  player.setRotatable(false);
}

void draw() {
  background(255);
  drawWorld();
  actWorld();
}

void actWorld(){
  player.act();
  for(int i = 0; i < terrain.size(); i++) {
    FGameObject t =terrain.get(i);
    t.act();
    //if(b instanceof FBridge) ((FBridge) b).act();
  }

   for(int i = 0; i < enemies.size(); i++) {
    FGameObject e = enemies.get(i);
    e.act();
}

  for(int i = 0; i < hammers.size(); i++) {
    FGameObject h = hammers.get(i);
    h.act();
    
  }
  
}
  
void drawWorld() {
  pushMatrix();
  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}

//-------------------------------------------
void loadWorld(PImage img) {
  world = new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);

  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      color c = img.get(x, y);
      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setStatic(true);

      if (c == black) { //stoneblock
        b.attachImage(stone);
        b.setFriction(30);
        b.setName("stone");
        world.add(b);
      }
      
      if (c == indigo) { //wall
       b.attachImage(stone);
       b.setName("wall");
       world.add(b);
      }

      if (c == redt) { //trampoline
        b.attachImage(trampoline);
        b.setFriction(30);
        b.setName("trampoline");
        world.add(b);
        b.setRestitution(2);
        
      }
        if (c == brown) { //trunk
        b.attachImage(trunk);
        b.setFriction(30);
        b.setName("trunk");
        world.add(b);
      }
        if (c == green) { //treetopc
        b.attachImage(treetopc);
        b.setFriction(30);
        b.setName("treetopc");
        world.add(b);
      }
      if (c == pink) { //treetopl
        b.attachImage(treetopl);
        b.setFriction(30);
        b.setName("treetopl");
        world.add(b);
      }
      if (c == orange) { //treetopr
        b.attachImage(treetopr);
        b.setFriction(30);
        b.setName("treetopr");
        world.add(b);
      }
        if (c == grey) { //connector
        b.attachImage(connector);
        b.setFriction(30);
        b.setName("connector");
        world.add(b);
        
      }
      if (c == blue) { //iceblock
        b.attachImage(ice);
        b.setFriction(-200);
        b.setName("ice");
        world.add(b);
      }
      if (c == purple) { //bridge
        FBridge br = new FBridge(x*gridSize, y*gridSize);
        terrain.add(br);
        world.add(br);
        
      }
       if (c == yellow) { //spikes
        b.attachImage(spikes);
        b.setFriction(30);
        b.setName("spikes");
        world.add(b);
      }
       if (c == cyan) { //goomba
       FGoomba gmb = new FGoomba(x*gridSize, y*gridSize);
       enemies.add(gmb);
        world.add(gmb);
      }
      if (c == violet) { //thwomp
       FThwomp twp = new FThwomp(x*gridSize, y*gridSize);
       enemies.add(twp);
        world.add(twp);
      }
      if (c == navyblue) { //hammerbro
        FHammerBro hmb = new FHammerBro(x*gridSize, y*gridSize);
        enemies.add(hmb);
        world.add(hmb);

     
        //FHammer hm = new FHammer(x*gridSize, y*gridSize);
        //hammers.add(hm);
        //world.add(hm);
}
      
       if (c == white) { //lava
        //FLava lava = new FLava(x*gridSize, y*gridSize,lavaFrames);
        FLava lava = new FLava(x*gridSize, y*gridSize);
        terrain.add(lava);
        //lavaBlocks.add(lava);
        world.add(lava);
      }
    }
  }
}
