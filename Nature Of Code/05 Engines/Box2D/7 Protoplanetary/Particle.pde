class Particle {
  Body body;
  float d, G;

  Particle(float x, float y, float _d) {
    d = _d;
    G = 0.1;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bd);

    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(d/2);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 10;
    fd.friction = 1;
    fd.restitution = 0;
    body.createFixture(fd);
  }

  Vec2 attract(Particle p) {    
    Vec2 loc = body.getWorldCenter();
    Vec2 loc2 = p.body.getWorldCenter();

    Vec2 force = loc2.sub(loc);
    float dis = force.length();
    force.normalize();
    float strength = ((G * body.m_mass * p.body.m_mass)/( sq(dis)));
    force.mulLocal(strength);

    return force;
  }

  void applyForce(Vec2 v) {
    body.applyForce(v, body.getWorldCenter());
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
