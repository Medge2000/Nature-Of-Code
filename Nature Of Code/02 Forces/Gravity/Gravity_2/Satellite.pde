class Satellite {
  PVector loc, vel, acc;
  float mass;

  Satellite(int locx, int locy, float velx, float vely, int _mass) {
    loc = new PVector(locx, locy);
    vel = new PVector(velx, vely);
    acc = new PVector(0, 0);

    mass = _mass;
  }

  void display() {
    fill(150);
    stroke(255);
    if ( loc.x < width + 30 && loc.x > -30 && loc.y < height + 30 && loc.y > -30 ) { 
      ellipse(loc.x, loc.y, mass, mass);
    }
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void motion() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }
}
