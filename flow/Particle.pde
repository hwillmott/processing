class Particle
{
 PVector location;
 PVector velocity;
 PVector acceleration;
 float lifespan;
 float mass;
 float maxSpeed;
 int displayTimer;
 
 Particle(PVector l)
 {
   location = l.get();
   velocity = new PVector(0,0);
   acceleration = new PVector(0,0);
   lifespan = 400;
   mass = 10;
   maxSpeed = 1.5;
   displayTimer = 0;
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
    if (displayTimer % 5 == 0)
    {
      strokeWeight(2);
      stroke(0, 80, 120, lifespan);
      ellipse(location.x, location.y, 5, 5);
      displayTimer = 0;
    }
    displayTimer += 1;
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