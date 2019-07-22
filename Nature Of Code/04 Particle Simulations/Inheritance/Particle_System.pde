class System {
  ArrayList <Particle> particles;
  PVector loc;
  int shape;  

  System(int x, int y) {
    particles = new ArrayList<Particle>();
    loc = new PVector(x, y);
  }

  void addParticle() { 
    for (int f = 0; f < 2; f++) {
      if (frameCount % 1 == 0) {

        shape = ceil(random(3));
        switch(shape) {
        case 1:
          particles.add(new Square(loc));
          break;
        case 2:
          particles.add(new Circle(loc));
          break;
        case 3:
          particles.add(new Triangle(loc));
          break;
        }
      }
    }
  }
  
  void applyForce(PVector force) {
    for (Particle particle : particles) {
      particle.applyForce(force);
    }
  }

  void run() {
    for (int i = particles.size() - 1; i >= 0; i--) {
      Particle particle = particles.get(i);
      particle.motion();
      particle.lifespan();    
      particle.display();  
      
      if (particle.longevity <= 0) {
        particles.remove(particle);
      }
    }
  }
}
