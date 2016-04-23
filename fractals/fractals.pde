import java.util.*;
LSystem lsys;
Turtle turtle;
float changeLengthFactor;
PVector startingPoint;
int maxIterations;
int currentIteration;
Hashtable rules;
 
void setup() 
{
    size(1000,1000);

    stroke(1);
    noFill();

    this.rules = new Hashtable();
    this.currentIteration = 1;
    this.SetupQuadraticKoch1();
    print(this.lsys.getSentence());
}

 
void SetupQuadraticKoch1()
{
    this.changeLengthFactor = 0.5;
    this.startingPoint = new PVector(width/3, height * 2 / 3);
    this.maxIterations = 5;
    this.currentIteration = 1;

    this.rules.put('F',"F-F+F+FF-F-F+F");

    this.lsys = new LSystem("F-F-F-F", this.rules);

    this.turtle = new Turtle(this.lsys.getSentence(),30,PI / 2);
}

 
void SetupQuadraticKoch2()
{
    this.changeLengthFactor = 0.5;
    this.startingPoint = new PVector(width/3, height * 2 / 3);
    this.maxIterations = 6;
    this.currentIteration = 1;
    
    this.rules.put('F',"F-F+F-F-F");

    this.lsys = new LSystem("F-F-F-F", this.rules);

    this.turtle = new Turtle(this.lsys.getSentence(),200,PI / 2);
} 

void SetupQuadraticKoch3()
{
    this.changeLengthFactor = 0.5;
    this.startingPoint = new PVector(width/3, height * 2 / 3);
    this.maxIterations = 4;
    this.currentIteration = 1;
    
    this.rules.put('F',"F+FF-FF-F-F+F+FF-F-F+F+FF+FF-F");

    this.lsys = new LSystem("F-F-F-F", this.rules);

    this.turtle = new Turtle(this.lsys.getSentence(),20,PI / 2);
}

void SetupQuadraticKoch4()
{
    this.changeLengthFactor = 0.5;
    this.startingPoint = new PVector(width * 2 / 3, height * 2 / 3);
    this.maxIterations = 5;
    this.currentIteration = 1;
    
    this.rules.put('F',"FF-F-F-F-F-F+F");

    this.lsys = new LSystem("F-F-F-F", this.rules);

    this.turtle = new Turtle(this.lsys.getSentence(),50,PI / 2);
}

void SetupQuadraticKoch5()
{
    this.changeLengthFactor = 1;
    this.startingPoint = new PVector(width * 2 / 3, height / 4);
    this.maxIterations = 13;
    this.currentIteration = 1;
    
    this.rules.put('L',"L+R+");
    this.rules.put('R',"-L-R");

    this.lsys = new LSystem("L", this.rules);

    this.turtle = new Turtle(this.lsys.getSentence(),8,PI / 2);
}


void SetupQuadraticKoch6()
{
    this.changeLengthFactor = 1;
    this.startingPoint = new PVector(width / 10, height / 10);
    this.maxIterations = 7;
    this.currentIteration = 1;
    
    this.rules.put('L',"R+L+R");
    this.rules.put('R',"L-R-L");

    this.lsys = new LSystem("R", this.rules);

    this.turtle = new Turtle(this.lsys.getSentence(),8,PI / 3);
}

void SetupQuadraticKoch7()
{
    this.changeLengthFactor = 1;
    this.startingPoint = new PVector(400, 400);
    this.maxIterations = 6;
    this.currentIteration = 1;
    
    this.rules.put('L',"L+R++R-L--LL-R+");
    this.rules.put('R',"-L+RR++R+L--L-R");

    this.lsys = new LSystem("L", this.rules);

    this.turtle = new Turtle(this.lsys.getSentence(),8,PI / 3);
}

void draw() 
{
    background(255);

    fill(0);
    text("Press numbers 1 through 7 to switch between fractals.\nClick to draw the next generation of the current fractal.", 0, 15);

    translate(this.startingPoint.x, this.startingPoint.y);
    turtle.render();
    noLoop();
}

void keyReleased()
{
    switch(key)
    {
        case '1':
            this.rules = new Hashtable();
            this.SetupQuadraticKoch1();
            break;
        case '2':
            this.rules = new Hashtable();
            this.SetupQuadraticKoch2();
            break;
        case '3':
            this.rules = new Hashtable();
            this.SetupQuadraticKoch3();
            break;
        case '4':
            this.rules = new Hashtable();
            this.SetupQuadraticKoch4();
            break;
        case '5':
            this.rules = new Hashtable();
            this.SetupQuadraticKoch5();
            break;
        case '6':
            this.rules = new Hashtable();
            this.SetupQuadraticKoch6();
            break;
        case '7':
            this.rules = new Hashtable();
            this.SetupQuadraticKoch7();
            break;
        default:
            break;
    }
    redraw();
}
 
void mousePressed() 
{
    this.currentIteration += 1;
    if (this.currentIteration <= this.maxIterations)
    {
        lsys.generate();
        turtle.setToDo(lsys.getSentence());

        turtle.changeLen(this.changeLengthFactor);
        redraw();   
    }
}