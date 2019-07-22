class Arm {
  Body body;
  float w, h;

  Arm(float x, float y, float _w, float _h) {
    w = _w;
    h = _h;

    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    bd.type = BodyType.DYNAMIC;
    body = box2d.createBody(bd);

    PolygonShape ps = new PolygonShape();
    ps.setAsBox(box2d.scalarPixelsToWorld(w/2), box2d.scalarPixelsToWorld(h/2));

    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.filter.groupIndex = -1;
    fd.density = 10;
    body.createFixture(fd);
  }


  void display() {
    Vec2 loc = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();    

    pushMatrix();
    translate(loc.x, loc.y);
    rotate(-a);
    rectMode(CENTER);
    stroke(0, 255, 255);
    fill(0);   
    rect(0, 0, w, h);  
    popMatrix();
  }
}
