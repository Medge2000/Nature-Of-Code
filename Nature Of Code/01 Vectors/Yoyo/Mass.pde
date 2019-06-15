class Mass {

  PVector loc, vel, acc;
  int r, g, b, rad;

  Mass() {
    loc = new PVector(random(width/2), random(height/2));
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);

    r = 20;
    g = 255;
    b = 255;
    
    rad = ceil(random(20, 40));
  }

  void display() {  
    stroke(255);
    strokeWeight(2);
    fill(r, g, b);
    line(loc.x, loc.y, mouseX, mouseY);
    ellipse(loc.x, loc.y, rad, rad);
  }

  void motion() {
    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(loc);
    mouse.setMag(random(0.1, 0.2));
    acc = mouse;

    vel.add(acc);
    loc.add(vel);
    vel.limit(8);
  }

  void boundary() {
    if (loc.x > width || loc.x < 0 ) {
      vel.x = -vel.x * 3;

      int col = ceil(random(10));
      switch(col) {
      case 1: 
        r = 255;
        g = 0;
        b = 0;
        break;
      case 2:  
        r = 255;
        g = 128;
        b = 0;
        break;
      case 3: 
        r = 255;
        g = 255;
        b = 0;
        break;
      case 4: 
        r = 128;
        g = 255;
        b = 0;
        break;
      case 5: 
        r = 0;
        g = 255;
        b = 0;
        break;
      case 6:  
        r = 0;
        g = 255;
        b = 128;
        break;
      case 7:  
        r = 0;
        g = 255;
        b = 255;
        break;
      case 8:  
        r = 0;
        g = 128;
        b = 255;
        break;
      case 9:  
        r = 0;
        g = 0;
        b = 255;
        break;
      case 10:  
        r = 128;
        g = 0;
        b = 255;
        break;
      case 11:  
        r = 255;
        g = 0;
        b = 255;
        break;
      case 12:  
        r = 255;
        g = 0;
        b = 128;
        break;
      }
    }

    if (loc.y > height || loc.y < 0 ) {
      vel.y = -vel.y * 3;

      int col = ceil(random(10));
      switch(col) {
      case 1: 
        r = 255;
        g = 0;
        b = 0;
        break;
      case 2:  
        r = 255;
        g = 128;
        b = 0;
        break;
      case 3: 
        r = 255;
        g = 255;
        b = 0;
        break;
      case 4: 
        r = 128;
        g = 255;
        b = 0;
        break;
      case 5: 
        r = 0;
        g = 255;
        b = 0;
        break;
      case 6:  
        r = 0;
        g = 255;
        b = 128;
        break;
      case 7:  
        r = 0;
        g = 255;
        b = 255;
        break;
      case 8:  
        r = 0;
        g = 128;
        b = 255;
        break;
      case 9:  
        r = 0;
        g = 0;
        b = 255;
        break;
      case 10:  
        r = 128;
        g = 0;
        b = 255;
        break;
      case 11:  
        r = 255;
        g = 0;
        b = 255;
        break;
      case 12:  
        r = 255;
        g = 0;
        b = 128;
        break;
      }
    }
  }
}
