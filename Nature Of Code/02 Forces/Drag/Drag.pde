Ball[] balls = new Ball[10]; 
Air air;
Liquid liquid;
void setup() {
  //fullScreen();
  size(1000, 600);
  frameRate(60);
  background(255);

  reset();
  
  air = new Air(0, 0, width, height/2, 0.005);
  liquid = new Liquid(0, height/2, width, height, 0.25);
}

void draw() {  
  background(255);

  air.display();
  liquid.display();
  
  for (Ball ball : balls) {
    PVector gravity = new PVector(0, 0.05*ball.mass);
    ball.applyForce(gravity);

    if (air.contains(ball)) {
      PVector drag = air.drag(ball);
      ball.applyForce(drag);
    }

    if (liquid.contains(ball)) {
      PVector drag = liquid.drag(ball);
      ball.applyForce(drag);
    }

    ball.display();
    ball.motion();
    ball.boundary();
  }
}

void mousePressed() {
  reset();
}

void reset() {
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball(int(random(2,16)), 75 + ((i*(width - 50))/balls.length), 50);
  }
}
