
Square square;
void setup() {
  //fullScreen();
  size(1600, 400);
  frameRate(60);
  background(0);

  square = new Square();
}

void draw() {  
  background(0);
  stroke(255);
  translate(0, 350);
  line(0, 0, width, 0);

  PVector push = new PVector(x, 0);
  square.applyForce(push);

  PVector gravity = new PVector(0, 0.2);
  square.applyForce(gravity);

  float fcnCoefficient = 0.05;
  PVector friction = square.vel.copy();
  PVector location = square.loc.copy();
  friction.y = 0;
  friction.normalize();
  friction.mult(-fcnCoefficient);

  if ( location.y >= 0 ) {
    square.applyForce(friction);
  }

  square.display();
  square.motion();
  square.boundary();
}

float x, y;

void keyPressed() {

  PVector surrogate = square.loc.copy();
  if (surrogate.y >= 0 ) {
    if (keyCode == UP ) {
      PVector jump = new PVector(0, -8);
      square.applyJump(jump);
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
