class Pendulum {
  PVector loc;
  float theta, thetaV, thetaA, gravity;
  int r;
  
  Pendulum() {
    loc = new PVector();
    
    r = 450;        
    gravity = 0.001;
    
    theta = PI * 0.99;
    thetaV = 0;
    thetaA = 0;  
  }
  
  void display() {
    strokeWeight(2);
    stroke(29, 189, 208, 30);
    fill(0);
    
    pushMatrix();
    translate(width/2 + 350,height/2);  
    line(0,0,loc.x,loc.y);
    ellipse(0,0,10,10); 
    ellipse(loc.x,loc.y,30,30);
    popMatrix();
  }
  
  void motion() {     
    loc.x = r * sin(theta);
    loc.y = r * cos(theta);
    
    theta += thetaV;
    thetaV += thetaA;
    thetaA= -gravity * sin(theta); 
    thetaV *= 0.995;
  }
}
