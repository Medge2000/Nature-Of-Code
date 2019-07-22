class Earth {
  PVector loc;
  float G, mass;
  
  Earth() {
    loc = new PVector(width/2, height/2);
    G = 1;
    mass = 10;
  }
  
  PVector attract (Satellite satellite) {
    PVector force = PVector.sub(loc, satellite.loc);
    float d = force.mag();
    force.normalize();
    float magnitude = (G * mass * satellite.mass)/(d);
    force.mult(magnitude);
    return force;
  }
}
