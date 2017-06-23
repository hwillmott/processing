import java.util.Arrays;

OPC opc;
float tileSize = 10;
int numRows = 8;
int numCols = 32;
int tailSize = 1;
int hue = 60;
float brightnessStep = 50 / tailSize;
int[][] snake;
boolean[][] snakePresence = new boolean[numCols][numRows];


void setup()
{
	size(320, 80);
	colorMode(HSB, 360, 100, 100);
	frameRate(10);
	noStroke();
  connectToOPC();
	spawnSnake();
}

void connectToOPC()
{
  // Connect to the local instance of fcserver
  opc = new OPC(this, "127.0.0.1", 7890);

  opc.ledStrip(0, 32, width/2, 5, 10, 0, true);
  opc.ledStrip(64, 32, width/2, 15 , 10, 0, true);
  opc.ledStrip(128, 32, width/2, 25, 10, 0, true);
  opc.ledStrip(192, 32, width/2, 35, 10, 0, true);
  opc.ledStrip(256, 32, width/2, 45, 10, 0, true);
  opc.ledStrip(320, 32, width/2, 55, 10, 0, true);
  opc.ledStrip(384, 32, width/2, 65, 10, 0, true);
  opc.ledStrip(448, 32, width/2, 75, 10, 0, true); 
}

void spawnSnake()
{
  snake = new int[256][2];
  snake[0][0] = int(random(numCols));
  snake[0][1] = int(random(numRows));
  snakePresence = new boolean[numCols][numRows];
  snakePresence[snake[0][0]][snake[0][1]] = true;
  tailSize = 1;
  printSnake();
}

boolean canMove(int[] coordinates)
{
  boolean canMove = false;
  for (int i = -1; i <= 1; i += 2)
  {
    int x = coordinates[0] + i;
    int y = coordinates[1];
    if (x >= 0 && x < numCols && y >= 0 && y < numRows && !snakePresence[x][y])
    {
      canMove = true;
    }
  }
  for (int j = -1; j <= 1; j += 2)
  {
    int x = coordinates[0];
    int y = coordinates[1] + j;
    if (x >= 0 && x < numCols && y >= 0 && y < numRows && !snakePresence[x][y])
    {
      canMove = true;
    }
  }
  return canMove;
}

void moveSnake(int[] coordinates)
{
  snakePresence[coordinates[0]][coordinates[1]] = true;

  for (int i = tailSize; i > 0; i--)
  {
    snake[i] = snake[i-1];
  }
  snake[0] = coordinates;
  tailSize += 1;
}

void draw()
{
  background(0);
  float brightnessStep = 50 / tailSize;
  for (int i = 0; i < tailSize; i++)
  {
      if (snake[i] != null)
      {
        fill((5*i)%360, 50, 40);
        float posX = tileSize * snake[i][0];
        float posY = tileSize * snake[i][1];
        rect(posX, posY, tileSize, tileSize);
      }
  }
  update();    
}

void update()
{
  if (canMove(snake[0]))
  {
    while(true)
    {
      int coord  = (random(1) < 0.5) ? 0 : 1;
      int change = (random(1) < 0.5) ? -1: 1;

      int[] newCoords = new int[]{snake[0][0], snake[0][1]};
      newCoords[coord] += change;

      if (newCoords[0] >= 0 && newCoords[0] < numCols && newCoords[1] >= 0 && newCoords[1] < numRows && !snakePresence[newCoords[0]][newCoords[1]])
      {
        moveSnake(new int[]{newCoords[0], newCoords[1]});
        return;
      }
    }

  }
  else
  {
    spawnSnake();
  }
}

void printSnake()
{
  String s = "";
  for (int i = 0; i < tailSize; i++)
  {
    s += "(" + snake[i][0] + "," + snake[i][1] + ") ";
  }
  println(s);
}
