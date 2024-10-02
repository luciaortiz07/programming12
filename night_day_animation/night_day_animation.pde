int s, m, b;

void setup() {
  size(700,500);
  s = -50; // sun start
  m= 1220; //moon start
  b= -1300; //sky start
}
void draw(){
  background(#69C2ED);
  noStroke();
  //start sky
  fill(#5A5A57);
  rect(0, b, 700, 1150);
  b=b+1;
  //if(b>500) {
  //  b=-950;
  //}
//house
fill(#FCFCFC);
fill(#987E3C);
rect(400, 300, 250, 200);
fill(0);
//roof
triangle(370, 300, 680, 300, 520, 100);
fill(#CBC7BD);
//windows
circle(450, 350, 50);
circle(600, 350, 50);
//door
fill(#F50A41);
rect(490, 400, 70, 100);
circle(525, 400, 70);
fill(0);
circle(500, 450, 7);
//start sun
fill(#F5EE0A);
circle(200, s, 100);
s=s+1;
//if(s>550) {
//  s=-900;
//}
//if(s> 500) {
  //s= 100;
//}
//start moon
fill(255);
circle(200, m, 100);
fill(#5A5A57);
circle(230, m, 100);
m=m-1;
//if(m<-50) {
//  m=1100;
//}
println(frameCount);
if(frameCount == 1950) {
  setup();
  frameCount=0;
}
}
