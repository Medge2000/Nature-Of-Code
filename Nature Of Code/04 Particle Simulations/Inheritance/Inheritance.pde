float knots = 0;

ArrayList<System> systems;

void setup() {
  //fullScreen();
  size(800, 800, P2D);
  frameRate(60);
  background(0);

  systems = new ArrayList<System>();
}

void draw() {  
  background(0);
  
  PVector gravity = new PVector(0, 0.05);
  PVector wind = new PVector(knots, 0);

  for (System system : systems) {
    system.applyForce(wind);
    system.applyForce(gravity);
    system.addParticle();
    system.run();
  }
}

void mousePressed() {
  systems.add(new System(mouseX, mouseY));
}

void keyPressed() {
  if (keyCode == RIGHT) {
    knots += 0.01;
  }
  if (keyCode == LEFT) {
    knots -= 0.01;
  }
}
