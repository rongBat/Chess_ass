Board gameBoard;
ImageLoader images;

// flags for showing Welcome Screen
boolean welcomeScreenShowing = true;
boolean welcomeScreenDrawnOnce = false;

Square selected; // used to hold the selected Piece

PGraphics img_board; // cached checkerboard image

void setup() {
  frameRate(60);
  size(800, 880);

  gameBoard = new Board(8);
  gameBoard.resetBoard();

  selected = null;

  images = new ImageLoader();
  images.loadAll();
}

void draw() {
  background(0); // clear screen

  if (welcomeScreenShowing) {
    drawWelcomeScreen();

  } else {
    // hand off to GUI.pde
    drawGame();
  }

  if (welcomeScreenDrawnOnce && welcomeScreenShowing) {
    delay(2000); // show for 2 seconds
    welcomeScreenShowing = false;
  }

  // need to draw 1 frame otherwise delay will occur beforehand:
  welcomeScreenDrawnOnce = true; 
  //println(frameRate); // for performance debugging
}
