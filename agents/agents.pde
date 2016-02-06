import java.util.Iterator;

Vehicle v;
FlowField f;
ParticleSystem ps;
PVector gravity;
int timer = 0;

void setup()
{
 size(800,500);
 colorMode(HSB, 360, 100, 100, 300);
 f = new FlowField();
 ps = new ParticleSystem(new PVector(width / 2 , height / 2));
 gravity = new PVector(0, 0.8);
}

void draw()
{
 background(360);
 if (timer % 20 == 0)
 {
   ps.addParticle();
   timer = 0;
 }
 //f.display();
 ps.applyForce(f);
 ps.applyForce(gravity);
 ps.run();
 f.update();
 timer++;
}