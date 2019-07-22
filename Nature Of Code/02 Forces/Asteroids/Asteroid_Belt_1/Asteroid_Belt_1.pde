Asteroid[] asteroid;
void setup() {
  //fullScreen();
  size(1000, 1000, P2D);
  frameRate(60);
  background(0);

  asteroid = new Asteroid[1000];
  for (int i = 0; i < asteroid.length; i++) 
    asteroid[i] = new Asteroid(random(width), random(height), int(random(5, 10)));
}

void draw() {  
  background(0);

  for (int i = 0; i < asteroid.length; i++) {
    for (int j = 0; j < asteroid.length; j++) {
      if (i!=j) {
        PVector force = asteroid[j].attract(asteroid[i]);
        asteroid[i].applyForce(force);
      }
    }
    asteroid[i].boundary();
    asteroid[i].motion();
    asteroid[i].display();
  }
}
