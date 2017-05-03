XML xml;
String[] names;
float[] sizes;
float[] angles;
float sum = 0;
color[] colors = new color[7];
float diameter = 300;
int largestSlice = 0;
float toAdd = 0;
PFont f;

void setup()
{
  size(500, 500);
  f = createFont("Arial", 16, true);
  colorMode(HSB,360,100,100,100);
  noStroke();
  xml = loadXML("data/languagedata.xml");
  
  XML[] children = xml.getChildren("language");
  names = new String[children.length];
  sizes = new float[children.length];
  for (int i = 0; i < children.length; i++)
  { //<>//
    names[i] = children[i].getString("name");
    sizes[i] = children[i].getInt("strength");
    sum += sizes[i];
  }
  
  angles = new float[children.length];
  float angle = 0;
  for (int i = 0; i < children.length; i++)
  {
    angle += sizes[i] / sum * TWO_PI;
    angles[i] = angle;
  }
  initColors();
}

void draw()
{
  background(300);
  float angle = 0;
    
  if (dist(mouseX, mouseY, width / 2, height / 2) < diameter / 2)
  {
    float a = atan2(mouseY - height / 2, mouseX - width / 2);
    a = (a + TWO_PI) % TWO_PI;
    int indx = 0;
    for (int i = 0; i < angles.length; i++)
    {
      if (a < angles[i]) break;
      indx++;
    }
    largestSlice = indx;
  }
  
  for (int i = 0; i < sizes.length; i++)
  {       //<>//
    fill(colors[i % (colors.length)]);
    if (largestSlice == i)
    {
      arc(width/2, height/2, diameter + 20, diameter + 20, angle, angles[i]);
      fill(0);
      textFont(f, 16);
      text(names[i], width - 100, 100);
    }
    else
    {
      arc(width/2, height/2, diameter, diameter, angle, angles[i]);
    }
    angle = angles[i];
  }
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