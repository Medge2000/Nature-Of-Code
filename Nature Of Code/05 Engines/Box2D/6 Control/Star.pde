class Star {
  Body body;
  Vec2 loc;

  float x, y, d, a, s;

  Star(float x_, float y_, float d_) {
    x = x_;
    y = y_;
    d = d_;

    s = 0.2;

    makeBody(new Vec2(x, y));
  } 

  void display() {
    loc = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();


    fill(0);

    pushMatrix();
    strokeWeight(2);
    stroke(216, 15, 19);
    translate(loc.x, loc.y);
    rotate(-a); 
    beginShape();
    vertex(0, -d);
    vertex(d*s, -d*s);
    vertex(d, 0);
    vertex(d*s, d*s);
    vertex(0, d);
    vertex(-d*s, d*s);
    vertex(-d, 0);
    vertex(-d*s, -d*s);
    endShape(CLOSE);            
    popMatrix();

    strokeWeight(2);
    stroke(154, 8, 157);
    circle(loc.x, loc.y, d);
  }

  void makeBody(Vec2 center) {
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);

    PolygonShape tri1 = new PolygonShape();
    Vec2[] vertices1 = new Vec2[3];
    vertices1[0] = box2d.vectorPixelsToWorld(new Vec2(-d*s, -d*s));
    vertices1[1] = box2d.vectorPixelsToWorld(new Vec2(d*s, -d*s));
    vertices1[2] = box2d.vectorPixelsToWorld(new Vec2(0, -d));
    tri1.set(vertices1, vertices1.length);

    PolygonShape tri2 = new PolygonShape();
    Vec2[] vertices2 = new Vec2[3];
    vertices2[0] = box2d.vectorPixelsToWorld(new Vec2(-d*s, d*s));
    vertices2[1] = box2d.vectorPixelsToWorld(new Vec2(d*s, d*s));
    vertices2[2] = box2d.vectorPixelsToWorld(new Vec2(0, d));
    tri2.set(vertices2, vertices2.length);

    PolygonShape tri3 = new PolygonShape();
    Vec2[] vertices3 = new Vec2[3];
    vertices3[0] = box2d.vectorPixelsToWorld(new Vec2(-d*s, -d*s));
    vertices3[1] = box2d.vectorPixelsToWorld(new Vec2(-d*s, d*s));
    vertices3[2] = box2d.vectorPixelsToWorld(new Vec2(-d, 0));
    tri3.set(vertices3, vertices3.length);

    PolygonShape tri4 = new PolygonShape();
    Vec2[] vertices4 = new Vec2[3];
    vertices4[0] = box2d.vectorPixelsToWorld(new Vec2(d*s, -d*s));
    vertices4[1] = box2d.vectorPixelsToWorld(new Vec2(d*s, d*s));
    vertices4[2] = box2d.vectorPixelsToWorld(new Vec2(d, 0));
    tri4.set(vertices4, vertices4.length);

    CircleShape circle = new CircleShape();
    circle.m_radius = box2d.scalarPixelsToWorld(d/2);

    FixtureDef cfd = new FixtureDef();
    cfd.shape = circle;   
    cfd.density = 0.2;
    cfd.friction = 0.6;
    cfd.restitution = 0.5;
    body.createFixture(cfd);

    FixtureDef tfd1 = new FixtureDef();
    tfd1.shape = tri1;   
    tfd1.density = 0.2;
    tfd1.friction = 0.6;
    tfd1.restitution = 0.5;
    body.createFixture(tfd1);

    FixtureDef tfd2 = new FixtureDef();
    tfd2.shape = tri2;   
    tfd2.density = 0.2;
    tfd2.friction = 0.6;
    tfd2.restitution = 0.5;
    body.createFixture(tfd2);

    FixtureDef tfd3 = new FixtureDef();
    tfd3.shape = tri3;   
    tfd3.density = 0.2;
    tfd3.friction = 0.6;
    tfd3.restitution = 0.5;
    body.createFixture(tfd3);

    FixtureDef tfd4 = new FixtureDef();
    tfd4.shape = tri4;   
    tfd4.density = 0.2;
    tfd4.friction = 0.6;
    tfd4.restitution = 0.5;
    body.createFixture(tfd4);
  }
}
