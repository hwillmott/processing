class ParticleSystem
{
  int total = 30;
  ArrayList<Particle> particles;
  PVector origin;
  
  ParticleSystem(PVector l)
  {
    particles = new ArrayList<Particle>();
    origin = l.get();
  }
  
  void addParticle()
  {
    particles.add(new Particle(origin));
  }
  
  void applyForce(FlowField f)
  {
    for (Particle p : particles)
    {
      PVector fieldForce = f.lookup(p.location);
      fieldForce.normalize();
      p.applyForce(fieldForce);
    }
  }
  
  void applyForce(PVector f)
  {
    for (Particle p : particles)
    {
      p.applyForce(f);
    }
  }
  
  void run()
  {
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext())
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