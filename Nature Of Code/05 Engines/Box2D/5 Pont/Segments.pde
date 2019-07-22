class Segment {
  Body b;
  float r;

  Segment(float x, float y, float _r, boolean STATIC) {
    r = _r;

    BodyDef bd = new BodyDef();
    if (STATIC) {
      bd.type = BodyType.STATIC;
    } else {
      bd.type = BodyType.DYNAMIC;
    }
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

  void display() {
    Vec2 loc = box2d.getBodyPixelCoord(b);
    float a = b.getAngle();

    pushMatrix();
    translate(loc.x, loc.y);
    rotate(a);
    stroke(0, 255, 255);
    fill(0);
    circle(0, 0, r*2);
    popMatrix();
  }
}
