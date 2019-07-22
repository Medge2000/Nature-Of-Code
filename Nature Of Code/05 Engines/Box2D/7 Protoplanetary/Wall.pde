class Wall {
  Body body;
  float x, y, w, h;
  
  Wall(float _x, float _y, float _w, float _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    
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
}
