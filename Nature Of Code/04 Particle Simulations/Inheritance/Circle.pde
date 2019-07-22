class Circle extends Particle {

  Circle(PVector l) {
    super(l);
  }
  
  void display() {
    fill(brightness*29, brightness*189, brightness*208, longevity);
    stroke(29, 189, 208, longevity);
    circle(loc.x, loc.y, size);
  }
}
