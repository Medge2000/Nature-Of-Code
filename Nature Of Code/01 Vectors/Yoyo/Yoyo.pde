Mass [] mass;

void setup() {
  //fullScreen();
  noCursor();
  size(1200, 800);
  frameRate(60);
  background(0);

  mass = new Mass[25];

  for ( int i = 0; i< mass.length; i++ ) {
    mass[i] = new Mass();
  }
}


void draw() { 
  background(0);

  for ( int i = 0; i< mass.length; i++ ) {
    mass[i].display();
    mass[i].motion();
    mass[i].boundary();
  }
}
