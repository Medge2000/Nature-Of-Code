class Asteroid {
  PVector loc, vel, acc;
  float G, r, mass;

  Asteroid(float x, float y, float _r, PVector _vel) {
    loc = new PVector(x, y);
    vel = _vel;
    acc = new PVector();

    r = _r;
    G = 0.000001;

    mass = (4/3)*(PI*r*r*r);
  }

  PVector attract(Asteroid asteroid) {
    PVector force = PVector.sub(loc, asteroid.loc);
    float dist = force.mag();
    dist = constrain(dist, r*2, width);
    force.normalize();
    float strength = (G*mass*asteroid.mass)/sq(dist);
    force.mult(strength);
    return force;
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void boundary() {
    if (loc.x > width - r|| loc.x < r) vel.x = -vel.x;
    if (loc.y > height - r|| loc.y < r) vel.y = -vel.y;
  }

  void motion() {
    vel.add(acc);
    loc.add(vel);
    vel.limit(15);
    acc.mult(0);
  }  

  void display() {
    stroke(#FE00FF);
    fill(#790079, 100);
    circle(loc.x, loc.y, r*2);
  }
}
