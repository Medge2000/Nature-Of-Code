Walker walker;

void setup() {
  //fullScreen();
  size(800, 800);
  frameRate(60);
  background(255);

  walker = new Walker();
}


void draw() {
  for ( int i = 0; i < 250; i++ ) {
    walker.display();
    walker.motion();
  }
}
