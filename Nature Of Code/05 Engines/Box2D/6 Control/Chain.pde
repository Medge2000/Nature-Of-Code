class Chain {
  float len, tLen;
  int nLnk;
  ArrayList<Link> links;

  Chain(float x, float y, float tl, int ns) {
    tLen = tl;
    nLnk = ns;
    len = tLen/nLnk;

    links = new ArrayList<Link>();

    for (int i = 0; i < nLnk + 1; i++) {
      links.add(new Link(x, y + i*len, 5));

      if (i>0) {
        DistanceJointDef djd = new DistanceJointDef();
        Link prev = links.get(i - 1);
        Link segment = links.get(i);
        djd.bodyA = prev.body;
        djd.bodyB = segment.body;       
        djd.length = box2d.scalarPixelsToWorld(len);
        djd.frequencyHz = 0;
        djd.dampingRatio = 0;
        DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
      }
    }
  }

  void display() {
    for (int i = 1; i < links.size(); i++) {
      Link link = links.get(i);
      Link prev = links.get(i - 1);

      Vec2 locS = box2d.getBodyPixelCoord(link.body);
      Vec2 locP = box2d.getBodyPixelCoord(prev.body);

      strokeWeight(1);
      stroke(0, 255, 255);
      line(locS.x, locS.y, locP.x, locP.y);      
    }
    
    for(Link link : links) {
      link.display();
    }
  }
}
