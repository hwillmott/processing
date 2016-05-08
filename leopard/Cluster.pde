class Cluster
{
	boolean hasCenter;
	PVector centerRadii;
	Spot center;
	Spot[] spots;
	int numSpots;
	PVector origin;
	color centerSpotColor;
	color auxiliarySpotColor;

	Cluster(PVector location, int numSpots)
	{
		this.numSpots = numSpots;
		this.hasCenter = numSpots > 5;
		if (this.hasCenter)
		{
			this.centerRadii = new PVector(random(10,20), random(10,20));
		}
		else
		{
			this.centerRadii = new PVector(random(0,5), random(0,5));
		}
		this.spots = new Spot[this.numSpots];
		this.origin = location.get();
		this.centerSpotColor = color(169, 104, 54);
		this.auxiliarySpotColor = color(0,0,0,150);

		this.initializeSpots();
	}

	void initializeSpots()
	{
		if (this.hasCenter)
		{
			this.center = new Spot(this.origin, this.centerSpotColor, this.centerRadii);
		}

		for (int i = 0; i < this.numSpots; i++)
		{
			PVector locn = this.centerRadii.get();
			locn.rotate(random(0, TWO_PI));
			locn.add(this.origin);
			this.spots[i] = new Spot(locn, this.auxiliarySpotColor, new PVector(random(10,15), random(10,15)));
		}
	}

	void update()
	{
		if (this.hasCenter)
		{
			this.center.wiggle();
			this.center.update();	
		}

		for (Spot s : this.spots)
		{
			s.wander();
			s.wiggle();
			s.update();
		}
	}

	void render()
	{
		// render all spots
		if (this.hasCenter)
		{
			this.center.render();	
		}
		for (Spot s : this.spots)
		{
			s.render();
		}
	}
}