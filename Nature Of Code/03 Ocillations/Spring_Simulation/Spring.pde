class Spring {
  PVector origin, springForce;
  float k, restLength, currentLength, c;
  float r, g;


  Spring(int _x, int _y) {
    origin = new PVector(_x, _y);
    springForce = new PVector();

    k = 0.001;
    restLength = 100;
    currentLength = 0;
  }


  void display() {
    c = springForce.mag();
    
    if ( c > 1 ) {
      r = 255;
    } else {
      r = (c/1) * 255;
    }
    
    if ( c <= 0.0 ) {
      g = 255;
    } else {
      g = (1-(c/1)) * 255;
    }

    stroke(r, g, 0);
    line(origin.x, origin.y, ball.loc.x, ball.loc.y);
  }

  void calculateForce() {
    PVector spring = PVector.sub(ball.loc, origin);
    float currentLength = spring.mag();
    spring.normalize();
    float extension = currentLength - restLength;
    spring.mult(-k*extension);

    springForce = spring.copy();
  }
}
