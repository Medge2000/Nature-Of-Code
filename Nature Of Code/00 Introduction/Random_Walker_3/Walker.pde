
class Walker {

  float x, y;
  float tx, ty;


  Walker() {
    tx = 0;
    ty = 500;
  }
  
  
  void display() {
    strokeWeight(2);
    stroke((y/height)*255, 0, (x/width)*255);
    point(x, y);
  }

  void motion() {
    float t = 0.0001;

    x = map(noise(tx), 0, 1, 0, width);
    y = map(noise(ty), 0, 1, 0, height);

    tx += t;
    ty += t;
  }
}
