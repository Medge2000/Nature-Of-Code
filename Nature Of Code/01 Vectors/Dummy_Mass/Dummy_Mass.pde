Mass mass;

void setup() {
  //fullScreen();
  size(300, 1000);
  frameRate(60);
  background(255);

  mass = new Mass();
}


void draw() { 
  background(255);

  noFill();
  stroke(0);
  rect(5, 5, width - 10, height - 10);

  mass.display();
  mass.motion();
  mass.window();
}
