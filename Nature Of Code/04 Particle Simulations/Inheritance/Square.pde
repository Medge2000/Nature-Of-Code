class Square extends Particle {
  
  Square(PVector l) {
    super(l);

    deltaTheta = 0.02;
  }

  void display() {
    fill(brightness*29, brightness*238, brightness*180, longevity);
    stroke(29, 238, 180, longevity);

    theta += deltaTheta;    

    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);
    translate(-loc.x, -loc.y);
    rectMode(CENTER);
    square(loc.x, loc.y, size);
    popMatrix();
  }
}
