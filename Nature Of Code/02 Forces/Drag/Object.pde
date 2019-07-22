class Ball {
  PVector loc, vel, acc;
  int mass;

  Ball(int Mass, int locx, int locy) {
    mass = Mass;
    loc = new PVector(locx, locy);
    vel = new PVector();
    acc = new PVector();
  }

  void applyForce(PVector force) {
    PVector fm = PVector.div(force, mass);
    acc.add(fm);
  }

  void motion() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(1);
    fill(255,255,0);
    ellipse(loc.x, loc.y, mass*4, mass*4);
  }

  void boundary() {
    if (loc.y > height - mass*2 - 1) {
      vel.y *= -0.9; 
      if (abs(vel.y) < 0.1) {
        loc.y = height - mass*2 - 1;
        vel.y = 0;
      }
    }
  }
}
