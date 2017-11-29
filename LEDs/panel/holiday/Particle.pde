import java.util.Random;
class Particle
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass;
  float maxSpeed;
  float[] hueSat;
  float[][] hannukahColors = new float[][]{{240, 40},
                                            {40, 30}};
  float[][] christmasColors = new float[][]{{0, 50},
                                            {70, 80},
                                            {40, 50}};
  float[][] oldSchoolColors = new float[][]{{320, 80},
                                            {45, 80},
                                            {123, 70},
                                            {234, 70},
                                            {25, 80},
                                            {0, 80},
                                            {35, 50}};
  float hue;
  float sat;
 
  Particle(PVector l)
  {
    location = l.get();
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    lifespan = int(width);
    mass = 80;
    maxSpeed = 1.5;
    getColor(hannukahColors);
  }

  void getColor(float[][] colors)
  {
    int rnd = new Random().nextInt(colors.length);
    hueSat = colors[rnd];
  }
 
 void applyForce(PVector force)
 {
   PVector f = force.get();
   PVector fPrime = new PVector(f.x, abs(f.y));
   fPrime.div(mass);
   acceleration.add(fPrime);
 }
 
 void update()
 {
   velocity.add(acceleration);
   velocity.limit(maxSpeed);
   location.add(velocity);
   acceleration.mult(0);
   lifespan -= 1;
 }
  
  void display()
  {
    float brightness = map(lifespan, width, 0, 60, -10);
    strokeWeight(2);
    stroke(hueSat[0], hueSat[1], brightness);
    fill(hueSat[0],hueSat[1],brightness);
    ellipse(location.x, location.y, 10, 10);
  }
  
  void run()
  {
    display();
    update();
  }
  
  boolean isDead()
  {
    if (lifespan < 0) return true;
    else return false;
  }
}