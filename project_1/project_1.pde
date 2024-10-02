
//mode framework
int mode;
int intro = 1;
int game = 2;
int pause = 3;
int gameover= 4;

int livesL;
int livesR;
int timerL;
int timerR;

float vletters = 0;
boolean up = true;
color blue = #0C12F7;
color red = #F70C28;

// keyboard variables
boolean akey, dkey, rightkey, leftkey;

//person variables
float plx, ply, prx, pry;

//paddle variables

float lx, rx;
float pld, prd;

// ball speed variables
float vrx;
float vry;

float vlx;
float vly;

void setup () {
  size(1400, 700);
  mode = intro;
  reset();
}

void draw() {
  if (mode == intro) {
    intro();
  } else if (mode == game) {
    game();
  } else if (mode == pause) {
    pause();
  } else if (mode == gameover) {
    gameover();
}
}
