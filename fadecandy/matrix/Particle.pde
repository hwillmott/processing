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
   velocity = new PVector(0,1);
   mass = 10;
   lifespan = 300;
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
			fill(0,100,0, 120 - (30 * i));
			rect(location.x, location.y - (20 * i), 20, 20);
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