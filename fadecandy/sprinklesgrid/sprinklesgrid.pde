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
  size(320, 80);

  // Connect to the local instance of fcserver
  opc = new OPC(this, "127.0.0.1", 7890);

  // make a 32 x 8 grid
  opc.ledStrip(0, 32, width/2, 5, 10, 0, false);
  opc.ledStrip(64, 32, width/2, 15 , 10, 0, false);
  opc.ledStrip(128, 32, width/2, 25, 10, 0, false);
  opc.ledStrip(192, 32, width/2, 35, 10, 0, false);
  opc.ledStrip(256, 32, width/2, 45, 10, 0, false);
  opc.ledStrip(320, 32, width/2, 55, 10, 0, false);
  opc.ledStrip(384, 32, width/2, 65, 10, 0, false);
  opc.ledStrip(448, 32, width/2, 75, 10, 0, false);
  
  frameRate(30);
  ps1 = new ParticleSystem(new PVector(width / 4, 0));
  ps2 = new ParticleSystem(new PVector((width / 2), 0));
  ps3 = new ParticleSystem(new PVector((width / 4) * 3, 0));
}

void draw()
{
  background(0);
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