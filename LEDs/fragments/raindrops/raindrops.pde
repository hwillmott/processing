import java.util.Arrays;
OPC opc;
float minX;
float minY;
float minD;
int sizeStep;
Droplet[] droplets;

void setup()
{
  size(600, 450);
	colorMode(HSB, 360, 100, 100);
	frameRate(20);
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

  droplets = new Droplet[] {new Droplet(width/3, width/3, height/3, height/3, 300, 600, 8),
                            new Droplet(width/3, width/3, height/3, height/3, 300, 600, 7),
                            new Droplet(width/3, width/3, height/3, height/3, 300, 600, 6)};
}

void draw()
{
  background(0);
  noFill();
  stroke(360, 50, 30);
  strokeWeight(15);

  for (int i = 0; i < droplets.length; i++) {
      ellipse(droplets[i].x, droplets[i].y, droplets[i].diameter, droplets[i].diameter);
      droplets[i].update();
  }
}