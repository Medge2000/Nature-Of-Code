class Pendulum {
  Body body;
  Vec2 loc;

  RevoluteJoint joint;
  Mass stand;
  Arm arm1;
  Arm arm2;  
  Mass ball;

  Pendulum(float x, float y) {
    stand = new Mass(x, y, 30, 0, true);
    arm1 = new Arm(x, y - 115, 10, 220);
    arm2 = new Arm(x + 35, y - 220, 80, 10);
    ball = new Mass(x + 75, y - 220, 20, 0.1, false);

    RevoluteJointDef js1 = new RevoluteJointDef();
    js1.initialize(stand.body, arm1.body, stand.body.getWorldCenter());    
    joint = (RevoluteJoint) box2d.world.createJoint(js1);

    RevoluteJointDef j12 = new RevoluteJointDef();
    Vec2 J12 = new Vec2(box2d.vectorPixelsToWorld(0, -105));
    j12.initialize(arm2.body, arm1.body, arm1.body.getWorldCenter().add(J12));    
    joint = (RevoluteJoint) box2d.world.createJoint(j12);

    RevoluteJointDef j2b = new RevoluteJointDef();
    j2b.initialize(arm2.body, ball.body, ball.body.getWorldCenter());    
    joint = (RevoluteJoint) box2d.world.createJoint(j2b);
  }

  void display() {    
    arm1.display();
    arm2.display();
    ball.display();
    stand.display();

    loc = box2d.getBodyPixelCoord(ball.body);
  }
}
