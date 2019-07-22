Pendulum pendulum = new Pendulum();
sineWave sinewave = new sineWave();
Spiral spiral = new Spiral();

void setup() {
  //fullScreen();
  size(1960, 1080);
  frameRate(60);
  background(0);
}

void draw() {  
  //stroke(29, 189, 208); // BLUE
  //stroke(29, 238, 180); // GREEN
  //stroke(208, 29, 208); // PINK
  //stroke(238, 180, 23); // ORANGE
  //stroke(180, 208, 23); // YELLOW
   
  pushMatrix();
  translate(30,0);
  for ( int i = 0; i < 1; i++ ) {
    pendulum.motion();
    pendulum.display();

    sinewave.boundary();
    sinewave.display();
    sinewave.motion();
    
    spiral.motion();
    spiral.display();
    spiral.boundary();
  }
  popMatrix();
}
