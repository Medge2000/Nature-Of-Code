float t = 0;

void setup() {
  //fullScreen();
  size(800,800);
  frameRate(60);
  background(15);
   
}


void draw() {  
  background(0);
  fill(255);
  
  t = t + 0.005;
  
  float x = noise(t);
  x = map(x,0,1,0,width);
  ellipse(x,height/2,40,40);
  
}
