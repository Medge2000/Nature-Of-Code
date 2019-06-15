
class Mass {

  PVector loc, vel, acc;

  Mass() {
    loc = new PVector(width/2, 25);
    vel = new PVector(3, 0);
    acc = new PVector(0, 0.02);
  }

  void display() {
    strokeWeight(2);
    stroke(0);
    fill(200);
    ellipse(loc.x, loc.y, 25, 25);
  }

  void motion() {
    vel.add(acc);
    loc.add(vel);
  }

  void window() {
    if ( loc.x > width - 20 || loc.x < 20 ) 
      vel.x = -vel.x; 
    if ( loc.y > height - 21) 
      vel.y = -vel.y * 0.8;
    if ( loc.y > height - 17) 
      acc.y = 0;
  }
}
