class Field {
  PVector[][] flow;
  int xField, yField, resolution;

  Field(int r) {
    resolution = r;

    xField = (width)/r + 1;
    yField = (height)/r + 1;

    flow = new PVector[xField][yField];

    generate();
  }

  void generate() {    
    noiseSeed(int(random(1000)));
    float dOff = 0.2;

    float xOff = 0;
    for (int i = 0; i < xField; i++) {
      float yOff = 0;
      for (int j = 0; j < yField; j++) {
        float theta = map(noise(xOff, yOff), 0, 1, 0, TWO_PI);
        flow[i][j] = new PVector(cos(theta), sin(theta));
        yOff += dOff;
      }
      xOff += dOff;
    }
  }

  void display() {   
    for (int i = 0; i < xField; i++) {
      for (int j = 0; j < yField; j++) {
        PVector flux = flow[i][j];
        float len = resolution/2;
        
        pushMatrix();
        translate(i*resolution, j*resolution);
        translate(-resolution/2,-resolution/2);
        rotate(flux.heading2D());
        stroke(#27FFD5, 100);
        line(-len, 0, len, 0);
        line(len, 0, len - len/4, len/4);
        line(len, 0, len - len/4, -len/4);
        popMatrix();
      }
    }
  }
}
