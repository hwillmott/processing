import java.util.Iterator;

ParticleSystem ps1;
ParticleSystem ps2;
ParticleSystem ps3;
PVector gravity = new PVector(0, 0.1);
int timer = 0;
OPC opc;
PImage dot;

void setup()
{
  size(800, 200);

  // Connect to the local instance of fcserver
  opc = new OPC(this, "127.0.0.1", 7890);

  // make a 36 x 6 grid
  opc.simpleLedGrid(36, 6, width/2, height, 10, 10);
  
  frameRate(30);
  ps1 = new ParticleSystem(new PVector(width / 2, 0));
  ps2 = new ParticleSystem(new PVector((width / 2) + 50, 0));
  ps3 = new ParticleSystem(new PVector((width / 2) - 50, 0));
}

void draw()
{
  background(60, 20, 60);
  if (timer % 10 == 0)
  {
   ps1.addParticle();
   ps2.addParticle();
   ps3.addParticle();
   timer = 0;
  }
  ps1.applyForce(gravity);
  ps1.run();
  ps2.applyForce(gravity);
  ps2.run();
  ps3.applyForce(gravity);
  ps3.run();
  timer++;
}