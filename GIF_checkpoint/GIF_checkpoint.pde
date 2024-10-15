Gif sunset, seagull1, seagull2, seagull3;

void setup() {
  size(800,800);
  sunset= new Gif("sunset/frame_","_delay-0.04s.gif", 31, 5, -100, -100, width, height);
  seagull1= new Gif("seagull/frame_", "_delay-0.04s.gif", 26, 5, 300, 0);
  seagull2= new Gif("seagull/frame_", "_delay-0.04s.gif", 26, 3, 150, 200, 200, 200);
  seagull3= new Gif("seagull/frame_", "_delay-0.04s.gif", 26, 1, 80, 340, 100, 100);
}

void draw() {
  sunset.show();
  seagull1.show();
  seagull2.show();
  seagull3.show();
}
