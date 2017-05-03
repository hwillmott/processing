import java.util.Iterator;

FlowField f;
ParticleSystem ps;
PVector gravity;
int timer = 0;

void setup()
{
	size(1000,800);
	f = new FlowField();
	ps = new ParticleSystem(new PVector(width / 2 , height / 2));
	gravity = new PVector(0, 0.3);
	background(0, 12, 12);
}

void draw()
{
	noStroke();
	fill(0, 8, 12, 10);
	rect(0, 0, width, height);
	fill(0, 0, 100, 1);
	rect(0, 0, width, height);
	if (timer % 10 == 0)
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