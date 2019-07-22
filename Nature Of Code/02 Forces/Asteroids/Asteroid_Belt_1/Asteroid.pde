class Asteroid {
  PVector loc, vel, acc;
  int r;
  float G;

  Asteroid(float x, float y, int _r) {
    loc = new PVector(x, y);
    vel = new PVector();
    acc = new PVector();

    r = _r;
    G = 0.01;
  }

  PVector attract(Asteroid asteroid) {
    PVector force = PVector.sub(loc, asteroid.loc);
    float dist = force.mag();
    dist = constrain(dist, r*2, width);
    force.normalize();
    float strength = (G*r*asteroid.r)/sq(dist);
    force.mult(strength);
    return force;
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void boundary() {
    if (loc.x > width || loc.x < 0) vel.x = -vel.x;
    if (loc.y > height || loc.y < 0) vel.y = -vel.y;
  }

  void motion() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }  

  void display() {
    stroke(#FE00FF);
    fill(#790079, 100);
    circle(loc.x, loc.y, r);
  }
}
