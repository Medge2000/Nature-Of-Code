class Triangle extends Particle {

  Triangle(PVector l) {
    super(l);

    deltaTheta = 0.05;
  }

  void display() {
    fill(brightness*208, brightness*29, brightness*208, longevity);
    stroke(208, 29, 208, longevity);

    theta += deltaTheta;

    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);
    translate(-loc.x, -loc.y);
    rectMode(CENTER);
    triangle(loc.x + size/2, loc.y + size/2, loc.x - size/2, loc.y + size/2, loc.x, loc.y - (0.8 * size/2));
    popMatrix();
  }
}
