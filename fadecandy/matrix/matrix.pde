import java.util.Iterator;

ParticleSystem ps;
OPC opc;
int leds = 36;
int strips = 6;
int timer = 0;
float cellSize = 20;
float noiseStep = 0.05;

void setup()
{
	size(720,120);

	// Connect to the local instance of fcserver
	opc = new OPC(this, "127.0.0.1", 7890);
	float ledStep = width / leds;

	// make a 36 x 6 grid
	opc.simpleLedGrid(36, 6, width/2, height, cellSize, cellSize);

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