void texturedSphere(float x, float y, float z, String size) {
  pushMatrix();
translate(x, y, z);

 if (size == "big") shape(globeBig);
 
 if (size == "small") shape(globeSmall);
 
  popMatrix();
}
