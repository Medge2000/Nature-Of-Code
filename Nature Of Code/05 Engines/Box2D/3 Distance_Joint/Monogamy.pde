class Monogamy {
  Star s1;
  Star s2;

  float dis;

  Monogamy(float x, float y) {
    dis = 100;

    s1 = new Star(x + dis/2, y, 30, 0);
    s2 = new Star(x - dis/2, y, 30, 0);
    
    DistanceJointDef djd = new DistanceJointDef();
    djd.bodyA = s1.body;
    djd.bodyB = s2.body;    
    djd.length = box2d.scalarPixelsToWorld(dis);
    
    djd.frequencyHz = 2;
    djd.dampingRatio = 0.2;
    
    DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
  }
  
  void display() {
    Vec2 s1Loc = box2d.getBodyPixelCoord(s1.body);
    Vec2 s2Loc = box2d.getBodyPixelCoord(s2.body);
    
    line(s1Loc.x, s1Loc.y, s2Loc.x, s2Loc.y);
    
    s1.display();
    s2.display();
  }
}
