class ParticleSystem
{
 int total = 10;
 ArrayList<Particle> particles;
 PVector origin;
 
 ParticleSystem(PVector location)
 {
  particles = new ArrayList<Particle>();
  origin = location.get();
 }
 
 void addParticle()
 {
   particles.add(new Particle(origin));
 }
 
 void applyForce(PVector force)
 {
  for (Particle p: particles)
  {
    p.applyForce(force);
  }
 }
 
 void run()
 {
   Iterator<Particle> it = particles.iterator();
   while(it.hasNext())
   {
     Particle p = it.next();
     p.run();
     if (p.isDead())
     {
       it.remove();
     }
   }
 }
}