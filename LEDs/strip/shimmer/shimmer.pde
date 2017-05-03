OPC opc;
int leds = 64;
int cells = 66;
float rectWidth;

void setup()
{
  size(800, 50);
  colorMode(HSB, 360, 100, 100);

  // Connect to the local instance of fcserver
  opc = new OPC(this, "127.0.0.1", 7890);
  float ledStep = width / leds;
  rectWidth = width / cells;

  // Map one 64-LED strip to the center of the window
  opc.ledStrip(0, leds, width/2, height-30, ledStep, 0, false);
  frameRate(30);

  noStroke();
}


void draw()
{
  background(0);
  for (int i = 0; i < cells; i++)
  {
    fill(5 * i, 70, 30);
    rect(i * rectWidth, 0, rectWidth, height);
  }

}