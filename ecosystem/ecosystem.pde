import java.util.Iterator;

ParticleSystem ps;
PVector gravity = new PVector(0, 0.1);
int timer = 0;

void setup()
{
  size(600,600);
  colorMode(HSB, 360, 100, 100, 300);
  frameRate(30);
  ps = new ParticleSystem(new PVector(width / 2, height / 2));
}

void draw()
{
  background(360);
  if (timer % 20 == 0)
  {
   ps.addParticle();
   timer = 0;
  }
  ps.applyForce(gravity);
  ps.run();
  timer++;
}