import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;


Floor floor;
ArrayList<Star> stars;

Box2DProcessing box2d;
void setup() {
  //fullScreen();
  size(800, 800);
  frameRate(60);
  background(0);

  box2d = new Box2DProcessing(this, 15);
  box2d.createWorld();

  floor = new Floor();
  stars = new ArrayList<Star>();
}

void draw() {  
  background(0);
  box2d.step();
  
  floor.display();

  for (Star star : stars) {
    star.display();
  }
}

void mousePressed() {
  stars.add(new Star(mouseX, mouseY, 30, 0));
}
