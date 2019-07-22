class Platform {
  Body body;
  float w, h, theta;

  Platform(float x, float y, float w_, float h_, float theta_) {
    w = w_;
    h = h_;
    theta = theta_;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.angle = theta;
    bd.position.set(box2d.coordPixelsToWorld(x, y));    
    body = box2d.createBody(bd);

    PolygonShape ps = new PolygonShape();
    float box2Dw = box2d.scalarPixelsToWorld(w/2);
    float box2Dh = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2Dw, box2Dh);

    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    fd.friction = 0;
    fd.restitution = 0;

    body.createFixture(fd);
  }

  void display() {
    Vec2 loc = box2d.getBodyPixelCoord(body);

    pushMatrix();    
    translate(loc.x, loc.y);
    rotate(-theta);
    stroke(0,255,255);
    fill(0);
    rectMode(CENTER);
    rect(0, 0, w, h);
    popMatrix();
  }
}
