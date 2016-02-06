XML xml;
String[] companies;
String[] positions;
String[] durations;
String[] descriptions;
float[] months;
int[] colorsxml;
int sum = 0;
color[] colors = new color[7];
int focusIndx;
float focusPadding = 5;
float startHeight = 50;
float rectangleHeight = 20;

void setup()
{
  size(1000, 500);
  colorMode(HSB,360,100,100,100);
  noStroke();
  readXML();
  initColors();
}

void readXML()
{
  xml = loadXML("data/workexperience.xml");
  
  XML[] children = xml.getChildren("job");
  companies = new String[children.length];
  positions = new String[children.length];
  durations = new String[children.length];
  months = new float[children.length];
  descriptions = new String[children.length];
  colorsxml = new int[children.length];
  for (int i = 0; i < children.length; i++)
  {
    companies[i] = children[i].getString("company");
    positions[i] = children[i].getString("position");
    durations[i] = children[i].getString("duration");
    months[i] = children[i].getInt("months");
    colorsxml[i] = children[i].getInt("color");
    descriptions[i] = children[i].getContent();
    sum += months[i];
  }
  focusIndx = 0;
}

void draw()
{
  background(300);
  float x = 0;  
  for (int i = 0; i < companies.length; i++)
  {
    float rectangleWidth = months[i] / sum * width;
    if (mouseY >= startHeight && mouseY <= (startHeight + rectangleHeight) && mouseX > x && mouseX < x + rectangleWidth)
    {
      focusIndx = i;
    }
    drawRectangle(i, x, rectangleWidth);
    drawLabel(i, x);
    x += rectangleWidth;
  }
}

void drawRectangle(int i, float x, float rectangleWidth)
{  
  fill(colors[colorsxml[i]]);
  if (i == focusIndx)
  {
    rect(x, startHeight + focusPadding, rectangleWidth, rectangleHeight); 
    drawContent(i);
    //drawCurve(i, x, rectangleWidth);
    //drawCurlyBrace(x, rectangleWidth);
  }
  else rect(x, startHeight, rectangleWidth, rectangleHeight); 
}

void drawCurve(int i, float x, float rectangleWidth)
{
    noFill();
    stroke(30);
    float x1 = x + rectangleWidth / 2;
    float x2 = 60;
    float y1 = startHeight + rectangleHeight + focusPadding;
    float y2 = startHeight + rectangleHeight + focusPadding + 40;
    bezier(x1, y1, x1, y2, x2, y1, x2, y2);
    noStroke();
}

void drawCurlyBrace(float x, float rectangleWidth)
{
  stroke(30);
  noFill();
  float x1 = 30;
  float x2 = 90;
  float x3 = 150;
  float y1 = startHeight + rectangleHeight + focusPadding + 45;
  float y2 = startHeight + rectangleHeight + focusPadding + 35;
  bezier(x1,y1,x1,y2,x2,y1,x2,y2);
  bezier(x2,y2,x2,y1,x3,y2,x3,y1);
  noStroke();
}

void drawContent(int i)
{
  fill(0);
  textSize(14);
  text(positions[i], 20, 120);
  text(durations[i], 20, 140);
  textSize(11);
  text(descriptions[i], 20, 160);
}

void drawLabel(int i, float x)
{
  fill(0);
  textSize(11);
  if (i == focusIndx)
  {
    text(companies[i], x + 2, 50);
  }
  else text(companies[i], x + 2, 45);
}

void initColors()
{
  colors[0] = color(#db6161);
  colors[1] = color(#db9061);
  colors[2] = color(#dbc361);
  colors[3] = color(#90db61);
  colors[4] = color(#61dbd5);
  colors[5] = color(#616ddb);
  colors[6] = color(#db61d9);
}