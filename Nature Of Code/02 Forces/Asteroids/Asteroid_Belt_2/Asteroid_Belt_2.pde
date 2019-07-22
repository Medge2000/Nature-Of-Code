ArrayList<Asteroid> asteroids;
void setup() {
  //fullScreen();
  size(1000, 1000, P2D);
  frameRate(60);
  background(0);

  asteroids = new ArrayList<Asteroid>();
  for (int i = 0; i < 100; i++) 
    asteroids.add(new Asteroid(random(width), random(height), int(random(1, 5)), new PVector(0, 0)));
}

void draw() {  
  background(0);

  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroid ai = asteroids.get(i);
    for (int j = asteroids.size() - 1; j >= 0; j--) {      
      Asteroid aj = asteroids.get(j);

      if (i!=j) {
        PVector force = aj.attract(ai);
        ai.applyForce(force);

        if (ai.loc.dist(aj.loc) < ai.r + aj.r) {           
          float ir = ai.r;
          float jr = aj.r;
          float r = sqrt(sq(ir)+sq(jr));
          float m = (4/3)*(PI*r*r*r);
          
          PVector iv = ai.vel.copy();
          float im = ai.mass;
          iv.mult(im);
          
          PVector jv = aj.vel.copy();
          float jm = aj.mass;
          jv.mult(jm);
          
          PVector v = jv.copy().add(iv.copy());

          asteroids.remove(ai);
          asteroids.remove(aj); 

          if (jr >= ir) {
            asteroids.add(new Asteroid(aj.loc.x, aj.loc.y, r, v.div(m)));
          } else {
            asteroids.add(new Asteroid(ai.loc.x, ai.loc.y, r, v.div(m)));
          }
        }
      }
    }
    ai.boundary();
    ai.motion();
    ai.display();
  }
}
