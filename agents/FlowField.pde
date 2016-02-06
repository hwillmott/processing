class FlowField
{
 PVector[][] field;
 int cols, rows;
 int resolution;
 float xo, yo;
 float r;
 
 FlowField()
 {
   resolution = 30;
   cols = width / resolution;
   rows = height / resolution;
   field = new PVector[cols][rows];
   xo = yo = 4;
   r = 3;
   initializeNoise(xo, yo);
 }
 
 void initializeNoise(float xoff, float yoff)
 {
   for (int i = 0; i < rows; i++)
   {
     for (int j = 0; j < cols; j++)
     {
       float theta = map(noise(xoff, yoff + (j * 0.1)), 0, 1, PI / 2, 5 * PI / 2);
       field[j][i] = new PVector(cos(theta), sin(theta));
     }
     yoff += 0.1;
     xoff += 0.1;
   }   
 }
 
 PVector lookup(PVector lookup)
 {
   int col = int(constrain(lookup.x/resolution, 0, cols-1));
   int row = int(constrain(lookup.y/resolution, 0, rows-1));
   return field[col][row].get();
 }
 
 void display()
 {
   for (int i = 0; i < cols; i++)
   {
     line(resolution * i, 0, resolution * i, height);
     for (int j = 0; j < rows; j++)
     {
       line(0, resolution * j, width, resolution * j);
       float theta = field[i][j].heading();
       stroke(0);
       strokeWeight(1);
       pushMatrix();
       translate(resolution * i + resolution / 2, resolution * j + resolution / 2);
       rotate(theta);
       beginShape();
       vertex(0, -r*2);
       vertex(-r, r*2);
       vertex(r, r*2);
       endShape(CLOSE);
       popMatrix();
     }     
   }
 }
 
 void update()
 {
   xo += 0.01;
   yo += 0.01;
   initializeNoise(xo,yo);
 }
}