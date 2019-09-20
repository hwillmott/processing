OPC opc;

int leds = 64;
int strips = 3;
float [][] colors = new float[leds][strips];
float [][] sats = new float[leds][strips];
float cellSize = 10;
float noiseStep = 0.05;
int count = 0;
int countlimit = 10;

void setup()
{
  size(640, 30);
  frameRate(1);
  colorMode(HSB, 350, 100, 100);
  noStroke();

	// Connect to the local instance of fcserver
	opc = new OPC(this, "127.0.0.1", 7890);

  opc.ledStrip(0, 64, width/2, 5, 10, 0, false);
  opc.ledStrip(64, 64, width/2, 15 , 10, 0, false);
  opc.ledStrip(128, 64, width/2, 25, 10, 0, false);

  update();
  noStroke();
}

void update()
{
  count = 0;
  for (int i = 0; i < leds; i++)
    {
      for (int j = 0; j < strips; j++)
      {
        float r = random(9);
        if (r < 1)
        {
          colors[i][j] = 320;
          sats[i][j] = 80;
        }
        else if (r < 2)
        {
          colors[i][j] = 45;
          sats[i][j] = 80;
        }
        else if (r < 3)
        {
          colors[i][j] = 123;
          sats[i][j] = 70; 
        }
        else if (r < 4)
        {
          colors[i][j] = 234;
          sats[i][j] = 70;
        }
        else if (r < 5)
        {
          colors[i][j] = 25;
          sats[i][j] = 80;
        }
        else if (r < 6)
        {
          colors[i][j] = 0;
          sats[i][j] = 80;
        }
        else 
        {
          colors[i][j] = 35;
          sats[i][j] = 50;
        }
      }
    }
}

void draw()
{
  background(0);
  for (int i = 0; i < leds; i++)
  {
    for (int j = 0; j < strips; j++)
    {
      fill(colors[i][j], sats[i][j], 40);
      rect(i * cellSize, j * cellSize, cellSize, cellSize);
    }
  }
  count += 1;
  if (count == countlimit)
  {
    update();
  }

}