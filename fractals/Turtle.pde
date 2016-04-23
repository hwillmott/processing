class Turtle
{
	String sentence;
	float len;
	float angle;

	Turtle(String sentence, float startLength, float startAngle)
	{
		this.sentence = sentence;
		this.len = startLength;
		this.angle = startAngle;
	}

	void render()
	{
		stroke(1);
		for (int i = 0; i < sentence.length(); i++) 
		{
			char c = sentence.charAt(i);
			switch(c)
			{
				case 'F':
					line(0,0,this.len,0);
					translate(this.len,0);
					println("Line");
					break;
				case 'R': // right turn
					line(0,0,this.len,0);
					translate(this.len,0);
					rotate(this.angle);
					line(0,0,this.len,0);
					translate(this.len,0);
					println("Line");
					break;
				case 'L': // left turn
					line(0,0,this.len,0);
					translate(this.len,0);
					rotate(-this.angle);
					line(0,0,this.len,0);
					translate(this.len,0);
					println("Line");
					break;
				case 'G':
					translate(this.len,0);
					println("jump");
					break;
				case '+':
					rotate(this.angle);
					println("rotate right");
					break;
				case '-':
					rotate(-this.angle);
					println("rotate left");
					break;
				case '[':
					pushMatrix();
					println("pushmatrix");
					break;
				case ']':
					popMatrix();
					println("popmatrix");
					break;
				default:
					println("default things happening");
					break;
			}
		}
	}

	void setToDo(String sentence)
	{
		this.sentence = sentence;
	}

	void changeLen(float length)
	{
		this.len *= length;
	}
}