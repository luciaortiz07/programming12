//checkpoint 4

//mode framework
int mode;
int pattern1 = 1;
int pattern2 = 2;
int pattern3 = 3;
int count = 0;

//colours
color red= #FA0808;
color blue= #082DFA;

color pink= #FF62C8;
color purple= #9925CB;

color green= #31E82F;
color yellow= #FFF048;

void setup () {
 
  size(1000, 750);
  mode = pattern1;
  background (red);
}
void draw() {
   if (mode == pattern1) {
  pattern1();
  } else if (mode == pattern2) {
  pattern2();
  } else if (mode == pattern3) {
  pattern3();
   }
}
