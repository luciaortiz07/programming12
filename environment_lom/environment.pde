void drawMap () {
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c == dullBlue) {
        texturedCube(x * gridSize - 2000, height - gridSize, y * gridSize - 2000, quartz, gridSize);
        texturedCube(x * gridSize - 2000, height - gridSize * 2, y * gridSize - 2000, quartz, gridSize);
        texturedCube(x * gridSize - 2000, height - gridSize * 3, y * gridSize - 2000, quartz, gridSize);
      }
      if (c == black) {
        texturedCube(x * gridSize - 2000, height - gridSize, y * gridSize - 2000, quartz, gridSize);
        texturedCube(x * gridSize - 2000, height - gridSize * 2, y * gridSize - 2000, quartz, gridSize);
        texturedCube(x * gridSize - 2000, height - gridSize * 3, y * gridSize - 2000, quartz, gridSize);
      }
       if (c == blue) {
        texturedCube(x * gridSize - 2000, height - gridSize, y * gridSize - 2000, quartz, gridSize);
        texturedCube(x * gridSize - 2000, height - gridSize * 2, y * gridSize - 2000, art3, gridSize);
        texturedCube(x * gridSize - 2000, height - gridSize * 3, y * gridSize - 2000, quartz, gridSize);
      }
       if (c == yellow) {
        texturedCube(x * gridSize - 2000, height - gridSize, y * gridSize - 2000, quartz, gridSize);
        texturedCube(x * gridSize - 2000, height - gridSize * 2, y * gridSize - 2000, art4, gridSize);
        texturedCube(x * gridSize - 2000, height - gridSize * 3, y * gridSize - 2000, quartz, gridSize);
      }
       if (c == orange) {
        texturedCube(x * gridSize - 2000, height - gridSize, y * gridSize - 2000, quartz, gridSize);
        texturedCube(x * gridSize - 2000, height - gridSize * 2, y * gridSize - 2000, art5, gridSize);
        texturedCube(x * gridSize - 2000, height - gridSize * 3, y * gridSize - 2000, quartz, gridSize);
      }
       if (c == purple) {
        texturedCube(x * gridSize - 2000, height - gridSize, y * gridSize - 2000, quartz, gridSize);
        texturedCube(x * gridSize - 2000, height - gridSize * 2, y * gridSize - 2000, art2, gridSize);
        texturedCube(x * gridSize - 2000, height - gridSize * 3, y * gridSize - 2000, quartz, gridSize);
      }
       if (c == magenta) {
        texturedCube(x * gridSize - 2000, height - gridSize, y * gridSize - 2000, quartz, gridSize);
        texturedCube(x * gridSize - 2000, height - gridSize * 2, y * gridSize - 2000, art1, gridSize);
        texturedCube(x * gridSize - 2000, height - gridSize * 3, y * gridSize - 2000, quartz, gridSize);
      }
       if (c == grey) {
        texturedCube(x * gridSize - 2000, height - gridSize, y * gridSize - 2000, quartz, gridSize);
       texturedSphere(x * gridSize -1950, height - gridSize*1.2, y * gridSize - 1950, "small");
      }
        if (c == pink) {
        texturedSphere(x * gridSize -1950, height - gridSize*0.2, y * gridSize - 1950, "big");
        texturedCube(x * gridSize - 1975, height - gridSize*1.1, y * gridSize - 1975, lace2, gridSize/2);
       texturedCube(x * gridSize - 1975, height - gridSize*1.3, y * gridSize - 1975, lace2, gridSize/2);
       texturedCube(x * gridSize - 1963, height - gridSize*1.4, y * gridSize - 1963, lace2, gridSize/4);
      texturedSphere(x * gridSize -1950, height - gridSize*1.5, y * gridSize - 1950, "small");
       
       
      }
    }
  }
}

void drawFloor(int start, int end, int level, int gap) {
  stroke(255);
  int x = start;
  int z = start;
  
  while (z < end) {
    texturedCube(x, level, z, floor, gap);
    x = x + gap;
    if ( x >= end){
    z = z + gap;
    x = start;
    }
  }
}
