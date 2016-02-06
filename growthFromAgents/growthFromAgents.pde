int maxCount = 5000; //max count of the cirlces
int numGenerations = 8;
int generationSize = maxCount/numGenerations;
int currentCount = 1;
float maxDistanceSoFar = 1;
float[] x = new float[maxCount];
float[] y = new float[maxCount];
float[] r = new float[maxCount];

void setup() {
  size(1000,1000);
  smooth();
  //frameRate(10);

  // first circle
  x[0] = width/2;
  y[0] = height/2;
  r[0] = 5;
}

/*int getRadiusForOldCell(int i, int currentCount)
{
  int age = currentCount - i;
  int generation = age / generationSize;
  return max(generation, 1);
} */

/*int getRadiusForOldCell(int i, int currentCount)
{
  float maxSize = 10;
  float distanceFromRoot = dist(x[i], y[i], width/2, height) + 1;
  float distance = currentCount/distanceFromRoot;
  return min(max(int(distance), 1), 10);
}*/

int getRadiusForOldCell(int i, int currentCount)
{
  if (i == 0) return 5;
  float distanceFromRoot = dist(x[i], y[i], x[0], y[0]) + 1;
  float proportionalDistance = (maxDistanceSoFar - distanceFromRoot) / maxDistanceSoFar * 10;
  return int(proportionalDistance);
}

void draw() {
  background(255);

  strokeWeight(0.5);
  //noFill();

  // create a radom set of parameters
  float newR = random(2);
  float newX = random(0+newR, width-newR);
  float newY = random(0+newR, height-newR);

  float closestDist = 100000000;
  int closestIndex = 0;
  // which circle is the closest?
  for(int i=0; i < currentCount; i++) {
    float newDist = dist(newX,newY, x[i],y[i]);
    if (newDist < closestDist) {
      closestDist = newDist;
      closestIndex = i; 
    } 
  }
  
  float distanceFromOrigin = dist(newX, newY, x[0], y[0]);
  if (distanceFromOrigin > maxDistanceSoFar) maxDistanceSoFar = distanceFromOrigin;

  // show random position and line
  // fill(230);
  // ellipse(newX,newY,newR*2,newR*2); 
  // line(newX,newY,x[closestIndex],y[closestIndex]);

  // aline it to the closest circle outline
  float angle = atan2(newY-y[closestIndex], newX-x[closestIndex]);
  int R = getRadiusForOldCell(closestIndex, currentCount);
  x[currentCount] = x[closestIndex] + cos(angle) * (r[closestIndex]+newR);
  y[currentCount] = y[closestIndex] + sin(angle) * (r[closestIndex]+newR);
  r[currentCount] = newR;
  currentCount++;

  // draw them
  for (int i=0 ; i < currentCount; i++) {
    //fill(50,150);
    if (i > currentCount - 50)
    {
      fill(70, 150);
    }
    else if (i > currentCount - 150)
    {
      fill(70, 100);
    }
    else fill(50);
    int factor = getRadiusForOldCell(i, currentCount);
    ellipse(x[i],y[i], r[i]*factor,r[i]*factor);  
  }

  if (currentCount >= maxCount) noLoop();
}