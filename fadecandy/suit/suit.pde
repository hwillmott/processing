OPC opc;
int diameter = 0;
boolean expanding = true;
Ring[] rings;

void setup()
{
  size(300, 300);
  frameRate(20);
  colorMode(HSB, 350, 100, 100);
  noStroke();

	// Connect to the local instance of fcserver
	opc = new OPC(this, "127.0.0.1", 7890);

	opc.ledRing(0, float(width/2), float(height/2), 32, float(90));
	opc.ledRing(32, float(width/2), float(height/2), 24, float(70));

	// needs to be on 3rd output port
	opc.ledRing(128, float(width/2), float(height/2), 16, float(50));
	opc.ledRing(16 + 128, float(width/2), float(height/2), 12, float(30));
	opc.ledRing(28 + 128, float(width/2), float(height/2), 8, float(15));
	opc.led(36 + 128, width/2, height/2);
}

void draw()
{
	noStroke();
	//background(40, 70, 40);
  for (int i = 0; i < 36; i++)
  {
  	fill(i * 10, 40, 40);
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