OPC opc;
int diameter = 0;
boolean expanding = true;

void setup()
{
  size(650, 80);
  frameRate(20);
  colorMode(HSB, 350, 100, 100);
  noStroke();

	// Connect to the local instance of fcserver
	opc = new OPC(this, "127.0.0.1", 7890);

  opc.ledStrip(0, 32, width/2, 5, 10, 0, false);
  opc.ledStrip(64, 32, width/2, 15 , 10, 0, false);
  opc.ledStrip(128, 32, width/2, 25, 10, 0, false);
  opc.ledStrip(192, 32, width/2, 35, 10, 0, false);
  opc.ledStrip(256, 32, width/2, 45, 10, 0, false);
  opc.ledStrip(320, 32, width/2, 55, 10, 0, false);
  opc.ledStrip(384, 32, width/2, 65, 10, 0, false);
  opc.ledStrip(448, 32, width/2, 75, 10, 0, false);
  //opc.ledStrip(172, 64, 40, height / 2, 5, PI/2, false);
 //opc.ledGrid(0, 64, 8, width/2, 2*height /3, 10, 15, 0, false);

}


void draw()
{
	noStroke();
//background(127, 127, 127);
  for (int i = 0; i < 36; i++)
  {
  	fill(i * 10, 60, 20);
  	rect(0, i * 10, width, 10);
  }

  noFill();
  strokeWeight(4);
  stroke(0, 0, 50);
  ellipse(width/2, height/2, diameter, diameter);

  if(expanding)
  {
  	diameter += 4;
  	if (diameter > 180)
  	{
  		expanding = false;
  	}
  }
  else
  {
  	diameter -= 4;
  	if (diameter == 4)
  	{
  		expanding = true;
  	}
  }
}