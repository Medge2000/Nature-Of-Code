class Terrain {
  ArrayList<Vec2> terrain;
  float[] noise;
  float t;

  Terrain() {
    noise = new float[200];
    t = 0;

    for (int n = 0; n < noise.length; n++) {
      t += 0.02;    
      float x = noise(t);
      x = map(x, 0, 1, height/2, height + 200);

      noise[n] = x;
    }

    terrain = new ArrayList<Vec2>();
    terrain.add(new Vec2(0, height));

    for (int i = 0; i <  noise.length - 1; i ++) {
      float y = noise[i];
      terrain.add(new Vec2(i * (width/noise.length), y));
    }

    terrain.add(new Vec2(width, noise[noise.length - 1]));
    terrain.add(new Vec2(width, height));

    ChainShape chain = new ChainShape();

    Vec2[] vertices = new Vec2[terrain.size()];
    for (int i = 0; i < vertices.length; i++) {
      vertices[i] = box2d.coordPixelsToWorld(terrain.get(i));
    }

    chain.createChain(vertices, vertices.length);

    BodyDef bd = new BodyDef();
    Body body = box2d.world.createBody(bd);
    body.createFixture(chain, 1);
  }

  void display() {
    stroke(0, 255, 0);
    fill(0);
    beginShape();
    for (Vec2 v : terrain) {
      vertex(v.x, v.y);
    }
    vertex(0, height);
    vertex(width, height);
    endShape();
  }
}
