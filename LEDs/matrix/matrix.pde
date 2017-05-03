import java.util.Iterator;

ParticleSystem ps;
OPC opc;
int leds = 32;
int strips = 8;
int timer = 0;
float cellSize = 20;
float noiseStep = 0.05;

void setup()
{
	size(720,120);
	colorMode(HSB, 360, 100, 100);

	// Connect to the local instance of fcserver
	opc = new OPC(this, "127.0.0.1", 7890);
	float ledStep = width / leds;


	opc.ledStrip(0, 64, width/2, 5, 10, 0, false);
	opc.ledStrip(64, 64, width/2, 15 , 10, 0, false);
	opc.ledStrip(128, 64, width/2, 25, 10, 0, false);
	opc.ledStrip(192, 64, width/2, 35, 10, 0, false);
	opc.ledStrip(256, 64, width/2, 45, 10, 0, false);
	opc.ledStrip(320, 64, width/2, 55, 10, 0, false);
	opc.ledStrip(384, 64, width/2, 65, 10, 0, false);
	opc.ledStrip(448, 64, width/2, 75, 10, 0, false);

	ps = new ParticleSystem(cellSize, leds);
	noStroke();
}

void draw()
{
	background(0,0,0,10);
	if (timer % 5 == 0)
	{
		ps.addParticle();
		timer = 0;
	}
	ps.run();
	timer++;
}