class Link {
  Body body;
  float r;

  Link(float x, float y, float _r) {
    r = _r;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position = box2d.coordPixelsToWorld(x, y);
    body = box2d.world.createBody(bd);

    CircleShape c = new CircleShape();
    c.m_radius = box2d.scalarPixelsToWorld(r);

    FixtureDef fd = new FixtureDef();
    fd.shape = c;
    fd.density = 0.1;
    fd.friction = 0.8;
    fd.restitution = 0;
    body.createFixture(fd);
  }

  void display() {
    Vec2 loc = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();

    pushMatrix();
    translate(loc.x, loc.y);
    rotate(a);
    stroke(27, 250, 61);
    fill(0);
    circle(0, 0, r*2);
    popMatrix();
  }
}
