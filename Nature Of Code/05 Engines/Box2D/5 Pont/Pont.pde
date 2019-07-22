import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

ArrayList <Object> objects;
Bridge bridge;
Box2DProcessing box2d;
void setup() {
  //fullScreen();
  size(1000, 1000);
  frameRate(60);
  background(0);

  box2d = new Box2DProcessing(this, 10);
  box2d.createWorld();

  objects = new ArrayList<Object>();
  bridge = new Bridge(width, width/10, 300);
}

void draw() {  
  background(0);
  box2d.step();

  for (int i = objects.size() - 1; i >= 0; i--) {
    Object object = objects.get(i);
    object.display();

    if (object.outOfBounds()) {
      objects.remove(i);
    }
  }

  bridge.display();

  if (mousePressed) {    
    if (frameCount % 5 == 0) {
      objects.add(new Object(mouseX + random(-20, 20), mouseY + random(-20, 20), random(10, 25)));
    }
  }
}


void mousePressed() {
    objects.add(new Object(mouseX + random(-20, 20), mouseY + random(-20, 20), random(10, 25)));
}
