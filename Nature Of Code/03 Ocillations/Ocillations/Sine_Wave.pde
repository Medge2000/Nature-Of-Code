class sineWave {
  PVector loc, vel;
  Float theta, deltaTheta;
  int amp, r;

  sineWave() {
    loc = new PVector();
    vel = new PVector(1, 0);

    theta = 0.0;
    deltaTheta = 0.05;
    amp = 150;

    r = 5;
  }

  void display() {    
    strokeWeight(2);
    stroke(29, 238, 180, 50);
    fill(0);
    
    pushMatrix();
    translate(100, 230);  
    ellipse(loc.x, loc.y, r*2, r*2);
    popMatrix();   
  }

  void motion() {    
    theta += deltaTheta;
    loc.y = amp * sin(theta);
    loc.x += vel.x;
  }

  void boundary() {   
    if (abs(theta) > PI * 18) {
      vel.x = -vel.x;
      deltaTheta = -deltaTheta;
      theta = 0.0;
    }
  }
}
