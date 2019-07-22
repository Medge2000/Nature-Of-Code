class Particle {
  PVector loc, vel, acc;
  float longevity, brightness, theta, deltaTheta;;
  int size;

  Particle(PVector l) {
    loc = new PVector(l.x, l.y);
    vel = new PVector(random(-1, 1), random(-2.5, 1));
    acc = new PVector();

    longevity = 255;  
    brightness = 0.3;
    size = 20;
  }

  void display() {
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
