
class Walker {

  int x, y;
  int spacing;

  Walker() {
    x = width/2;
    y = height/2;
    spacing = 1;
  }

  void display() {
    stroke(255);
    point(x, y);
  }

  void motion() {
    float direction = random(1);
    int boundary = 15;

    if ( (direction < 0.15 && direction > 0) && x < width - boundary) {
      x += spacing;
    }
    if ( (direction < 0.55 && direction > 0.15) && x > boundary) {
      x -= spacing;
    }

    if ( (direction < 0.75 && direction > 0.55) && y < height - boundary) {
      y += spacing;
    }
    if ( (direction < 1 && direction > 0.75) && y > boundary) {
      y -= spacing;
    }
  }
}
