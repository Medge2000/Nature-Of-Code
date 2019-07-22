class Spiral {
  PVector loc;
  Float theta, deltaTheta;
  int amp, r, deltaAmp;
  boolean run;

  Spiral() {
    loc = new PVector();

    theta = 0.0;
    deltaTheta = 0.1;
    amp = 300;
    deltaAmp = 0; 

    r = 1;

    run = true;
  }


  void display() {
    if (run) {
      pushMatrix();
      translate(400, height - 350);
      stroke(208, 29, 208, 80);
      point(loc.x, loc.y);
      popMatrix();
    }
  }

  void motion () {
    if (run) {
      theta += deltaTheta;
      loc.x = amp * cos(theta);
      loc.y = amp * sin(theta);

      int a = 5;
      if (frameCount % a == 0) {
        deltaAmp ++;
      }
      amp -= deltaAmp;
    }
  }


  void boundary() {
    if (amp < 0 || amp > 300) {
      deltaAmp = - deltaAmp;
    }
  }
}
