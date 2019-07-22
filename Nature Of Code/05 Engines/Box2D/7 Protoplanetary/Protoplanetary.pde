import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Dust dust;
ArrayList<Wall> walls;
Box2DProcessing box2d;
void setup() {
  fullScreen(P2D);
  //size(800, 800);
  frameRate(60);
  background(0);

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, 0);

  dust = new Dust(1000);
  walls = new ArrayList<Wall>();
  walls.add(new Wall(width/2, -1, width, 0));
  walls.add(new Wall(-1, height/2, 0, height));
  walls.add(new Wall(width/2, height, width, 0));
  walls.add(new Wall(width, height/2, 0, height));
}

void draw() {  
  background(0);
  box2d.step();

  dust.gravity();
  dust.display();
}
