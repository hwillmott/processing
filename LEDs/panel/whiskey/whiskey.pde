OPC opc;
PFont f;
float x; // Horizontal location
float w;
String message;

void setup()
{
	size(320, 80);
	// Initialize headline offscreen
	x = width;
	message = "PANIC!";
	frameRate(25); // 25 is good for short messages (1-2 words)
	noStroke();
	f = createFont("Arial",100,true);
	textSize(100);
	w = textWidth(message); 

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
	textFont(f,100);
	fill(178, 115, 42);

	textAlign (LEFT);	
	// A specific String from the array is displayed according to the value of the "index" variable.
	text(message, x, height);

	// Decrement x
	x = x - 3;

  // If x is less than the negative width, then it is off the screen
  // textWidth() is used to calculate the width of the current String.
  if (x < -(w)) {
    x = width;
  }
}
