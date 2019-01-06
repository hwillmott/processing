OPC opc;
int leds = 64;
int strips = 3;
float [][] color1Off = new float[leds][strips];
float cellSize = 12;
float noiseStep = 0.05;

void setup()
{
  size(660, 40);
  colorMode(HSB, 350, 100, 100);

  // Connect to the local instance of fcserver
  opc = new OPC(this, "127.0.0.1", 7890);

  opc.ledStrip(0, 64, width/2, 10, 10, 0, false);
  opc.ledStrip(64, 64, width/2, 20 , 10, 0, false);
  opc.ledStrip(128, 64, width/2, 30, 10, 0, false);

  frameRate(10);

  for (int i = 0; i < leds; i++)
  {
    for (int j = 0; j < strips; j++)
    {
      color1Off[i][j] = random(5);
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
      color1Off[i][j] += noiseStep;
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
      float b = map(noise(color1Off[i][j]), 0, 1, 0, 80);
      fill(30, 60, b);
      rect(i * cellSize, j * cellSize, cellSize, cellSize);
    }
  }

}