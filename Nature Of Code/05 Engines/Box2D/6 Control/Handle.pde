class Handle {
  Body body;
  float w, h;

  Handle(float x, float y, float _w, float _h) {
    w = _w;
    h = _h;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bd);

    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dW, box2dH);

    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 0.1;
    fd.friction = 0.8;
    fd.restitution = 0;
    body.createFixture(fd);
  }

  boolean contains(float x, float y) {
    Vec2 worldPoint = box2d.coordPixelsToWorld(x, y);
    Fixture f = body.getFixtureList();
    boolean inside = f.testPoint(worldPoint);
    return inside;
  }

  void display() {
    Vec2 loc = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();

    pushMatrix();
    translate(loc.x, loc.y);
    rotate(-a);
    fill(0);
    stroke(15, 53, 255);
    rectMode(CENTER);
    rect(0, 0, w, h);
    popMatrix();
  }
}
