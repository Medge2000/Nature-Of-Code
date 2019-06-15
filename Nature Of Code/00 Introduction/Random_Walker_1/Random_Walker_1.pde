Walker walker;

void setup() {
  //fullScreen();
  size(800, 800);
  frameRate(60);
  background(0);

  walker = new Walker();
}


void draw() {
  for ( int i = 0; i < 10; i++ ) {
    walker.display();
    walker.motion();
  }
}
