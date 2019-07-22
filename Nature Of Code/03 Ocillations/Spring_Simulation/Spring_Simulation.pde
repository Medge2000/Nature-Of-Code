Object ball;

final static ArrayList<Spring> springs = new ArrayList<Spring>();


void setup() {
  //fullScreen();
  size(1400, 1000);
  frameRate(60);
  background(0);

  ball = new Object(width/2, 100);
}

void draw() {  
  background(0);

  for ( Spring spring : springs ) {
    spring.display();
    spring.calculateForce(); 
    
    ball.apply(spring.springForce);
    ball.dampening(0.005);
  }
  
  PVector gravity = new PVector(0, 0.2);
      
    ball.apply(gravity);
    ball.boundary();
    ball.motion();
    ball.display();
}

void mousePressed() {
  springs.add(new Spring(mouseX, mouseY));
}
