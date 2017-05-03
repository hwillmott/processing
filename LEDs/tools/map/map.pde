PImage img;

void setup()
{
  size(550, 480);
  frameRate(20);
  noStroke();

  img = loadImage("pixelmap.jpg");
}

void keyPressed()
{
  print(mouseX + "," + mouseY + "\n");
}

void draw()
{
  image(img,0, 0);
}