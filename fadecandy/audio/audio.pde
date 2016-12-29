import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput in;
int numBars = 8;
float hueCount = 1;
int bufferStep;
float[] heights = new float[numBars];
float magnitude = 30000; 
//FFT fft;
OPC opc;

void setup()
{
	size(85, 640);
	frameRate(10);
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

	//opc.simpleLedGrid(32, 8, width/2, 80, 10, 10);
 	opc.ledGrid(0, 64, 8, width/2, height /2, 10, 10, PI/2, false);
}

void draw()
{
	//draw the waveforms so we can see what we are monitoring
	//visualizeDropping();
	visualizeNormal();

	//update color
	hueCount = (hueCount + 0.1) % 360;
}

void visualizeNormal()
{
  	background(0);	
	for(int i = 0; i < this.numBars; i++)
	{
		float amp = in.left.get(i * bufferStep)*magnitude;
		amp += in.right.get(i * bufferStep)*magnitude;
		fill(hueCount, 70, 30);
		rect(i * 10, (height/2) - (amp/2), 10, amp);
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