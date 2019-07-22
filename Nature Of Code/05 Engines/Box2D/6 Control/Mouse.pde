class Mouse {
  MouseJoint mouseJoint;

  Mouse() {
    mouseJoint = null;
  }

  void motion(float x, float y) {
    if (mouseJoint != null) {
      Vec2 mouseWorld = box2d.coordPixelsToWorld(x, y);
      mouseJoint.setTarget(mouseWorld);
    }
  }

  void attract(float x, float y, MorningStar morningStar) {
    MouseJointDef mj = new MouseJointDef();
    mj.bodyA = box2d.getGroundBody();
    mj.bodyB = morningStar.handle.body;
    Vec2 dis = box2d.coordPixelsToWorld(x, y);
    mj.target.set(dis);

    mj.maxForce = 1000.0 * morningStar.handle.body.m_mass;
    mj.frequencyHz = 5.0;
    mj.dampingRatio = 0.9;
    mouseJoint = (MouseJoint) box2d.world.createJoint(mj);
  }


  void destroy() {
    if (mouseJoint != null) {
      box2d.world.destroyJoint(mouseJoint);
      mouseJoint = null;
    }
  }

  void display() {
  }
}

void mousePressed() {
  for (MorningStar morningstar : morningstars) {
    if (morningstar.handle.contains(mouseX, mouseY)) {
      mouse.attract(mouseX, mouseY, morningstar);
    }
  }
}

void mouseReleased() {
  mouse.destroy();
}
