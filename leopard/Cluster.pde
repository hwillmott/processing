class Cluster
{
	boolean hasCenter;
	PVector spotRadii;
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
		this.hasCenter = numSpots > 5;
		if (numSpots > 5)
		{
			this.spotRadii = new PVector(random(4, 6), random(4, 6));
		}
		else if (numSpots > 2)
		{
			this.spotRadii = new PVector(random(3,5), random(3,5));
		}
		else
		{
			this.spotRadii = new PVector(random(1,4), random(1,4));
		}
		this.spots = new Spot[this.numSpots];
		this.origin = location.get();
		this.centerSpotColor = color(169, 104, 54);
		//this.auxiliarySpotColor = color(57,42,38,150);
		this.auxiliarySpotColor = color(57,42,38);

		this.initializeSpots();
	}

	void initializeSpots()
	{
		if (this.hasCenter)
		{
			this.center = new Spot(this.origin, this.centerSpotColor, new PVector(random(10,15), random(10,15)));
		}

		for (int i = 0; i < this.numSpots; i++)
		{
			PVector locn = this.spotRadii.get();
			//PVector locn = new PVector(random(0,5), random(0,5));
			locn.rotate(random(0, TWO_PI));
			locn.add(this.origin);
			this.spots[i] = new Spot(locn, this.auxiliarySpotColor, new PVector(random(7,12), random(7,12)));
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