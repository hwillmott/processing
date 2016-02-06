class Fragment
{
 float step;
 float factor;
 float opacity;
 int count;
 float[] x;
 float[] y;

 Fragment()
 {
  initializeShape(0);
 }
 
 void initializeShape(float lowerBound)
 {
  x = new float[20];
  y = new float[20]; 
  count = 0;
  
  step = random(1,1.3);
  factor = random(1,2);
  
  float x1 = random(200,750);
  float y1 = random(lowerBound, 450);
  calculateOpacity(y1);
  
  float angle = random(HALF_PI);
  while(angle < TWO_PI)
  {
    float xr = cos(angle) * random(4,8) * factor;
    float yr = sin(angle) * random(7,12) * factor;
    x[count] = x1 + xr;
    y[count] = y1 + yr;
    count++;
    angle = angle + random(PI * 3 / 4);
  }  
 }
 
 void display()
 {
   fill(0, opacity);
   noStroke();
   beginShape();
   for(int i = 0; i < count; i++) //<>//
   {
     vertex(x[i],y[i]);
   }
   endShape(CLOSE);
 }
 
 void calculateOpacity(float yi)
 {
    float temp = yi - 150;
    if (temp < 0) opacity = 0;
    else
    {
      opacity = max(temp / height * 100, 0);
    } 
 }
 
 void update()
 {
   if (y[count - 1] < 10) initializeShape(430);
   else
   {
    for(int i = 0; i < count; i++)
    {
      y[i] = y[i] - step;
      calculateOpacity(y[i]);
    }
   }
 }
}