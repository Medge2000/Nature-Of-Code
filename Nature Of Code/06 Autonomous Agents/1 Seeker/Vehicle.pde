class Vehicle {
  PVector loc, vel, acc;
  float maxVel, maxForce;
  int boundary;

  Vehicle(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector(1, 0);
    acc = new PVector();   
    
    boundary = 50;
  }

  void deltaMaxVel(PVector target) {
    float dis = loc.dist(target);
    if (dis < 100) {
      maxVel = map(dis, 0, 100, 0, 5);
      maxForce = map(dis, 0, 100, 0.2, 0.1);
    } else {
      maxVel = 5;
      maxForce = 0.1;
    }
  }

  void seek(PVector target) {
    PVector desire;   
    if (loc.x < boundary || loc.x > width - boundary ||
      loc.y < boundary || loc.y > height - boundary) {
      desire = PVector.sub(new PVector(width/2, height/2), loc);
      maxForce = 0.2;
    } else {
      desire = PVector.sub(target, loc);
    }

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
  }

  void display() {
    float theta = vel.heading2D() +PI/2;

    fill(0);
    stroke(#FF9100);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);
    triangle(0, -10, -4, 10, 4, 10);
    popMatrix();
  }
}
