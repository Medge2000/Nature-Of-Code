final static ArrayList<Satellite> satellites = new ArrayList();
Earth earth;
void setup() {
  fullScreen();
  //size(1400, 800);
  frameRate(60);
  background(0);

  earth = new Earth();

  keyPressed();
}

void draw() {  
  if (up) {   
    for ( int i = 0; i < ffx; i++ ) {
      if (refresh) {
        background(0);
      }
      for (int j = 0; j < satellites.size(); j++ ) {
        Satellite satellite = satellites.get(j);

        PVector force = earth.attract(satellite);
        satellite.applyForce(force);

        satellite.display();
        satellite.motion();

        PVector temp = satellite.loc;        
        float distCent = abs(dist(temp.x, temp.y, width/2, height/2));

        if (distCent > 2000 || distCent < 20) {
          satellites.remove(j);
        }
      }
    }
  }

  if (speed) {
    fill(0);
    noStroke();
    rect(0, 0, 90, 26);
    fill(255);
    textSize(28);
    text("x" + ffx, 3, 25);
  }
  earth.display();
}

boolean refresh = true;
boolean speed = true;
boolean up = true;
int ffx = 1;
void keyPressed() {
  if (ffx < 1000 ) {
    if (keyCode == RIGHT) {
      ffx ++;
    }
  }

  if (ffx > 0 ) {
    if (keyCode == LEFT) {
      ffx --;
    }
  }

  if (keyCode == UP) {
    up = !up;
  }

  if (keyCode == DOWN) {
    speed = !speed;
  }

  if (keyCode == BACKSPACE) {
    refresh = !refresh;
  }
}

void mousePressed() {
  int mass = int(random(5, 20));
  float velx = random(-1.5, 1.5);
  float vely = random(-1.5, 1.5);
  int _case = int(random(0, 4));

  switch(_case) {
  case 0:
    velx = -velx;
  case 1: 
    vely = -vely;
  case 2: 
    velx = -velx;
    vely = -vely;
    break;
  }
  satellites.add(new Satellite(mouseX, mouseY, velx, vely, mass));
}
