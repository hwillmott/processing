class Particle
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass;
  float r;
  float g;
  float b;
  
 Particle(PVector l)
 {
   location = l.get();
   velocity = new PVector(random(-1,1), random(0,1));
   acceleration = new PVector(random(0, 0.05), random(0,0.05));
   mass = 10;
   lifespan = 300;
   r = random(100,250);
   g = random(100,250);
   b = random(0,255);
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
   fill(r, g, b);
   noStroke();
   ellipse(location.x, location.y, 15, 15);
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