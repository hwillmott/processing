class Bee
{
  PVector p, pOld;
  float noiseZ, noiseZVelocity = 0.01;
  float stepSize, angle;
  
 Bee()
 {
   p = new PVector(random(width), random(height));
   pOld = new PVector(p.x, p.y);
   stepSize = random(8, 15);
   noiseZ = random(0.4);
 }
 
 void Update()
 {
   if (dist(p.x, p.y, hiveX, hiveY) > stepSize * 15)
   {
     angle = atan2(hiveY - p.y, hiveX - p.x);
   }
   else
   {
     angle += random((-PI) / 6, PI / 6);     
   }
   
   p.x += cos(angle) * stepSize;
   p.y += sin(angle) * stepSize;
   
   /*
   if(p.x < -10) p.x = pOld.x = 20;
   if(p.x > width + 10) p.x = pOld.x = width - 20;
   if(p.y < -10) p.y = pOld.y = 20;
   if(p.y > height + 10) p.y = pOld.y = height - 20;
   */
   
   pOld.x += cos(angle) * stepSize * 3 / 4;
   pOld.y += sin(angle) * stepSize * 3 / 4;
   strokeWeight(strokeWidth*4);
   line(pOld.x, pOld.y, p.x, p.y);
   
   pOld.set(p);
   noiseZ = noiseZVelocity;
 }
}