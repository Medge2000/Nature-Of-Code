class Earth {
  PVector loc;
  float G, mass;

  Earth() {

    loc = new PVector(width/2, height/2);
    G = 0.2;
    mass = 50;
  }

  void display() {
    stroke(75, 255, 255);
    fill(0, 0, 186);
    ellipse(loc.x, loc.y, mass, mass);
  }

  PVector attract (Satellite satellite) {
    PVector force = PVector.sub(loc, satellite.loc);
    float d = force.mag();
    force.normalize();
    float magnitude = (G * mass * satellite.mass)/sq(d);
    force.mult(magnitude);
    return force;
  }
}
