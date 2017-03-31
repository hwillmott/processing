import java.util.Iterator;

FlowField f;
ParticleSystem ps;
PVector gravity;
int timer = 0;
OPC opc;

void setup()
{
	size(320,80);
	f = new FlowField();
	ps = new ParticleSystem(new PVector(width / 2 , height / 2));
	gravity = new PVector(0, 0.3);
	colorMode(HSB, 360, 100, 100);
	background(200, 80, 10);

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
}

void draw()
{
	background(200, 80, 0);
	noStroke();
	if (timer % 7 == 0)
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