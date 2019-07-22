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

  for (System system : systems) {
    system.addParticle();
    system.run();
  }
}

void mousePressed() {
  systems.add(new System(mouseX, mouseY));
}
