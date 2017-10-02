import java.util.Arrays;

OPC opc;
float tileSize = 10;
int numRows = 8;
int numCols = 32;
int[] brightnesses = new int[]{0, 50, 25};
int[] hues = new int[]{0, 80, 60};

// 0 = dead, 1 = on, 2 = dying
int[][] gameBoard = new int[numCols][numRows];
int[][] oldBoard = new int[numCols][numRows];

void setup()
{
	size(320, 80);
	colorMode(HSB, 360, 100, 100);
	frameRate(2);
	noStroke();

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
	initializeBoard();
}

void draw()
{
    background(0);
    
    for (int i = 0; i < numCols; i++)
    {
      for (int j = 0; j < numRows; j++)
      {
        if (gameBoard[i][j] > 0)
        {
          fill(hues[gameBoard[i][j]], 50, brightnesses[gameBoard[i][j]]);
          float posX = tileSize * i;
          float posY = tileSize * j;
          rect(posX, posY, tileSize, tileSize);
        }
      }
    }
    addRandomCells();
    updateBoard();
}

void initializeBoard()
{
  for (int i = 0; i < numCols; i++)
  {
    for (int j = 0; j < numRows; j++)
    {
      gameBoard[i][j] = random(1) <= 0.4 ? 1 : 0;
    }
  }
}

void updateBoard()
{
  int[][] newBoard = new int[numCols][numRows];
  for (int i = 0; i < numCols; i++)
  {
    for (int j = 0; j < numRows; j++)
    {
      int currentCell = gameBoard[i][j];
      if (currentCell == 0) 
      {
        int neighbours = countNeighbours(i, j);
        newBoard[i][j] = (neighbours == 2) ? 1 : 0;
      }
      else if (currentCell == 1)
      {
        newBoard[i][j] = 2;
      }
      else
      {
        newBoard[i][j] = 0;
      }
    }
  }

  oldBoard = gameBoard;
  gameBoard = newBoard;
}

int countNeighbours(int i, int j)
{
  int sumNeighbours = 0;
  for (int x = -1; x <= 1; x++)
  {
    int m = (i + x + numCols) % numCols;
    for (int y = -1; y <= 1; y++)
    {
      int n = (j + y + numRows) % numRows;
      if (gameBoard[m][n] == 1)
      {
        sumNeighbours += 1;
      }
    }
  }

  // subtract value of tile in question
  return sumNeighbours - (gameBoard[i][j] == 1 ? 1 : 0);
}

void addRandomCells()
{
  for (int i = 0; i < 2; i++)
  {
    int x = (int(random(numCols))) % numCols;
    int y = (int(random(numRows))) % numRows;
    gameBoard[x][y] = 1;
  }
}