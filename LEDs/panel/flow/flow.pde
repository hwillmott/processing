import java.util.Iterator;

FlowField flowField;
ParticleSystem ps;
PVector gravity;
int timer = 0;
OPC opc;

void setup()
{
	size(320,80);
	flowField = new FlowField(0, 2 * PI);
	ps = new ParticleSystem(new PVector(width, height / 2));
	gravity = new PVector(-1.5, 0);
	colorMode(HSB, 360, 100, 100);
	background(200, 80, 10);

	// Connect to the local instance of fcserver
	opc = new OPC(this, "127.0.0.1", 7890);

	// make a 32 x 8 grid
	opc.ledStrip(0, 32, width/2, 5, 10, 0, true);
	opc.ledStrip(64, 32, width/2, 15 , 10, 0, true);
	opc.ledStrip(128, 32, width/2, 25, 10, 0, true);
	opc.ledStrip(192, 32, width/2, 35, 10, 0, true);
	opc.ledStrip(256, 32, width/2, 45, 10, 0, true);
	opc.ledStrip(320, 32, width/2, 55, 10, 0, true);
	opc.ledStrip(384, 32, width/2, 65, 10, 0, true);
	opc.ledStrip(448, 32, width/2, 75, 10, 0, true); 
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
	//flowField.display();
	ps.applyForce(flowField);
	ps.applyForce(gravity);
	ps.run();
	flowField.update();
	timer++;
}