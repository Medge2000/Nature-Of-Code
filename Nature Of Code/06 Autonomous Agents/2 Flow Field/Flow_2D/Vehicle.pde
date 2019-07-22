class Vehicle {
  PVector loc, vel, acc;
  float maxVel, maxForce;
  int boundary;

  Vehicle(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector(1, 0);
    acc = new PVector();   

    boundary = 50;

    maxVel = 3;
    maxForce = 0.1;
  }

  void orientate() {
    PVector desire, flow;   

    if (loc.x < width && loc.x > 0 && loc.y < height && loc.y > 0) 
      flow = field.flow[int(loc.x/field.resolution)][int(loc.y/field.resolution)];
    else flow = vel;

    desire = flow;
    desire.setMag(maxVel);
    PVector orientate = PVector.sub(desire, vel);
    orientate.limit(maxForce);  
    applyForce(orientate);
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void motion() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);

    if (loc.x > width + 10) 
      loc.x = -10;
    if (loc.x < -10) 
      loc.x = width + 10;
    if (loc.y > height + 10) 
      loc.y = -10;
    if (loc.y < -10) 
      loc.y = height + 10;
  }

  void display() {
    float theta = vel.heading2D() +PI/2;

    fill(0);
    stroke(#FF9100, 150);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);
    triangle(0, -10, -4, 10, 4, 10);
    popMatrix();
  }
}
