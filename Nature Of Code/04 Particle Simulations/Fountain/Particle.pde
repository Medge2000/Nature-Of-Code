class Particle {
  PVector loc, vel, acc;
  float longevity;

  Particle(int lx, int ly, float vx, float vy) {
    loc = new PVector(lx, ly);
    vel = new PVector(vx, vy);
    acc = new PVector();

    longevity = 255;
  }

  void display() {
    fill(150, longevity);
    stroke(255, longevity);
    ellipse(loc.x, loc.y, 20, 20);
  }

  void motion() {
    vel.add(acc);
    loc.add(vel);

    acc.mult(0);
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void lifespan() {
    longevity -= 1.8;
  }
}
