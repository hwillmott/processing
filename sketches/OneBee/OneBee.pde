Bee bee;


void setup()
{
  size(600,600);
  colorMode(HSB, 360, 100, 100, 100);
  bee = new Bee(width / 2, height / 2);
}

void draw()
{
  background(360);
  bee.display();
  bee.wander();
  bee.bounceOffWalls();
  bee.update();
}