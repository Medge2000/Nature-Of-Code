PVector pushUp = new PVector(0, -0.2);
float x, y;

Object ball;
void setup() {
  //fullScreen();
  size(800, 800);
  frameRate(60);
  
  ball = new Object();
}


void draw() {  
  background(0);

  PVector push = new PVector(x, y);
  ball.applyForce(push);
  
  PVector gravity = new PVector(0, 0.2);
  ball.applyForce(gravity);

  ball.display();
  ball.motion();
  ball.boundary();
}

void keyPressed() {

  if ( key == CODED ) {
    if (keyCode == UP ) {
      y = -0.2;
    }
    if (keyCode == DOWN ) {
      y = 0.2;
    }
    if (keyCode == RIGHT ) {
      x = 0.2;
    }
    if (keyCode == LEFT ) {
      x = -0.2;
    }
  }
}

void keyReleased() {
  x = 0;
  y = 0;
}
