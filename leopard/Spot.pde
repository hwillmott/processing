class Spot
{
    PVector origin;
    PVector location;
    PVector initialRadii;
    PVector radii;
    color spotColor;
    float xOff;
    float yOff;
    float rXOff;
    float rYOff;

    Spot(PVector location, color spotColor, PVector radii)
    {
        this.radii = radii.get();
        this.initialRadii = radii.get();
        this.location = location.get();
        this.origin = location.get();
        this.spotColor = spotColor;

        this.initializeOffsets();
    }

    void initializeOffsets()
    {
        this.xOff = random(5);
        this.yOff = random(5);
        this.rXOff = random(5);
        this.rYOff = random(5);
    }

    void wander()
    {
        float x = map(noise(this.xOff), 0, 1, -5, 5);
        float y = map(noise(this.yOff), 0, 1, -5, 5);

        this.location.x = this.origin.x + x;
        this.location.y = this.origin.y + y;
    }

    void wiggle()
    {
        float rx = map(noise(this.rXOff), 0, 1, -5, 5);
        float ry = map(noise(this.rYOff), 0, 1, -5, 5);

        this.radii.x = this.initialRadii.x + rx;
        this.radii.y = this.initialRadii.y + ry;       
    }

    void update()
    {
        this.xOff += 0.1;
        this.yOff += 0.1;
        this.rXOff += 0.05;
        this.rYOff += 0.05;
    }

    void render()
    {
        fill(this.spotColor);
        noStroke();
        ellipse(this.location.x, this.location.y, this.radii.x, this.radii.y);
    }
}