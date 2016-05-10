import ddf.minim.*;

Minim minim;
AudioInput in;
int numBars = 36;
int bufferStep;
OPC opc;

void setup()
{
  size(360, 60);
  frameRate(20);
  minim = new Minim(this);
  noStroke();
  
  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
  bufferStep = int(in.bufferSize() / this.numBars);

	// Connect to the local instance of fcserver
	opc = new OPC(this, "127.0.0.1", 7890);

	// make a 36 x 6 grid
	opc.simpleLedGrid(36, 6, width/2, height, 10, 10);
}

void draw()
{
  background(0);
  //stroke(255);
  fill(50,0,70);
  
  // draw the waveforms so we can see what we are monitoring
  for(int i = 0; i < this.numBars; i++)
  {
    //line( i, 50 + in.left.get(i)*700, i+1, 50 + in.left.get(i+1)*700 );
    //line( i, 150 + in.right.get(i)*700, i+1, 150 + in.right.get(i+1)*700 );
    float amp = in.left.get(i * bufferStep)*2000;
    rect(i * 10, height - amp, 10, amp);
  }
}

void keyPressed()
{
  if ( key == 'm' || key == 'M' )
  {
    if ( in.isMonitoring() )
    {
      in.disableMonitoring();
    }
    else
    {
      in.enableMonitoring();
    }
  }
}