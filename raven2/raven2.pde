Fragment[] f;
PShape raven;
PShape[] feathers;
PImage img;
int count = 0;
color featherColor = color(0, 70);

void setup()
{  
  size(1000,700);
  colorMode(HSB,360,100,100,100);
  f = new Fragment[50];
  for(int i = 0; i < 50; i++)
  {
    f[i] = new Fragment();
  }
  
  img = loadImage("crow.png");
}

void draw()
{
  background(360,30);
  for(int i = 0; i < 50; i++)
  {
    f[i].display();
    f[i].update();
  }
  image(img,100,254, 800, 446);
}