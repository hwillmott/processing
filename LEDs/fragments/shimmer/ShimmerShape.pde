import java.util.Random;

class ShimmerShape {
    float noiseSeed;
    int[][] coordinates;

    ShimmerShape(int[][] coordinates) {
        noiseSeed = random(5);
        this.coordinates = coordinates;
    }


    void initialize() {
    }

    void display() {
        float hue = map(noise(noiseSeed), 0, 1, -18, 40);
        float brightness = map(noise(noiseSeed), 0, 1, 15, 50);
        if (brightness < 16) {
            brightness = 0;
        }
        stroke(hue, 80, brightness);
        strokeWeight(10);

        beginShape();
        fill(0);
        for (int i = 0; i < coordinates.length; i++) {
            vertex(coordinates[i][0], coordinates[i][1]);
        }
        endShape(CLOSE);

    }

    void update() {
        noiseSeed += 0.1;
    }

}