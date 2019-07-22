class Mass {
  Body body;  
  float d;

  Mass(float x, float y, float _dmr, float dty, boolean STATIC) {
    d = _dmr;

    BodyDef bd = new BodyDef();
    if (STATIC) bd.type = BodyType.STATIC;
    else bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bd);

    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(d);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.filter.groupIndex = -1;
    fd.density = dty;
    body.createFixture(fd);
  }

  void display() {
    Vec2 loc = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();

    pushMatrix();
    translate(loc.x, loc.y);
    rotate(-a);
    fill(0);
    stroke(255, 0, 255);
    circle(0, 0, d);
    popMatrix();
  }
}
