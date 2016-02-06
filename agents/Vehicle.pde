class Vehicle
{
 PVector location;
 PVector velocity;
 PVector acceleration;
 float r;
 float maxForce;
 float maxSpeed;
 float wanderRadius;
 float angle;
 
 Vehicle(float x, float y)
 {
   acceleration = new PVector(0, 0);
   velocity = new PVector(2,0);
   location = new PVector(x,y);
   r = 3.0;
   maxSpeed = 2;
   maxForce = 0.5;
   wanderRadius = 5;
   angle = 0;
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
 void bounce(PVector direction)
 {
   direction.sub(velocity);
   direction.limit(maxForce);
   applyForce(direction);
 }
 
 void seek(PVector target)
 {
   PVector desired = PVector.sub(target, location);
   
   // arrive
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
   
   desired.sub(velocity);
   desired.limit(maxForce);
   applyForce(desired);
 }
 
 void wander()
 {
  PVector futurloc = PVector.add(location, PVector.mult(velocity, 20));
  stroke(0);
  line(location.x, location.y, futurloc.x, futurloc.y);
  noFill();
  ellipse(futurloc.x, futurloc.y, wanderRadius * 2, wanderRadius * 2);
  angle += random(-PI / 4, PI / 4);
  futurloc.add(cos(angle) * wanderRadius, sin(angle) * wanderRadius);
  ellipse(futurloc.x, futurloc.y, 3, 3);
  seek(futurloc); 
 }
 
 void bounceOffWalls()
 {
   if (location.x < 50)
   {
     bounce(new PVector(maxSpeed, velocity.y));
   }
   else if (location.x > width - 50)
   {
     bounce(new PVector(-maxSpeed, velocity.y));
   }
   if (location.y < 50)
   {
     bounce(new PVector(velocity.x, maxSpeed));
   }
   else if (location.y > height - 50)
   {
     bounce(new PVector(velocity.x, -maxSpeed));
   }
 }
 
 void display()
 {
   float theta = velocity.heading() + PI/2;
   fill(175);
   stroke(0);
   pushMatrix();
   translate(location.x, location.y);
   rotate(theta);
   beginShape();
   vertex(0, -r*2);
   vertex(-r, r*2);
   vertex(r, r*2);
   endShape(CLOSE);
   popMatrix();
 }
}