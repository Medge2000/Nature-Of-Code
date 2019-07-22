ArrayList<Vehicle> vehicles;
Field field;
void setup() {
  //fullScreen();
  size(1000, 1000, P2D);
  frameRate(60);
  background(0);

  vehicles = new ArrayList<Vehicle>();
  field = new Field(20);
  field.generate();
}
void draw() {  
  background(0);

  if (!flowDisplay) 
    field.display();
  if (!flowMotion)
    field.motion();

  if (mousePressed) 
    vehicles.add(new Vehicle(mouseX, mouseY));

  for (Vehicle vehicle : vehicles) {
    if (!flowFollow) 
      vehicle.orientate();
    vehicle.motion();
    vehicle.display();
  }
}

boolean flowDisplay, flowFollow, flowMotion;
void keyPressed() {
  if (keyCode == UP) 
    flowDisplay = !flowDisplay;
  if (keyCode == DOWN) 
    flowFollow = !flowFollow;
  if (keyCode == LEFT) {
    field.generate();
    field.motion();
  }
  if (keyCode == RIGHT) 
    flowMotion = !flowMotion;
}
