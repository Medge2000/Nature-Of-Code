class Object {
  PVector loc, vel, acc;
  int diameter;

  Object(int _x, int _y) {
    loc = new PVector(_x, _y);
    vel = new PVector();
    acc = new PVector();
    
    diameter = 50;
  }

  void display() {
    fill(0);
    stroke(255);
    ellipse(loc.x, loc.y, diameter, diameter);
  }

  void motion() {
    vel.add(acc);
    loc.add(vel);

    acc.mult(0);
  }

  void apply(PVector force) {
    acc.add(force);
  }
  
  void boundary() {
    if ( loc.x < diameter/2 || loc.x > width - diameter/2 ) {
      vel.x = -vel.x;
    }
    
    if ( loc.y < diameter/2 || loc.y > height - diameter/2 ) {
      vel.y = -vel.y;
    }
  }
  
  void dampening(float dampMag) {
    PVector dampForce = vel.copy();
    dampForce.mult(-dampMag);   
    
    acc.add(dampForce);
  }
}
