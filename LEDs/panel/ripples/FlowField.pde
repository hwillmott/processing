class FlowField
{
 float[][] field;
 int cols, rows;
 float[] brightnessBounds;
 //float[] hueBounds;
 float hu;
 int resolution;
 float xo, yo, to;
 
 FlowField(float[] bBounds, float hue)
 {
   resolution = 10;
   cols = width / resolution;
   rows = height / resolution;
   brightnessBounds = bBounds;
   hu = hue;
   field = new float[cols][rows];
   xo = random(10);
   yo = random(10);
   to = 0;
   initializeNoise(xo, yo, to);
 }
 
 void initializeNoise(float xoff, float yoff, float toff)
 {
   for (int i = 0; i < cols; i++)
   {
     for (int j = 0; j < rows; j++)
     {
       field[i][j] = noise(xoff +(i * 0.1), yoff + (j * 0.1), toff);
     }
     yoff += 0.1;
     xoff += 0.1;
   }   
 }
 
 void display()
 {
   for (int i = 0; i < cols; i++)
   {
     for (int j = 0; j < rows; j++)
     {
      float b = map(field[i][j], 0, 1, brightnessBounds[0], brightnessBounds[1]);
      float h = map(field[i][j], 0, 1, hu, hu + 100);
      fill(h, 40, b);
      rect(i * resolution, j * resolution, resolution, resolution);
     }     
   }
 }
 
 void update()
 {
   to += 0.02;
   hu = (hu + 0.1) % 360;
   initializeNoise(xo, yo, to);
 }
}