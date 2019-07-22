import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList <Square> squares;
ArrayList <Platform> platforms;
Terrain terrain;

Box2DProcessing box2d;

void setup() {
  //fullScreen();
  size(1400, 1000, P2D);
  frameRate(60);
  background(0);

  box2d = new Box2DProcessing(this, 15);
  box2d.createWorld();

  squares = new ArrayList<Square>();
  platforms = new ArrayList<Platform>();
  terrain = new Terrain();

  platforms.add(new Platform(1200, 300, 400, 5, 0.3));
  platforms.add(new Platform(400, 200, 300, 5, -0.4));
  platforms.add(new Platform(100, 200, 200, 5, -0.8));
  platforms.add(new Platform(800, 250, 250, 5, 1.3));
  platforms.add(new Platform(1000, 100, 400, 5, -0.2));
  platforms.add(new Platform(350,350,600,5,-0.1));
}

void draw() {  
  background(0);

  box2d.step();

  if (mousePressed) {
    squares.add(new Square(mouseX + random(-10,10), mouseY + random(-10,10)));
  }

  for (int i = squares.size() - 1; i >= 0; i--) {
    Square square = squares.get(i);    
    square.display();

    if (square.done() == true) {
      squares.remove(square);
    }
  }

  for (Platform platform : platforms) {
    platform.display();
  }
  
  terrain.display();
}
