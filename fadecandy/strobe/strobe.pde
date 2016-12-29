OPC opc;
int offset = 0;
int count = 0;

void setup()
{
  size(640, 40);
  frameRate(30);
  colorMode(HSB, 350, 100, 100);
  noStroke();

	// Connect to the local instance of fcserver
	opc = new OPC(this, "127.0.0.1", 7890);

  opc.ledStrip(0, 64, width/2, 10, 10, 0, false);
  opc.ledStrip(64, 64, width/2, 20 , 10, 0, false);
  opc.ledStrip(128, 64, width/2, 30, 10, 0, false);

}


void draw()
{
  background(0, 0, 0);
	if (count % 2 ==0)
  {
    background(0,0,100);
  }
  count += 1;
  count %= 2;
}