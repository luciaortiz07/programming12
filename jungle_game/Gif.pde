class Gif {
  PImage[] frames;
  int numFrames;
  int speed;
  int currentFrame;
  float x, y, w,h;
  
  Gif(String pre, String post, int n, int s, float _x, float _y, float _w, float _h){
    frames = new PImage [n];
    numFrames = n;
    speed = s;
    currentFrame = 0;
    x= _x;
    y= _y;
    
    int i=0;
    while (i < numFrames) {
      frames[i] =loadImage(pre +i + post);
      i++;
    }
    
    w= _w;
    h= _h;
  }
  
  void show() {
    if(currentFrame == numFrames) currentFrame = 0;
    image(frames[currentFrame], x, y, w, h);
    if (frameCount % speed == 0) currentFrame++;
  }
}

    
