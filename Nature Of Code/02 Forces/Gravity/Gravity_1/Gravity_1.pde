Satellite satellite;
Earth earth;
void setup() {
  //fullScreen();
  size(800, 800);
  frameRate(560);
  background(0);

  earth = new Earth();
  satellite = new Satellite(width/2, height/2 - 100);

  keyPressed();
}

void draw() {  
  if (clicked) {
    for ( int i = 0; i < ffx; i++ ) {
      PVector force = earth.attract(satellite);
      satellite.applyForce(force);


      satellite.display();
      satellite.motion();
    }
  }
}

boolean clicked = true;
void mouseClicked() {
  clicked = !clicked;
}

int ffx = 1;
void keyPressed() {
  if (ffx < 1000 ) {
    if (keyCode == RIGHT ) {
      ffx ++;
    }
  }
  if (ffx > 0 ) {
    if (keyCode == LEFT ) {
      ffx --;
    }
  }

  fill(0);
  noStroke();
  rect(0, 0, 90, 26);
  fill(255);
  textSize(28);
  text("x" + ffx, 3, 25);
}
