class Particle
{
  PVector location;
  PVector velocity;
  float lifespan;
  float mass;
  int parts;
  
 Particle(PVector l)
 {
   location = l.get();
   velocity = new PVector(0,random(0.8, 1.5));
   mass = 10;
   lifespan = 250;
   parts = int(random(2, 5));
 }
 
 void update()
 {
   location.add(velocity);
   lifespan -= 1.5;
 }
 
	void display()
	{
		noStroke();
		for (int i = 0; i <= parts; i++)
		{
			fill(180,10, 60 - (10 * i));
			rect(location.x, location.y - (10 * i), 10, 10);
		}
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