import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Floor floor;
ArrayList<Monogamy> monogamy;
ArrayList<Polygamy> polygamy;

Box2DProcessing box2d;
void setup() {
  //fullScreen();
  size(800, 800);
  frameRate(60);
  background(0);

  box2d = new Box2DProcessing(this, 15);
  box2d.createWorld();

  floor = new Floor();
  monogamy = new ArrayList<Monogamy>();
  polygamy = new ArrayList<Polygamy>();
}

void draw() {  
  background(0);
  box2d.step();

  floor.display();
  for (Monogamy monogamous : monogamy) {
    monogamous.display();
  }
  
  for (Polygamy polygamous : polygamy) {
    polygamous.display();
  }
}

void mousePressed() {
  int a = ceil(random(2));
  if (a == 1) {
    monogamy.add(new Monogamy(mouseX, mouseY));
  } else {
    polygamy.add(new Polygamy(mouseX, mouseY));
  }
}
