class Square {
  PVector loc, vel, acc;
  int side = 36;
  
  Square() {
    loc = new PVector(width/2, 0);
    vel = new PVector();
    acc = new PVector();  
  }

  void display() {
    strokeWeight(1);
    stroke(255);
    fill(60);
    rect(loc.x - side/2, loc.y - side, side, side);
  }

  void applyForce(PVector force) {
    acc.add(force);
  }
  
  void applyJump(PVector jump) {
    vel.add(jump);
  }

  void motion() {
    vel.limit(10);
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);

    if ( abs(vel.x) < 0.01 ) {
      vel.x = 0;
    }
  }


  void boundary() {
    if (loc.x > width - side/2 || loc.x < side/2 ) {
      vel.x = -vel.x;
    }

    if ( loc.y > 0 ) {
      vel.y = 0;
      acc.y = 0;
      loc.y = 0;
    }

    if ( loc.y < -350 + side ) {
      vel.y = -vel.y;
    }
  }
}
