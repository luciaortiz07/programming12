//platformer game
import fisica.*;

//music
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//gifs
Gif tarzanIntro;
Gif win;
Gif lose;
Gif grass;
Gif cascade;
Gif croc;

//fonts
PFont africanF;

// sound variables
Minim minim;
AudioPlayer introMusic;
AudioPlayer level1Music;
AudioPlayer level2Music;
AudioPlayer level3Music;
AudioPlayer tarzanYell;
AudioPlayer bump;
AudioPlayer knifeMusic;
AudioPlayer loseMusic;
AudioPlayer rescueMusic;
AudioPlayer inmuneMusic;


//player variables
boolean wkey, akey, skey, dkey, spacekey;
boolean spaceReleased, wasPressed, clicked;

//npc variables
boolean npcText;
int txtCount = 0;
int txtTimer = 0;
int nMom = 0;

int lives;
boolean rescue = false;
float playerSpeed = 3;
boolean movingLeft = false;
boolean movingRight = false;
boolean jumping = false;
float jumpForce = 5;
String player_sel;
int frameTint = 0;

//mode framework
int mode;
int intro = 1;
int select = 2;
int game = 3;
int levelOne = 4;
int levelTwo = 5;
int levelThree = 6;
int pause = 7;
int gameover= 8;

//Images
PImage map0;
PImage map1;
PImage map2;
PImage jungle;
PImage bridge;
PImage dirt;
PImage treetopc;
PImage treetopl;
PImage treetopr;
PImage trunk;
PImage spikes;
PImage connector;
PImage banana;
PImage waterfall;
PImage liana;
PImage tarzan_sel;
PImage jane_sel;
PImage bullet;
PImage knife;
PImage elephants;
PImage mom;
PImage pauseImg;

//------ Array images ------

PImage[] tarzan;
PImage[] jane;
PImage[] waterFrames;
PImage[] goomba;
PImage[] thwomp;
PImage[] hammerbro; 
PImage[] gorillaz;

//------- Array string -----

String[] npcMom;
float[] locTxt;

//--------------------------

//-------- colors ----------
color black = #000000; //dirt
color red = #d50000; //lava
color yellow = #ffd740; //bridge
color brown = #795548; //trunk
color grey = #9e9e9e; //spikes
color green = #8bc34a; //treetopc
color pink = #f48fb1; //leftleaves
color orange = #ff6d00; //goombatiger
color col_clayton = #aeea00; //clayton
color purple= #7e57c2; //rightleaves
color white = #ffffff; //finish
color indigo = #ea80fc; //wall
color violet = #4a148c;
color navyblue = #1a237e; //connector
color col_banana = #e91e63;
color col_waterfall = #2196f3;
color col_liana = #22b14c;
color col_gorillaz = #ffcdd2;
color col_mom = #9c5a3c;
color col_elephant = #464646;
color col_pause = #fff9bd;
//-------------------------------------------

//---- game variables -----
int gridSize = 20;
float zoom = 1.5;
int level;


//---- objects ------------

FWorld world;
FPlayer player;
ArrayList<FGameObject> terrain;
ArrayList<FGameObject> enemies;

//---------------------------

void setup() {
  size (800, 800);
  
  //initializing variables
  mode = intro; 
  wkey = akey = skey = dkey = spacekey = false;
  npcText = false;
  
  africanF = loadFont("Phosphate-Inline-48.vlw");
  lives = 5;
  npcMom = new String[5];
  locTxt = new float[5];
  
  
  //load resources
  loadImages();
  loadGifs();
  loadMusic();
  loadText();
  
  //world
  loadWorld(map0); 
  player_sel ="TARZAN";
  loadPlayer();
}

void draw() {
  textFont(africanF);
  
  if (mode == intro) {
    intro();
 } else if (mode == select) {
  select();
} else if (mode == levelOne) {
  levelOne();
}else if (mode == game) {
  game();  
} else if (mode == levelTwo) {
  levelTwo();
} else if (mode == levelThree) {
  levelThree();  
} else if (mode == gameover) {
  gameover();
} else if (mode == pause) {
  pause();
} else {
  println("mode: " + "error");
  }
}

//-----------dry functions---------

//------------GIFS------------

void loadGifs(){
  tarzanIntro = new Gif("tarzan/frame_","_delay-0.1s.gif", 24, 5, 0, 0, width, height);
  win = new Gif ("win/frame_","_delay-0.06s.gif", 52, 5, 0, 0, width, height);
  lose= new Gif ("lose/frame_","_delay-0.08s.gif", 11, 5, 0, 0, width, height);
  grass = new Gif ("grass/frame_","_delay-0.03s.gif", 48, 5, 0, 0, width, height);
  cascade = new Gif ("cascade/frame_","_delay-0.05s.gif", 47, 5, 0, 0, width, height);
  croc = new Gif ("croc/frame_","_delay-0.04s.gif", 73, 5, 0, 0, width, height);
  }
  
//---------MUSIC-------------
void loadMusic(){
  //music variables
  minim = new Minim(this);
  introMusic = minim.loadFile("intro.mp3");
  level1Music = minim.loadFile("level1.mp3");
  level2Music = minim.loadFile("level2.mp3");
  level3Music = minim.loadFile("level3.mp3");
  loseMusic = minim.loadFile("lose.mp3");
  rescueMusic = minim.loadFile("rescue.mp3");
  tarzanYell = minim.loadFile("tarzanYell.mp3");
  bump = minim.loadFile("bump.mp3");
  knifeMusic = minim.loadFile("knifeMusic.mp3");
  inmuneMusic = minim.loadFile("inmuneMusic.mp3");
}
  
//------------IMAGES----------

void loadImages(){
  
  // Load map image
  map0 = loadImage("map0.png");
  map1 = loadImage("map1.png");
  map2 = loadImage("map2.png");
  jungle = loadImage("jungle.png");
  
  dirt = loadImage("dirt.png");
  dirt.resize(gridSize, gridSize);
  elephants = loadImage("elephants.png");
  elephants.resize(gridSize*4, gridSize*4);
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
  waterfall = loadImage("waterfall.png");
  waterfall.resize(gridSize*4, 86);
  liana = loadImage("liana.png");
  liana.resize(gridSize*10, gridSize*10);
  bullet = loadImage("bullet.png");
  bullet.resize(gridSize, gridSize);
  knife = loadImage("knife.png");
  knife.resize(gridSize, gridSize);
  
  mom = loadImage("mom.png");
  mom.resize(gridSize*2, gridSize*2);
  
  pauseImg = loadImage("pauseImg2.png");
  pauseImg.resize(gridSize*8, gridSize*8);
 
  
  banana = loadImage("banana.png");
  banana.resize(gridSize, gridSize);
  
  tarzan_sel = loadImage("tarzan.png");
  jane_sel = loadImage("jane.png");
  
  
  //----TARZAN----
tarzan = new PImage[2];
tarzan[0] = loadImage("tarzan0.png");
tarzan[0].resize(gridSize*2, gridSize*2);
tarzan[1] = loadImage("tarzan1.png");
tarzan[1].resize(gridSize*2, gridSize*2);

  //----JANE----
jane = new PImage[2];
jane[0] = loadImage("jane0.png");
jane[0].resize(gridSize*2, gridSize*2);
jane[1] = loadImage("jane1.png");
jane[1].resize(gridSize*2, gridSize*2);
  
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
hammerbro[0] = loadImage("clayton0.png");
hammerbro[0].resize(gridSize*2, gridSize*2);
hammerbro[1] = loadImage("clayton1.png");
hammerbro[1].resize(gridSize*2, gridSize*2);

//----ZOMBIE GORILLA----
gorillaz = new PImage[2];
gorillaz[0] = loadImage("gorilla0.png");
gorillaz[0].resize(gridSize*4, gridSize*4);
gorillaz[1] = loadImage("gorillaz.png");
gorillaz[1].resize(gridSize*4, gridSize*4);

//------- WATER ------------
waterFrames = new PImage[6];
   // Load all water animation frames
    for (int i = 0; i < 6; i++) {
    waterFrames[i] = loadImage("water" + i + ".png");
    waterFrames[i].resize(gridSize, gridSize);
  }
}

void loadText(){
  npcMom[0] = "Touching banana's makes you invincible for 10 seconds.";
  npcMom[1] = "Animals are enemies. Avoid or jump on top of them to continue.";
  npcMom[2] = "Defeat the zombie gorilla to win level 3";
  npcMom[3] = "Clayton is here to kill your friend. You must save them!";
  npcMom[4] = "Tarzan and Jane must Reunite."; 
}
//-----------WORLD-------------------------------

void loadWorld(PImage img){
  Fisica.init(this);
  terrain = new ArrayList<FGameObject>();
  enemies = new ArrayList<FGameObject>();
  
  world = new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);

  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      color c = img.get(x, y);
      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setStatic(true);

      if (c == black) { //dirtblock
        b.attachImage(dirt);
        b.setFriction(30);
        b.setName("dirt");
        world.add(b);
      }
      
      if (c == indigo) { //wall
       b.attachImage(dirt);
       b.setName("wall");
       world.add(b);
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
      
      if (c == purple) { //treetopr
        b.attachImage(treetopr);
        b.setFriction(30);
        b.setName("treetopr");
        world.add(b);
      }
      
        if (c == navyblue) { //connector
        b.attachImage(connector);
        b.setFriction(30);
        b.setName("connector");
        world.add(b);
      }
      
      if (c == yellow) { //bridge
        FBridge br = new FBridge(x*gridSize, y*gridSize);
        terrain.add(br);
        world.add(br);  
      }
      
       if (c == grey) { //spikes
        b.attachImage(spikes);
        b.setFriction(30);
        b.setName("spikes");
        world.add(b);
      }
      
       if (c == orange) { //goomba
       FGoomba gmb = new FGoomba(x*gridSize, y*gridSize);
       enemies.add(gmb);
        world.add(gmb);
      }
      
      if (c == violet) { //thwomp
       FThwomp twp = new FThwomp(x*gridSize, y*gridSize);
       enemies.add(twp);
        world.add(twp);
      }
      
      if (c == col_clayton) { //clayton
       FHammerBro hmb = new FHammerBro(x*gridSize, y*gridSize);
       enemies.add(hmb);
        world.add(hmb);
      }
      
      if (c == col_gorillaz) { //gorilla zombie
       FGorillaz gz = new FGorillaz(x*gridSize, y*gridSize);
       enemies.add(gz);
       world.add(gz);
      }
      
       if (c == red) { //water
        FLava lava = new FLava(x*gridSize, y*gridSize);
        terrain.add(lava);
        world.add(lava);
      }
      
      if (c == col_elephant) { //elephants
        b.attachImage(elephants);
        b.setFriction(30);
        b.setName("elephant");
        world.add(b); 
      }
      
      if (c == col_banana){
        b.attachImage(banana);
        b.setFriction(30);
        b.setName("banana");
        world.add(b); 
      }
      
      if (c == col_waterfall){
        b.attachImage(waterfall);
        b.setFriction(30);
        b.setName("waterfall");
        world.add(b);
      }
      
      if (c == col_liana){
        b.attachImage(liana);
        b.setFriction(30);
        b.setName("liana");
        world.add(b);
      }
      
      if (c == col_mom){
        b.attachImage(mom);
        b.setFriction(30);
        b.setName("mom");
        world.add(b);
        
       
      }
     
      
      if (c == white){
        if(player_sel =="TARZAN") b.attachImage(jane[0]);
        if(player_sel =="JANE") b.attachImage(tarzan[0]);
        b.setFriction(30);
        b.setName("love");
        world.add(b);
      }
      
      if (c == col_pause){
        b.setFriction(30);
        b.setName("pause");
        b.attachImage(pauseImg);
        world.add(b);
        strokeWeight(3);
        stroke(255);
        text("PAUSE",b.getX(),b.getY());
      }
    }
  }
}



//---------------PLAYER--------------------

void loadPlayer() {
  player = new FPlayer();
  world.add(player);
  player.setRotatable(false);
  
}

//-------------RESET ----------------
void reset(int l){
  
  if (l == 0){   
  loadWorld(map0); 
  
  rescueMusic.pause();
  loseMusic.pause();
  
  introMusic.rewind();
  level1Music.rewind();
  level2Music.rewind();
  level3Music.rewind();
  inmuneMusic.rewind();
  
  txtCount = 0;
  loadPlayer();
  npcText = false;
  txtCount = 0;
  txtTimer = 0;
  nMom = 0;
  lives = 5;
  rescue = false;
  
  int i =0;
  if(i < 5){
    locTxt[i] = 0;
  }
}

 if (l == 1){ 
  txtCount = 0;
  loadPlayer();
  npcText = false;
  txtTimer = 0;
  nMom = 0;
  
  int i =0;
  if(i < 5){
    locTxt[i] = 0;
  }
}

if (l == 2){ 
  txtCount = 2;
  loadPlayer();
  npcText = false;
  txtTimer = 0;
  nMom = 0;
  
  int i = 2;
  if(i < 5){
    locTxt[i] = 0;
  }
}

if (l == 3){ 
  txtCount = 3;
  loadPlayer();
  npcText = false;
  txtTimer = 0;
  nMom = 0;
  
  int i = 3;
  if(i < 5){
    locTxt[i] = 0;
  }
}

}
