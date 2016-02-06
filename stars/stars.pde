float[] starsX;
float[] starsY;
float[] starsR;
int count = 1000;
float angle = 0;

void setup()
{
  size(1000,500);
  frameRate(10);
  starsX = new float[count];
  starsY = new float[count];
  starsR = new float[count];
  float hypotenuse = sqrt(width * width + height * height);
  for (int i = 0; i < count; i++)
  {
   starsX[i] = random(-hypotenuse, hypotenuse);
   starsY[i] = random(-hypotenuse, hypotenuse);
   starsR[i] = random(2,4);
  }
  
}

void draw()
{
  background(#111e36);
  translate(width/2, height);
  rotate(angle);
  angle += PI / 10000;
  for (int i = 0; i < count; i++)
  {
    fill(255);
   ellipse(starsX[i], starsY[i], starsR[i], starsR[i]); 
  }
}