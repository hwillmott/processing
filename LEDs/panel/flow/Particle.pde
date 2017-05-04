class Particle
{
 PVector location;
 PVector velocity;
 PVector acceleration;
 float lifespan;
 float mass;
 float maxSpeed;
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
   hue = random(30,35);
   sat = random(40,50);
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
    stroke(hue, sat, brightness);
    fill(hue,sat,brightness);
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