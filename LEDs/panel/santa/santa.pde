
OPC opc;
PFont f;
float x; // Horizontal location
float w;
String message;
PImage img;

void setup()
{
	size(320, 80);
	// Initialize headline offscreen
	img = loadImage("santa3.png");
	x = width;

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

	image(img, x, 0, height*3, height*1.1);
	// Decrement x
	x = x - 1;

  if (x < -(width)) {
    x = width;
  }
}
