OPC opc;
int diameter = 0;
boolean expanding = true;

void setup()
{
  size(650, 360);
  frameRate(20);
  colorMode(HSB, 350, 100, 100);
  noStroke();

	// Connect to the local instance of fcserver
	opc = new OPC(this, "127.0.0.1", 7890);

  opc.ledStrip(0, 64, 10, height / 2, 5, PI/2, false);
  opc.ledStrip(64, 64, 20, height / 2, 5, PI/2, false);
  opc.ledStrip(128, 64, 30, height / 2, 5, PI/2, false);
  opc.ledStrip(192, 64, 40, height / 2, 5, PI/2, false);
  opc.ledStrip(256, 64, 50, height / 2, 5, PI/2, false);
  opc.ledStrip(320, 64, 60, height / 2, 5, PI/2, false);
  opc.ledStrip(384, 64, 70, height / 2, 5, PI/2, false);
  opc.ledStrip(448, 64, 80, height / 2, 5, PI/2, false);
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