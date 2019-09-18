/**
This program can be used to create a mapping for pixels on an LED sculpture (this one is fragments)
It loads an image of the sculpture with all LEDs on white.
Hovering the mouse over the image shows the coordinates of the mouse.
To generate a line of code corresponding to an LED strip
  1.left-click at the start of the strip,
  2. right-click at the end of the strip,
  3. type a digit corresponding to the number of LEDs on the strip (or 9 if there are 10 or more)
  4. type 'c'
This will output a partially complete line to use in the LED mapping. You will have to replace the
offset and the spacing (if there were 10 or more LEDs on the strip). Add the line to setup().

Re-running the visualization will show little points where the LEDs were mapped. Uncomment the
rainbow image (and comment-out the LED image) to check that the strips are arranged in the right 
directions
**/

import java.util.Arrays;
import java.lang.Math;

OPC opc;
PImage pic;
PImage rainbow;
int[] firstPoint;
int[] secondPoint;
int numPixels;

void setup()
{
  size(600, 450);
	colorMode(HSB, 360, 100, 100);
	frameRate(2);
	noStroke();

	// Connect to the local instance of fcserver
	opc = new OPC(this, "127.0.0.1", 7890);

  // A
  opc.ledStrip(0, 4, 372, 293, 11.60, 1.44, false);
  opc.ledStrip(4, 4, 352, 333, 12.65, 2.62, false);
  opc.ledStrip(8, 2, 317, 335, 13.31, -2.17, false);
  opc.ledStrip(10, 5, 332, 298, 12.81, -0.67, false);
  // B
  opc.ledStrip(15, 8, 457, 281, 12.51, -0.03, false);
  opc.ledStrip(23, 8, 513, 333, 11.88, 1.54, false);
  opc.ledStrip(31, 11, 459, 338, 12.51, -2.37, false);
  // C (new OPC output pin)
  opc.ledStrip(64, 6, 410, 174, 12.24, -0.11, false);
  opc.ledStrip(70, 10, 499, 208, 12.51, 0.64, false);
  opc.ledStrip(80, 12, 473, 252, 12.51, 3.13, false);
  opc.ledStrip(92, 6, 389, 218, 11.37, -1.76, false);
  // D (new OPC output pin)
  opc.ledStrip(128, 4, 399, 148, 12.01, -0.04, false);
  opc.ledStrip(132, 7, 393, 110, 11.62, -2.36, false);
  opc.ledStrip(139, 5, 368, 114, 11.33, 1.21, false);
  // E (new OPC output pin)
  opc.ledStrip(192, 6, 326, 251, 11.95, 2.45, false);
  opc.ledStrip(198, 6, 270, 251, 12.02, -2.34, false);
  opc.ledStrip(204, 12, 280, 161, 11.95, -1.00, false);
  opc.ledStrip(216, 11, 339, 162, 11.80, 1.38, false);
  // F (new OPC output pin)
  opc.ledStrip(256, 11, 153, 100, 11.80, -0.18, false);
  opc.ledStrip(267, 8, 194, 48, 11.56, -2.25, false);
  opc.ledStrip(275, 10, 128, 58, 11.56, 2.20, false);
  // G (new OPC output pin)
  opc.ledStrip(320, 12, 139, 171, 11.56, 0.18, false);
  opc.ledStrip(332, 7, 243, 152, 11.63, -0.83, false);
  opc.ledStrip(339, 16, 171, 132, 12.02, 2.95, false);
  // H
  opc.ledStrip(355, 4, 126, 196, 12.21, 0.40, false);
  opc.ledStrip(359, 5, 125, 229, 12.18, 2.40, false);
  opc.ledStrip(364, 4, 75, 239, 12.19, -2.65, false);
  opc.ledStrip(368, 4, 76, 208, 12.21, -0.61, false);
  // I (new OPC output pin)
  opc.ledStrip(384, 9, 198, 269, 11.70, 1.78, false);
  opc.ledStrip(393, 6, 153, 351, 12.68, 2.46, false);
  opc.ledStrip(399, 2, 108, 369, 11.66, -2.60, false);
  opc.ledStrip(401, 6, 96, 323, 11.53, -1.50, false);
  opc.ledStrip(407, 9, 149, 251, 12.39, -0.57, false);
  // J (new OPC output pin)
  opc.ledStrip(448, 17, 292, 353, 11.90, 0.97, false);
  opc.ledStrip(465, 11, 282, 402, 11.95, -2.55, false);
  opc.ledStrip(476, 7, 226, 320, 11.50, -1.46, false);

  pic = loadImage("pixels.jpg");
  rainbow = loadImage("rainbow.PNG");
}

void draw()
{
  background(0);
  fill(0, 102, 153);
  text(mouseX + ", " + mouseY, 10,10);
  image(pic, 0, 0, width, height);
  //image(rainbow, 0, 0, width, height);
}

void mousePressed() {
  if (mouseButton == LEFT) {
    firstPoint = new int[] {mouseX, mouseY};
  } else if (mouseButton == RIGHT) {
    secondPoint = new int[] {mouseX, mouseY};
  }
}

void keyPressed() {
  if (key == 'c') {
    println(firstPoint[0] + ", " + firstPoint[1] + " " + secondPoint[0] + ", " + secondPoint[1] + " " + numPixels);
    printThing();
  } else {
    numPixels = Character.getNumericValue(key);
  }
}

void printThing() {
  int x1 = firstPoint[0];
  int x2 = secondPoint[0];
  int y1 = firstPoint[1];
  int y2 = secondPoint[1];

  double distance = Math.sqrt((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2));
  println("distance" + String.format("%1$,.2f", distance));
  double spacing = distance/numPixels;
  println("spacing " + String.format("%1$,.2f", spacing));
  double radians = Math.atan2(y2-y1, x2-x1);
  println("radians " + String.format("%1$,.2f", radians));

  float middleX = (x1 + x2)/2;
  float middleY = (y1 + y2)/2;
  println("opc.ledStrip(x, " + numPixels + ", " + Math.round(middleX) + ", " + Math.round(middleY) + ", " + String.format("%1$,.2f", spacing) + ", " + String.format("%1$,.2f", radians) + ", false);");
}