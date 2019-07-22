
Photon[] photons = new Photon[1080];
final static ArrayList<BlackHole> blackholes = new ArrayList();

void setup() {
  fullScreen();
  //size(1000, 800);
  frameRate(60);
  background(0);

  photon();
}

void draw() {  
  //background(255);

  for (int i = 0; i < photons.length; i++) {
    for (int j = 0; j < blackholes.size(); j++ ) {
      BlackHole blackhole = blackholes.get(j);

      PVector force = blackhole.attract(photons[i]);
      photons[i].applyForce(force);

      //blackhole.display();
    }   

    photons[i].display();
    photons[i].motion();
    //photons[i].boundary();
  }
}

void mousePressed() {
  blackholes.add(new BlackHole(mouseX, mouseY));
}

void photon() { 
    for (int i = 0; i < photons.length; i++) {
      photons[i] = new Photon(0, (i * (height/photons.length)), 2, 0);
    }
}
