import java.util.Random;

Random gen;
void setup() {
  //fullScreen();
  size(800, 800);
  frameRate(60);
  background(15);

  gen = new Random();
}


void draw() {
  int sd = 75;

  translate(width/2, height/2);

  for (int i = 0; i < 100; i++ ) {
    float x = (float)gen.nextGaussian();
    x = x * sd;

    float y = (float)gen.nextGaussian();
    y = y * sd;

    noStroke();
    fill(255, 50);
    ellipse(x, y, 10, 10);
  }
}
