OPC opc;
float tileSize = 10;
int numRows = 8;
int numCols = 32;
//int hue1 = 0;
//int hue2 = 60;
int hue1 = 0;
int hue2 = 60;
boolean[][] gameBoard = new boolean[numCols][numRows];
int[][] hues = new int[numCols][numRows];

void setup()
{
	size(320, 80);
	frameRate(20);
	colorMode(HSB, 360, 100, 100);
	frameRate(6);
	noStroke();

	// Connect to the local instance of fcserver
	opc = new OPC(this, "127.0.0.1", 7890);

	opc.simpleLedGrid(32, 8, width/2, 80, 10, 10);
	initializeBoard();
}

void draw()
{
  	background(0);
  	
  	for (int i = 0; i < numCols; i++)
  	{
  		for (int j = 0; j < numRows; j++)
  		{
  			if (gameBoard[i][j])
  			{
				fill(hues[i][j], 70, 30);
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
			gameBoard[i][j] = random(1) <= 0.5;
			hues[i][j] = (random(1) <= 0.5) ? hue1 : hue2;
		}
	}
}

void updateBoard()
{
	boolean[][] newBoard = new boolean[numCols][numRows];
	int[][] newHues = new int[numCols][numRows];
	for (int i = 0; i < numCols; i++)
	{
		for (int j = 0; j < numRows; j++)
		{
			int[] neighbourData = countNeighbours(i, j);
			boolean currentCell = gameBoard[i][j];
			newBoard[i][j] = (currentCell && (neighbourData[0] == 2 || neighbourData[0] == 3)) || (!currentCell && neighbourData[0] == 3);
			newHues[i][j] = neighbourData[1];
		}
	}
	gameBoard = newBoard;
	hues = newHues;
}

int[] countNeighbours(int i, int j)
{
	int sumNeighbours = 0;
	int sumHues = 0;
	int newHue = 0;
	for (int x = -1; x <= 1; x++)
	{
		int m = (i + x + numCols) % numCols;
		for (int y = -1; y <= 1; y++)
		{
			int n = (j + y + numRows) % numRows;
			if (gameBoard[m][n])
			{
				sumNeighbours += 1;
				sumHues += hues[m][n];
			}
		}
	}

	if (sumNeighbours > 0)
	{
		newHue = int(sumHues / sumNeighbours);
	}

	// subtract value of tile in question
	return (new int[]{sumNeighbours - (gameBoard[i][j] ? 1 : 0), newHue});
}

void addRandomCells()
{
	for (int i = 0; i < 5; i++)
	{
		int x = int(random(0, numCols));
		int y = int(random(numRows));
		gameBoard[x][y] = true;
		hues[x][y] = (random(1) <= 0.5) ? hue1 : hue2;
	}
}