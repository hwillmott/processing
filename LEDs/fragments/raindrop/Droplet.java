import java.util.Random;

class Droplet {
  int x;
  int y;
  int diameter;
  int maxDiameter;
  int growthRate;
  int minX;
  int rangeX;
  int minY;
  int rangeY;
  int minD;
  int rangeD;

  Droplet(int minX, int rangeX, int minY, int rangeY, int minD, int rangeD, int growthRate) {
  	this.minX = minX;
  	this.rangeX = rangeX;
  	this.minY = minY;
  	this.rangeY = rangeY;
  	this.minD = minD;
  	this.rangeD = rangeD;
    this.growthRate = growthRate;

    this.initialize(); 
  }

  void initialize() {
  	Random rand = new Random();
    this.x = rand.nextInt(rangeX) + minX;
    this.y = rand.nextInt(rangeY) + minY;
    this.diameter = 0;
    this.maxDiameter = rand.nextInt(rangeD) + minD;
  }

  void update() {
  	int newDiameter = this.diameter + this.growthRate;
  	if (newDiameter >= this.maxDiameter) {
  		this.initialize();
  	} else {
  		this.diameter = newDiameter;
  	}
  }
}