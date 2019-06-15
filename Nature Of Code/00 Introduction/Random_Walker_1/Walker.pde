
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
    int direction = int(random(5));
    int boundary = 15;

    if ( direction == 1 && x < width - boundary) {
      x += spacing;
    }
    if ( direction == 2 && x > boundary) {
      x -= spacing;
    }

    if ( direction == 3 && y < height - boundary) {
      y += spacing;
    }
    if ( direction == 4 && y > boundary) {
      y -= spacing;
    }
  }
}
