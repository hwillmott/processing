OPC opc;
int leds = 36;
int strips = 6;
float [][] color1Off = new float[leds][strips];
float [][] color2Off = new float[leds][strips];
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

  frameRate(30);

  for (int i = 0; i < leds; i++)
  {
    for (int j = 0; j < strips; j++)
    {
      color1Off[i][j] = random(5);
      color2Off[i][j] = random(5);
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
      color2Off[i][j] += noiseStep;
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
      float green = map(noise(color1Off[i][j]), 0, 1, 50, 110);
      float blue = map(noise(color2Off[i][j]), 0, 1, 0, 100);
      fill(0, 0, blue, 150);
      rect(i * cellSize, j * cellSize, cellSize, cellSize);
    }
  }

}