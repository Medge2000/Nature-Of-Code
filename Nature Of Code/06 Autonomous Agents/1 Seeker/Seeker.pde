Vehicle vehicle;
void setup() {
  //fullScreen();
  size(800, 800);
  frameRate(60);
  background(0);

 vehicle = new Vehicle(400, 400);
}

void draw() {  
  background(0);

  PVector target = new PVector(mouseX, mouseY);
  vehicle.deltaMaxVel(target);
  vehicle.seek(target);
  vehicle.motion();
  vehicle.display(); 
}
