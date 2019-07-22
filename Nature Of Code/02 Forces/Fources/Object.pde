class Object {
  PVector acceleration, velocity, displacement;
  int radius;


  Object() {
    displacement = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);

    radius = 20;
  }

  void display() {
    stroke(255);
    fill(100);
    ellipse(displacement.x, displacement.y, 2 * radius, 2 * radius);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void motion() {
    velocity.limit(10);
    velocity.add(acceleration);
    displacement.add(velocity);
    acceleration.mult(0);
  }

  void boundary() {
    if ( displacement.x > width - radius|| displacement.x < radius ) {
      velocity.x = -velocity.x;
    }
    
    if ( displacement.y > height - radius|| displacement.y < radius ) {
      velocity.y = -velocity.y;
    }
  }
}
