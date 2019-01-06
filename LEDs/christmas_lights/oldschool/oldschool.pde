import java.util.Random;
OPC opc;

int leds = 64;
int strips = 3;
float [][] colors = new float[leds][strips];
float [][] sats = new float[leds][strips];
float cellSize = 10;
float noiseStep = 0.05;
int count = 0;
int countlimit = 10;
float[][] silver = new float[][]{{10, 10},
                                  {200, 50}};
float[][] purple = new float[][]{{300, 80},
                                  {55, 60}};
float[][] hannukahColors = new float[][]{{240, 40},
                                          {40, 30}};
float[][] christmasColors = new float[][]{{0, 50},
                                          {70, 80},
                                          {40, 50}};
float[][] oldSchoolColors = new float[][]{{320, 80},
                                          {45, 80},
                                          {123, 70},
                                          {234, 70},
                                          {25, 80},
                                          {0, 80},
                                          {35, 50}};

void setup()
{
  size(640, 30);
  frameRate(5);
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

float[] getColor(float[][] colors)
{
  int rnd = new Random().nextInt(colors.length);
  return colors[rnd];
}

void update()
{
  count = 0;
  for (int i = 0; i < leds; i++)
    {
      for (int j = 0; j < strips; j++)
      {
        float[] hueSat = getColor(oldSchoolColors);
        colors[i][j] = hueSat[0];
        sats[i][j] = hueSat[1];
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