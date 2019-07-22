class MorningStar {
  Chain chain;
  Star star;
  Handle handle;
  RevoluteJoint joint;

  MorningStar(float x, float y) {
    chain = new Chain(x, y, 140, 14); 
    star = new Star(x, y, 40);
    handle = new Handle(x, y + 160, 15, 50);

    RevoluteJointDef cs = new RevoluteJointDef();   
    cs.initialize(star.body, chain.links.get(0).body, star.body.getWorldCenter());
    joint = (RevoluteJoint) box2d.world.createJoint(cs);

    RevoluteJointDef ch = new RevoluteJointDef();   
    ch.initialize(chain.links.get(chain.nLnk).body, 
      handle.body, chain.links.get(chain.nLnk).body.getWorldCenter());
    joint = (RevoluteJoint) box2d.world.createJoint(ch);
  }

  void display() {
    chain.display();
    star.display();   
    handle.display();
  }
}
