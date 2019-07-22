class Liquid {  
  int x, y, w, h;
  float c;

  Liquid(int x_, int y_, int w_, int h_, float c_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
  }  
  
  boolean contains(Ball ball) {
    PVector l = ball.loc;
    if ((l.x > x && l.x < w ) && (l.y > y && l.y < h)) {
      return true;
    } else {
      return false;
    }
  }
  
  PVector drag(Ball ball) {
    float velocity = ball.vel.magSq();
    float dragMag = c * velocity;

    PVector drag = ball.vel.copy();
    drag.mult(-1);
    drag.setMag(dragMag);
    return drag;
  }
  
  void display() {
    noStroke();
    fill(0, 76, 156);
    rect(x, y, w, h);
  }
}
