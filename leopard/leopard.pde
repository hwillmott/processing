ArrayList<Cluster> clusters;
PImage img;

void setup()
{
    size(1092,800);
    this.clusters = new ArrayList<Cluster>();
    this.initializeClusters();
    frameRate(20);
    img = loadImage("leopard.png");
}

void initializeClusters()
{
	
this.clusters.add(new Cluster(new PVector(177,565), 1));
this.clusters.add(new Cluster(new PVector(193,487), 2));
this.clusters.add(new Cluster(new PVector(221,414), 3));
this.clusters.add(new Cluster(new PVector(231,362), 4));
this.clusters.add(new Cluster(new PVector(256,300), 5));
this.clusters.add(new Cluster(new PVector(294,242), 6));
this.clusters.add(new Cluster(new PVector(529,212), 5));
this.clusters.add(new Cluster(new PVector(488,172), 1));
this.clusters.add(new Cluster(new PVector(644,263), 2));
this.clusters.add(new Cluster(new PVector(529,290), 2));
this.clusters.add(new Cluster(new PVector(523,342), 3));
this.clusters.add(new Cluster(new PVector(541,380), 4));
this.clusters.add(new Cluster(new PVector(599,226), 6));
this.clusters.add(new Cluster(new PVector(679,215), 7));
this.clusters.add(new Cluster(new PVector(711,285), 7));
this.clusters.add(new Cluster(new PVector(593,320), 7));
this.clusters.add(new Cluster(new PVector(676,340), 7));
this.clusters.add(new Cluster(new PVector(787,241), 8));
this.clusters.add(new Cluster(new PVector(723,232), 6));
this.clusters.add(new Cluster(new PVector(760,291), 5));
this.clusters.add(new Cluster(new PVector(779,351), 4));
this.clusters.add(new Cluster(new PVector(753,390), 3));
this.clusters.add(new Cluster(new PVector(812,416), 2));
this.clusters.add(new Cluster(new PVector(771,464), 2));

}

void keyReleased()
{
	this.clusters.add(new Cluster(new PVector(mouseX, mouseY), int(key)));
	String s = "this.clusters.add(new Cluster(new PVector(" + mouseX + "," + mouseY + "), " + key + "));";
	println(s);
}

void draw()
{
    //background(255, 255, 255, 10);
    //fill(255, 10);
    //rect(0,0,width, height);
    tint(255, 60);
 	image(img,0,0);

    for (Cluster c : clusters)
    {
    	c.update();
    	c.render();
    }
}