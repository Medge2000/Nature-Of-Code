class Snowflake {
  Body body;
  float d;

  Snowflake(float x, float y, float _d) {
    d = _d;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bd);

    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(d/2);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 0.001;
    fd.friction = 1;
    fd.restitution = 0;
    body.createFixture(fd);

    body.setLinearVelocity(new Vec2(5, 0));
  }

  void removeBody() {
    box2d.destroyBody(body);
  }

  boolean outOfBounds() {
    Vec2 loc = box2d.getBodyPixelCoord(body);
    if (loc.y > height + 200 || loc.y < - 200 
      || loc.x > width + 200 || loc.x < - 500) {
      removeBody();
      return true;
    }
    return false;
  }

  void display() {
    Vec2 loc = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();

    pushMatrix();
    translate(loc.x, loc.y);
    rotate(-a);
    fill(0);
    strokeWeight(1);
    stroke(80, 251, 255);
    circle(0, 0, d);
    popMatrix();
  }
}
