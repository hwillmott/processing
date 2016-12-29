OPC opc;

int leds = 64;
int strips = 3;
float [][] colorOff = new float[leds][strips];
float cellSize = 10;
float noiseStep = 0.05;

void setup()
{
  size(640, 30);
  frameRate(20);
  colorMode(HSB, 350, 100, 100);
  noStroke();

	// Connect to the local instance of fcserver
	opc = new OPC(this, "127.0.0.1", 7890);

  opc.ledStrip(0, 64, width/2, 5, 10, 0, false);
  opc.ledStrip(64, 64, width/2, 15 , 10, 0, false);
  opc.ledStrip(128, 64, width/2, 25, 10, 0, false);

  for (int i = 0; i < leds; i++)
    {
      for (int j = 0; j < strips; j++)
      {
        colorOff[i][j] = random(5);
      }
    }
    noStroke();
}

void update()
{
  for (int i = 0; i < leds; i++)
  {
    for (int j = 0; j < strips; j++)
    {
      colorOff[i][j] += noiseStep;
    }
  }
}

void draw()
{
  background(0);
  update();
  for (int i = 0; i < leds; i++)
  {
    for (int j = 0; j < strips; j++)
    {
      float b = map(noise(colorOff[i][j]), 0, 1, 15, 60);
      fill(35, 60, b);
      rect(i * cellSize, j * cellSize, cellSize, cellSize);
    }
  }

}