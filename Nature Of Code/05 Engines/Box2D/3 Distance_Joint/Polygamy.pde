class Polygamy {
  Star s1;
  Star s2;
  Star s3;

  float dis;

  Polygamy(float x, float y) {
    dis = 100;

    s1 = new Star(x + dis, y, 30, 0);
    s2 = new Star(x, y, 30, 0);
    s3 = new Star(x - dis, y, 30, 0);

    DistanceJointDef djd1 = new DistanceJointDef();
    djd1.bodyA = s1.body;
    djd1.bodyB = s2.body;    
    djd1.length = box2d.scalarPixelsToWorld(dis);

    djd1.frequencyHz = 2;
    djd1.dampingRatio = 0.2;

    DistanceJoint dj1 = (DistanceJoint) box2d.world.createJoint(djd1);

    DistanceJointDef djd2 = new DistanceJointDef();
    djd2.bodyA = s3.body;
    djd2.bodyB = s2.body;    
    djd2.length = box2d.scalarPixelsToWorld(dis);

    djd2.frequencyHz = 2;
    djd2.dampingRatio = 0.2;

    DistanceJoint dj2 = (DistanceJoint) box2d.world.createJoint(djd2);
  }

  void display() {
    Vec2 s1Loc = box2d.getBodyPixelCoord(s1.body);
    Vec2 s2Loc = box2d.getBodyPixelCoord(s2.body);
    Vec2 s3Loc = box2d.getBodyPixelCoord(s3.body);
    
    line(s1Loc.x, s1Loc.y, s2Loc.x, s2Loc.y);
    line(s3Loc.x, s3Loc.y, s2Loc.x, s2Loc.y);
    
    s1.display();
    s2.display();
    s3.display();
  }
}
