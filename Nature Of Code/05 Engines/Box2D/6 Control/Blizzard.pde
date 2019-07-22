class Blizzard {
  ArrayList<Snowflake> snow;

  Blizzard() {
    snow = new ArrayList<Snowflake>();
  }

  void blizzard(int volume) {
    for (int i = 0; i < volume; i++) {
      if (frameCount % 2 == 0) {
        snow.add(new Snowflake(random(-500, width), -200, random(1, 5)));
      }
    }

    for (int i = snow.size() - 1; i >= 0; i--) {
      Snowflake snowflake = snow.get(i);
      snowflake.display();

      if (snowflake.outOfBounds()) {
        snow.remove(i);
      }
    }
  }
}
