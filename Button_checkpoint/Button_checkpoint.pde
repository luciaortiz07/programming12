//colour 
color blue = #2D0EE5;
color green = #0EE53E;
color pink = #FA42B7;
color yellow = #FAF442;
color black = #000000;
color white = #FFFFFF;

boolean mouseReleased;
boolean wasPressed;
PImage buttonpic;
color backgr;


Button[] myButtons;
int n = 4;

void setup() {
  size(600, 600);
  myButtons = new Button[n];
  backgr = white;
 buttonpic = loadImage("puppy.jpeg");
  myButtons[0] = new Button("BLUE", 160, 100, 300, 100, blue, yellow);
  myButtons[1] = new Button("PINK", 450, 250, 200, 100, pink, green);
  myButtons[2] = new Button(buttonpic, 150, 350, 150, 150, green, blue);
  myButtons[3] = new Button("YELLOW", 430, 450, 300, 100, yellow, pink);
}

void draw() {
   background(backgr);
   click();

  stroke(0);
  fill(255);
  strokeWeight(5);

  int i = 0;
   while (i < n) {
    myButtons[i].show();
	if(myButtons[i].clicked){  
	  backgr = myButtons[i].normal;
	}
    i++;
   }
  println(mouseReleased);
}
