import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput in;
int numBars = 36;
float hueCount = 1;
int bufferStep;
float[] heights = new float[36];
//FFT fft;
OPC opc;

void setup()
{
	size(320, 80);
	frameRate(20);
	colorMode(HSB, 360, 100, 100);
	minim = new Minim(this);
	noStroke();

	// use the getLineIn method of the Minim object to get an AudioInput
	in = minim.getLineIn();


	//fft = new FFT(in.bufferSize(), in.sampleRate());
	bufferStep = int(in.bufferSize() / this.numBars);
	// println(in.bufferSize());
	// println(fft.specSize());
	//println(bufferStep);

	// Connect to the local instance of fcserver
	opc = new OPC(this, "127.0.0.1", 7890);

	opc.simpleLedGrid(32, 8, width/2, 80, 10, 10);
}

void draw()
{
	//draw the waveforms so we can see what we are monitoring
	visualizeDropping();

	//update color
	hueCount = (hueCount + 0.1) % 360;
}

void visualizeNormal()
{
  	background(0);	
	for(int i = 0; i < this.numBars; i++)
	{
		float amp = in.left.get(i * bufferStep)*1500;
		amp += in.right.get(i * bufferStep)*1500;
		fill(hueCount, 70, 30);
		rect(i * 10, height - amp, 10, amp);
		heights[i] = max(heights[i] - 5, -10);
	} 
}

void visualizeDropping()
{
  	background(0);	
	for(int i = 0; i < this.numBars; i++)
	{
		float amp = in.left.get(i * bufferStep)*1000;
		amp += in.right.get(i * bufferStep)*1000;
		if (amp > heights[i])
		{
			heights[i] = amp;
		}
		fill(38, 70, 30);
		rect(i * 10, height - heights[i], 10, 10);
		heights[i] = max(heights[i] - 5, -10);
	} 
}