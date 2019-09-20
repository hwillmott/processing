
OPC opc;
PFont f;
float x; // Horizontal location
int flapTimer;
int flapInterval;
float w;
String message;
PImage img;
PImage img1;
PImage img2;

void setup()
{
	size(320, 80);
	// Initialize headline offscreen
	img = loadImage("bee.png");
	img1 = loadImage("bee1.png");
	img2 = loadImage("bee2.png");
	x = width;
	flapTimer = 0;
	flapInterval = 15;

	// Connect to the local instance of fcserver
	opc = new OPC(this, "127.0.0.1", 7890);

	// This is the opposite of normal because I wrote this when the LED panel was mounted upside down
	opc.ledStrip(0, 32, width/2, 75, 10, 0, false);
	opc.ledStrip(64, 32, width/2, 65 , 10, 0, false);
	opc.ledStrip(128, 32, width/2, 55, 10, 0, false);
	opc.ledStrip(192, 32, width/2, 45, 10, 0, false);
	opc.ledStrip(256, 32, width/2, 35, 10, 0, false);
	opc.ledStrip(320, 32, width/2, 25, 10, 0, false);
	opc.ledStrip(384, 32, width/2, 15, 10, 0, false);
	opc.ledStrip(448, 32, width/2, 5, 10, 0, false); 

}

void draw()
{
	background(0);

	if (flapTimer < flapInterval) {
		image(img1, x, 0, height*1.5, height*1.1);

	} else {
		image(img2, x, 0, height*1.5, height*1.1);
	}

	// Decrement x
	x = x - 1;
	flapTimer = (flapTimer + 1)%(2*flapInterval);

  // If x is less than the negative width, then it is off the screen
  // textWidth() is used to calculate the width of the current String.
  if (x < -(height*1.5)) {
    x = width;
  }
}
