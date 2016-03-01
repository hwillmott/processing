import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.Iterator; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class flow extends PApplet {



FlowField f;
ParticleSystem ps;
PVector gravity;
int timer = 0;

public void setup()
{
	
	f = new FlowField();
	ps = new ParticleSystem(new PVector(width / 2 , height / 2));
	gravity = new PVector(0, 0.3f);
	background(0, 12, 12);
}

public void draw()
{
	noStroke();
	fill(0, 8, 12, 10);
	rect(0, 0, width, height);
	if (timer % 10 == 0)
	{
	  ps.addParticle();
	  timer = 0;
	}
	//f.display();
	ps.applyForce(f);
	ps.applyForce(gravity);
	ps.run();
	f.update();
	timer++;
}
class FlowField
{
 PVector[][] field;
 int cols, rows;
 int resolution;
 float xo, yo;
 float r;
 
 FlowField()
 {
   resolution = 30;
   cols = width / resolution;
   rows = height / resolution;
   field = new PVector[cols][rows];
   xo = yo = 4;
   r = 3;
   initializeNoise(xo, yo);
 }
 
 public void initializeNoise(float xoff, float yoff)
 {
   for (int i = 0; i < rows; i++)
   {
     for (int j = 0; j < cols; j++)
     {
       float theta = map(noise(xoff, yoff + (j * 0.1f)), 0, 1, PI / 2, 5 * PI / 2);
       field[j][i] = new PVector(cos(theta), sin(theta));
     }
     yoff += 0.1f;
     xoff += 0.1f;
   }   
 }
 
 public PVector lookup(PVector lookup)
 {
   int col = PApplet.parseInt(constrain(lookup.x/resolution, 0, cols-1));
   int row = PApplet.parseInt(constrain(lookup.y/resolution, 0, rows-1));
   return field[col][row].get();
 }
 
 public void display()
 {
   for (int i = 0; i < cols; i++)
   {
     line(resolution * i, 0, resolution * i, height);
     for (int j = 0; j < rows; j++)
     {
       line(0, resolution * j, width, resolution * j);
       float theta = field[i][j].heading();
       stroke(0);
       strokeWeight(1);
       pushMatrix();
       translate(resolution * i + resolution / 2, resolution * j + resolution / 2);
       rotate(theta);
       beginShape();
       vertex(0, -r*2);
       vertex(-r, r*2);
       vertex(r, r*2);
       endShape(CLOSE);
       popMatrix();
     }     
   }
 }
 
 public void update()
 {
   xo += 0.01f;
   yo += 0.01f;
   initializeNoise(xo,yo);
 }
}
class Particle
{
 PVector location;
 PVector velocity;
 PVector acceleration;
 float lifespan;
 float mass;
 float maxSpeed;
 int displayTimer;
 
 Particle(PVector l)
 {
   location = l.get();
   velocity = new PVector(0,0);
   acceleration = new PVector(0,0);
   lifespan = 400;
   mass = 10;
   maxSpeed = 1.5f;
   displayTimer = 0;
 }
 
 public void applyForce(PVector force)
 {
   PVector f = force.get();
   PVector fPrime = new PVector(f.x, abs(f.y));
   fPrime.div(mass);
   acceleration.add(fPrime);
 }
 
 public void update()
 {
   velocity.add(acceleration);
   velocity.limit(maxSpeed);
   location.add(velocity);
   acceleration.mult(0);
   lifespan -= 1;
 }
  
  public void display()
  {
    if (displayTimer % 5 == 0)
    {
      strokeWeight(2);
      stroke(0, 80, 120, lifespan);
      ellipse(location.x, location.y, 5, 5);
      displayTimer = 0;
    }
    displayTimer += 1;
  }
  
  public void run()
  {
    display();
    update();
  }
  
  public boolean isDead()
  {
    if (lifespan < 0) return true;
    else return false;
  }
}
class ParticleSystem
{
  int total = 30;
  ArrayList<Particle> particles;
  PVector origin;
  
  ParticleSystem(PVector l)
  {
    particles = new ArrayList<Particle>();
    origin = l.get();
  }
  
  public void addParticle()
  {
    particles.add(new Particle(new PVector(random(0, width), 0)));
  }
  
  public void applyForce(FlowField f)
  {
    for (Particle p : particles)
    {
      PVector fieldForce = f.lookup(p.location);
      fieldForce.normalize();
      p.applyForce(fieldForce);
    }
  }
  
  public void applyForce(PVector f)
  {
    for (Particle p : particles)
    {
      p.applyForce(f);
    }
  }
  
  public void run()
  {
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext())
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
  public void settings() { 	size(1000,500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "flow" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
