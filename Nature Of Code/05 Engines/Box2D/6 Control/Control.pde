import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Floor floor;
Blizzard blizzard;
ArrayList<MorningStar> morningstars;
Mouse mouse;
Box2DProcessing box2d;
void setup() {
  //fullScreen();
  size(800, 800);
  frameRate(60);
  background(0);

  box2d = new Box2DProcessing(this, 15);
  box2d.createWorld();

  floor = new Floor();
  blizzard = new Blizzard();
  morningstars = new ArrayList<MorningStar>();
  morningstars.add(new MorningStar(400, 100));
  mouse = new Mouse();
}

void draw() {  
  background(0);
  box2d.step();

  floor.display();
  blizzard.blizzard(1);
  for (int i = morningstars.size() - 1; i >= 0; i--) {
    MorningStar morningstar = morningstars.get(i);
    morningstar.display();

    if (morningstar.star.loc.x > width + 400 || morningstar.star.loc.x < -400
      || morningstar.star.loc.y > height + 400 || morningstar.star.loc.y < -400) {
      morningstars.remove(i);
      morningstars.add(new MorningStar(400, 100));
    }
    mouse.motion(mouseX, mouseY);
  }
}
