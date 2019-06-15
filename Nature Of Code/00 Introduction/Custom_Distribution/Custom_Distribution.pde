float n1, n2, n3;

void setup() {
  //fullScreen();
  size(800,800);
  frameRate(60);
  background(0);
}

void draw() {
  for ( int i = 0; i < 1; i++ ) {
    n1 = random(height);
    n2 = random(width);
    n3 = n1*n1;

    if ( n2 < n3 ) {
      stroke(n2/width * 255);
      line(n2, height, width - 2 * n2, n2);
    }
  }
}
