void select(){
 
  background (0);
  image(tarzan_sel, 100, 200, 200, 400);
  
  image(jane_sel, 500, 200, 200, 400);
  textSize(80);
  text("SELECT A PLAYER", 100, 130);
 // button
 fill(0);
  tactileRect(100, 650, 200, 75);
  fill(#CB8108);
  textSize(45);
  text("TARZAN", 125, 700);
  fill(0);
  tactileRect(500, 650, 200, 75);
  textSize(45);
  fill(#CB8108);
  text("JANE", 550,700);
}

void selectClicks(){
if (mouseX > 100 && mouseX < 300 && mouseY > 650 && mouseY < 725) {
  player_sel = "TARZAN";
  mode = levelOne;
}
if (mouseX > 500 && mouseX < 700 && mouseY > 650 && mouseY < 725) {
  player_sel = "JANE";
  mode = levelOne;
}
}
