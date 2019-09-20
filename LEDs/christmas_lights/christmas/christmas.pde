OPC opc;
int offset = 0;

void setup()
{
  size(660, 40);
  frameRate(10);
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
  background(0, 70, 40);
	for (int i = 0; i < 66; i++)
  {
    if (i%4 == 0)
    {
      fill(100, 80, 50);
    }
    else if (i%4 == 1)
    {
      fill(35, 60, 40);  
    }
    else if (i%4 == 2)
    {
      fill(0, 70, 40);  
    }
    else
    {
      fill(35, 60, 40);     
    }
    rect((i*10)+offset, 0, 10, height);
  }
  offset += 1;
  offset %= 20;
}