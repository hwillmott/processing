import java.util.Arrays;

OPC opc;
float tileSize = 10;
int numRows = 8;
int numCols = 32;
int hue1 = -20;
int hue2 = 60;
boolean[][] gameBoard = new boolean[numCols][numRows];
boolean[][] oldBoard = new boolean[numCols][numRows];
int[][] hues = new int[numCols][numRows];
int cellChangesThisGen = 0;
boolean oscillating = false;
int addCellsX = -1;
int addCellsY = -1;
int generations = 0;

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
        if (gameBoard[i][j])
        {
          fill((hues[i][j] % 360), 70, 50);
          //fill((hues[i][j] % 360), 300, 200);
          float posX = tileSize * i;
          float posY = tileSize * j;
          rect(posX, posY, tileSize, tileSize);
        }
      }
    }
    addRandomCells();
    updateBoard();
    generations += 1;
    if (generations == 100){
      generations = 0;
      initializeBoard();
    }
}

void initializeBoard()
{
  for (int i = 0; i < numCols; i++)
  {
    for (int j = 0; j < numRows; j++)
    {
      gameBoard[i][j] = random(1) <= 0.5;
      hues[i][j] = (i > (numCols / 2)) ? hue1 : hue2;
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
      if (newBoard[i][j] != gameBoard[i][j])
      {
        cellChangesThisGen += 1;
      }
    }
  }
  if (Arrays.deepEquals(newBoard, oldBoard)) {
    println("oscillating ");;
    oscillating = true;
  }

  oldBoard = gameBoard;
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

void mousePressed()
{
  if (mouseButton == LEFT) {
  addCellsX = int(float(mouseX/(width/numCols)));
  addCellsY = int(float(mouseY/(height/numRows)));
  }
  else {
    generations = 0;
    initializeBoard();
  }
}

void addRandomCells()
{
  if ((cellChangesThisGen < 10) || (addCellsX > 0 && addCellsY > 0) || oscillating)
  {
    if(cellChangesThisGen < 10 || oscillating)
    {
      addCellsX = int(random(width));
      addCellsY = int(random(height));
    }

    int h = (random(1) <= 0.5) ? hue1 : hue2;
    for (int i = 0; i < 10; i++)
    {
      int x = (int(random(addCellsX-3, addCellsX+3)) + numCols) % numCols;
      int y = (int(random(addCellsY-3, addCellsY+3)) + numRows) % numRows;
      gameBoard[x][y] = true;
      hues[x][y] = h;
    }
  }
  addCellsX = -1;
  addCellsY = -1;
  cellChangesThisGen = 0;
  oscillating = false;
}