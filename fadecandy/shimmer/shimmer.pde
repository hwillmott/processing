OPC opc;
PImage dot;
int leds = 45;
int cells = 47;
float [] greenOff = new float[cells];
float [] blueOff = new float[cells];
float rectWidth;

void setup()
{
  size(800, 50);

  // Connect to the local instance of fcserver
  opc = new OPC(this, "127.0.0.1", 7890);
  float ledStep = width / leds;
  rectWidth = width / cells;

  // Map one 64-LED strip to the center of the window
  opc.ledStrip(0, leds, width/2, height-30, ledStep, 0, false);
  frameRate(30);

  for (int i = 0; i < cells; i++)
  {
    blueOff[i] = random(10);
    greenOff[i] = random(10);
  }
  noStroke();
}

void update()
{
  for (int i = 0; i < cells; i++)
  {
    blueOff[i] += 0.05;
    greenOff[i] += 0.05;
  }
}

void draw()
{
  background(0);
  update();
  for (int i = 0; i < cells; i++)
  {
    float green = map(noise(greenOff[i]), 0, 1, 50, 150);
    float blue = map(noise(blueOff[i]), 0, 1, 50, 150);
    fill(green, 0, blue, 150);
    rect(i * rectWidth, 0, rectWidth, height);
  }

}