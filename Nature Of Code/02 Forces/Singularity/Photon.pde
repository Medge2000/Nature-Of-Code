class Photon {
  PVector acc, vel, loc;

  Photon(float _x, float _y, float _velx, float _vely) {
    loc = new PVector(_x, _y);
    vel = new PVector(_velx, _vely);
    acc = new PVector();
  } 

  void applyForce(PVector force) {
    acc.add(force);
  }

  void motion() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }

  void display() {
    stroke(0, 255, 255, 80);
    strokeWeight(1);
    point(loc.x, loc.y);
  }

  void boundary() {
    if (vel.mag() < 5) {
      if (loc.x < 0 || loc.x > width) {
        vel.x = -vel.x;
      }

      if (loc.y < 0 || loc.y > height) {
        vel.y = -vel.y;
      }
    }
  }
}
