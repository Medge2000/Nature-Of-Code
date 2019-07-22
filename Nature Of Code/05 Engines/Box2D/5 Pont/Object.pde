class Object {
  Body b;
  float r;

  Object(float x, float y, float _r) {
    r = _r;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position = box2d.coordPixelsToWorld(x, y);
    b = box2d.world.createBody(bd);

    CircleShape c = new CircleShape();
    c.m_radius = box2d.scalarPixelsToWorld(r);

    FixtureDef fd = new FixtureDef();
    fd.shape = c;
    fd.density = 1;
    fd.friction = 0.7;
    fd.restitution = 0.2;
    b.createFixture(fd);
  }

  void removeBody() {
    box2d.destroyBody(b);
  }

  boolean outOfBounds() {
    Vec2 loc = box2d.getBodyPixelCoord(b);

    if (loc.y > height + 100) {
      removeBody();
      return true;
    }
    return false;
  }

  void display() {
    Vec2 loc = box2d.getBodyPixelCoord(b);
    float a = b.getAngle();

    pushMatrix();
    translate(loc.x, loc.y);
    rotate(a);
    stroke(255, 0, 255);
    fill(0);
    circle(0, 0, r*2);
    line(0, 0, r, 0);
    popMatrix();
  }
}
