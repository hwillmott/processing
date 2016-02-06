class Particle
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass;
  
 Particle(PVector l)
 {
   location = l.get();
   velocity = new PVector(1, -1);
   acceleration = new PVector(0, 0.01);
   mass = 10;
   lifespan = 300;
 }
 
 void applyForce(PVector force)
 {
   PVector f = force.get();
   f.div(mass);
   acceleration.add(f);
 }
 
 void update()
 {
   location.add(velocity);
   velocity.add(acceleration);
   acceleration.mult(0);
   lifespan -= 1.5;
 }
 
 void display()
 {
   strokeWeight(2);
   stroke(195, 46, 80, lifespan);
   ellipse(location.x, location.y, 5, 5);
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