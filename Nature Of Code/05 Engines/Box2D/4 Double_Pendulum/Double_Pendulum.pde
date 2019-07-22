import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
PGraphics tracer;

Pendulum pendulums;
void setup() {
  //fullScreen();
  size(800, 800);
  frameRate(60);
  background(0);

  box2d = new Box2DProcessing(this, 15);
  box2d.createWorld();

  pendulums = new Pendulum(width/2, height/2 - 50);

  tracer = createGraphics(width, height);
  tracer.beginDraw();
  tracer.noStroke();
  tracer.fill(255, 0, 255);
  tracer.endDraw();
}

void draw() {  
  background(0);
  image(tracer, 0, 0);
  box2d.step();

  pendulums.display();

  tracer.beginDraw();
  tracer.circle(pendulums.loc.x, pendulums.loc.y, 1);
  tracer.endDraw();
}
