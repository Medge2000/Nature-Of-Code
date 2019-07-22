class Dust {
  ArrayList<Particle> particles;

  Dust(int volume) {
    particles = new ArrayList<Particle>();

    for (int i = 0; i < volume; i++) {
      if (frameCount % 1 == 0) {
        particles.add(new Particle(random(0, width), random(0, height), random(5, 10)));
      }
    }
  }

  void gravity() {
    for (int i = 0; i < particles.size(); i++) {
      Particle pi = particles.get(i);
      for (int j = 0; j < particles.size(); j++) {      
        Particle pj = particles.get(j);

        if (i!=j) {
          Vec2 force = pj.attract(pi);
          force.mulLocal(-1);
          pi.applyForce(force);
        }
      }
    }
  }

  void display() {
    for (Particle particle : particles) {
      particle.display();
    }
  }
}
