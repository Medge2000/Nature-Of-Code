class Satellite {
  PVector loc, vel, acc;
  float mass;


  Satellite(int locx, int locy) {
    loc = new PVector(locx, locy);
    vel = new PVector(5.4, 0);
    acc = new PVector(0, 0);

    mass = 1;
  }

  void display() {
    float c1,c2;
    float distCentx, distCenty;
    
    distCentx = abs(dist(loc.x, 0, width/2,0));
    distCenty = abs(dist(0, loc.y, 0,height/2));
       
    c1 = ((1 - (distCentx/(width/2))) * 255);
    c2 = ((1 - (distCenty/(width/2))) * 255);
    
    stroke(0, c1, c2, 150);
    strokeWeight(4);
    
    if ( loc.x < width && loc.x > 0 && loc.y < height && loc.y > 0 ) { 
      point(loc.x, loc.y);
    }
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void motion() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }
}
