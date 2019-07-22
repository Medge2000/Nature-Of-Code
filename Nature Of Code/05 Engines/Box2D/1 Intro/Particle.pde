class Square {
  Body body;
  float size;

  Square(float x, float y) {
    size = 10;
  
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));    
    body = box2d.createBody(bd);

    PolygonShape ps = new PolygonShape();
    float box2Dsize = box2d.scalarPixelsToWorld(size);
    ps.setAsBox(box2Dsize/2, box2Dsize/2);

    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    fd.friction = 0.6;
    fd.restitution = 0.9;

    body.createFixture(fd);
  }

  void display() {    
    Vec2 loc = box2d.getBodyPixelCoord(body);
    float theta = body.getAngle();

    pushMatrix();    
    translate(loc.x, loc.y);
    stroke(255);
    rotate(-theta);
    fill(180);
    rectMode(CENTER);
    square(0, 0, size);
    popMatrix();
  }

  boolean done() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.y > height + 100) {
      box2d.destroyBody(body);
      return true;
    }
    return false;
  }
}
