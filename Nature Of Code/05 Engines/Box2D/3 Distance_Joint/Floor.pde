class Floor {
  Body body;
  int x, y, w, h;

  Floor() {
    x = width/2;
    y = height - 20;
    w = width - 50;
    h = 10;

    PolygonShape ps = new PolygonShape();
    float w_ = box2d.scalarPixelsToWorld(w/2);
    float h_ = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(w_, h_);

    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;

    bd.position.set(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bd);

    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 5;
    fd.friction = 1;
    fd.restitution = 0.1;
    body.createFixture(fd);
  }

  void display() {
    fill(0);
    stroke(0, 255, 255);
    rectMode(CENTER);   
    rect(x, y, w, h);
  }
}
