class System {
  ArrayList <Particle> particles;
  int lx, ly;

  System(int x, int y) {
    particles = new ArrayList<Particle>();

    lx = x;
    ly = y;
  }

  void addParticle() { 
    for (int f = 0; f < 1; f++) {
      if (frameCount % 2 == 0) {
        particles.add(new Particle(lx, ly, random(-1, 1), random(-2.5, 1)));
      }
    }
  }

  void run() {
    PVector gravity = new PVector(0, 0.05);
    float wx = 0;
    float wy = 0;
    for (int i = particles.size() - 1; i >= 0; i--) {


      if ( key == CODED ) {
        if (keyCode == UP ) {
          wy = -0.05;
        }
        if (keyCode == DOWN ) {
          wy = 0.05;
        }
        if (keyCode == RIGHT ) {
          wx = 0.05;
        }
        if (keyCode == LEFT ) {
          wx = -0.05;
        }
      }

      PVector wind = new PVector(wx, wy);


      Particle particle = particles.get(i);

      particle.applyForce(wind);
      particle.applyForce(gravity);
      particle.motion();
      particle.lifespan();
      particle.display();

      if (particle.longevity <= 0) {
        particles.remove(particle);
      }
    }
  }
}
