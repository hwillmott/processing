class ParticleSystem
{
	ArrayList<Particle> particles;
	float cellSize;
	int cells;

	ParticleSystem(float cellSize, int cells)
	{
		this.cellSize = cellSize;
		this.cells = cells;
		particles = new ArrayList<Particle>();
	}
 
	void addParticle()
	{
		float newX = (this.cellSize * (1/2 + int(random(this.cells))));
		particles.add(new Particle(new PVector(newX, 0)));
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