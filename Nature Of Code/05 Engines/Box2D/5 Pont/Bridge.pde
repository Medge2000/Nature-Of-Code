class Bridge {
  float len, tLen;
  int nSeg;

  ArrayList<Segment> segments;

  Bridge(float tl, int ns, int h) {
    tLen = tl;
    nSeg = ns;
    len = tLen/nSeg;

    segments = new ArrayList<Segment>();

    for (int i = 0; i < nSeg + 1; i++) {
      if (i == 0 || i == nSeg) {
        segments.add(new Segment(i*len, h, 5, true));
      } else {
        segments.add(new Segment(i*len, h, 5, false));
      }

      if (i>0) {
        DistanceJointDef djd = new DistanceJointDef();
        Segment prev = segments.get(i - 1);
        Segment segment = segments.get(i);
        djd.bodyA = prev.b;
        djd.bodyB = segment.b;       
        djd.length = box2d.scalarPixelsToWorld(len);
        djd.frequencyHz = 0;
        djd.dampingRatio = 0;
        DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
      }
    }
  }

  void display() {
    for (int i = 1; i < segments.size(); i++) {
      Segment segment = segments.get(i);
      Segment prev = segments.get(i - 1);

      Vec2 locS = box2d.getBodyPixelCoord(segment.b);
      Vec2 locP = box2d.getBodyPixelCoord(prev.b);

      segment.display();      
      stroke(0, 255, 255);
      line(locS.x, locS.y, locP.x, locP.y);
    }
  }
}
