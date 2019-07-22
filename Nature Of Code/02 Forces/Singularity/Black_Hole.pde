class BlackHole {
  PVector acc, vel, loc;
  float gravity;

  BlackHole(int _x, int _y) {
    loc = new PVector(_x, _y);
    vel = new PVector();
    acc = new PVector();
    
    gravity = 1000;
  }
  
  PVector attract (Photon photon) {
    PVector force = PVector.sub(loc, photon.loc);
    float d = force.mag();
    force.normalize();
    float magnitude = (gravity)/sq(d);
    force.mult(magnitude);
    return force;
  }
  
  void display() {
    stroke(255);
    fill(0);
    ellipse(loc.x, loc.y,20,20);
  }
}
