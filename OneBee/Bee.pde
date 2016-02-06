class Bee
{
 PVector location;
 PVector velocity;
 PVector acceleration;
 PVector flower;
 float maxSpeed;
 float maxForce;
 float wanderRadius;
 float angle;
 
 Bee(float x, float y)
 {
   acceleration = new PVector(0,0);
   velocity = new PVector(2,0);
   location = new PVector(x,y);
   flower = new PVector(width / 3, height - 100);
   maxSpeed = 2;
   maxForce = 0.5;
   wanderRadius = 5;
   angle = 0;
 }
 
 void wander()
 {
   PVector future = PVector.add(location, PVector.mult(velocity, 20));
   stroke(0);
   line(location.x, location.y, future.x, future.y);
   noFill();
   ellipse(future.x, future.y, wanderRadius * 2, wanderRadius * 2);
   angle += random(-PI / 4, PI / 4);
   future.add(cos(angle) * wanderRadius, sin(angle) * wanderRadius);
   ellipse(future.x, future.y, 3, 3);
   arrive(future);
 }
 
 void arrive(PVector target)
 {
   PVector desired = PVector.sub(target, location);
   float d = desired.mag();
   desired.normalize();
   if (d < wanderRadius)
   {
     float m = map(d, 0, wanderRadius, 0, maxSpeed);
     desired.mult(m);
   }
   else
   {
     desired.mult(maxSpeed);
   }
   
   PVector steer = PVector.sub(desired, velocity);
   steer.limit(maxForce);
   applyForce(steer);
 }
 
 void bounceOffWalls()
 {
   PVector desired;
   if (location.x < 25)
   {
     desired = new PVector(maxSpeed, velocity.y);
     desired.sub(velocity);
     desired.limit(maxForce);
     applyForce(desired);
   }
   else if (location.x > width - 25)
   {
     desired = new PVector(maxSpeed * -1, velocity.y);
     desired.sub(velocity);
     desired.limit(maxForce);
     applyForce(desired);
   }
   if (location.y < 25)
   {
     desired = new PVector(velocity.x, maxSpeed);
     desired.sub(velocity);
     desired.limit(maxForce);
     applyForce(desired);
   }
   else if (location.y > height - 25)
   {
     desired = new PVector(velocity.x, maxSpeed * -1);
     desired.sub(velocity);
     desired.limit(maxForce);
     applyForce(desired);
   }
   
 }
 
 void update()
 {
   velocity.add(acceleration);
   velocity.limit(maxSpeed);
   location.add(velocity);
   acceleration.mult(0);
 }
 
 void applyForce(PVector force)
 {
   acceleration.add(force);
 }
 
 void display()
 {
  fill(255);
  ellipse(location.x, location.y, 4, 4);  
 }
  
}