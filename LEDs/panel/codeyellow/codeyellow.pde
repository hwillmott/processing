OPC opc;

int leds = 64;
int strips = 3;
int offset = 0;
int count = 0;

void setup()
{
  size(320,80);
  frameRate(2);
  colorMode(HSB, 350, 100, 100);
  noStroke();

  // Connect to the local instance of fcserver
  opc = new OPC(this, "127.0.0.1", 7890);

  // make a 32 x 8 grid
  opc.ledStrip(0, 32, width/2, 5, 10, 0, true);
  opc.ledStrip(64, 32, width/2, 15 , 10, 0, true);
  opc.ledStrip(128, 32, width/2, 25, 10, 0, true);
  opc.ledStrip(192, 32, width/2, 35, 10, 0, true);
  opc.ledStrip(256, 32, width/2, 45, 10, 0, true);
  opc.ledStrip(320, 32, width/2, 55, 10, 0, true);
  opc.ledStrip(384, 32, width/2, 65, 10, 0, true);
  opc.ledStrip(448, 32, width/2, 75, 10, 0, true); 
}

void draw()
{
  background(0, 0, 0);
  if (count % 2 ==0)
  {
    background(60,50,50);
  }
  count += 1;
  count %= 2;
}