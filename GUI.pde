void drawWelcomeScreen() {
  // Intro
  textAlign(CENTER, CENTER);
  textSize(50);
  text("Welcome To", width / 2, height / 2 - 100);

  // Title shadow
  textSize(210);
  fill(100);
  text("CHESS", width / 2, height / 2);

  // Title
  textSize(200);
  fill(255);
  text("CHESS", width / 2, height / 2);

  // Sub-heading
  textSize(25);
  text("Benny Martin - 12SDD 2020 - Mr Lemmon", width / 2, height - 30);
}
void drawGame() {
  background(200);
  drawMenu();

  pushMatrix(); // push default transform onto stack
  translate(0, 80); // moves the origin down to leave room for title/menu

  drawBoardLabels();

  translate(80, 80); // translate and scale to leave room for rank/file labels
  scale(0.9, 0.9);

  if (img_board == null) drawBoard(); // cache board image to improve performance

  image(img_board, 0, 0); // draw cached image of board
  drawPieces(); // draw pieces on board

  popMatrix(); // pop back to default transform
}

void drawMenu() {

  // draw shadow first
  fill(100);
  textSize(75);
  text("CHESS", 125, 30);

  fill(255);
  textSize(70);
  text("CHESS", 125, 30);

  fill (255);
  textSize(22);
  text("Benny Martin - 12SDD 2020 - Mr Lemmon", width / 2, 80);

  // draw menu buttons
  fill(100);
  textSize(35);
  text("[ Load ]", 350, 30);
  text("[ Save ]", 525, 30);
  text("[ New ]", 700, 30);
}

void drawBoardLabels() { // draw rank/files labels
  fill(100);
  textSize(40);
  for (int c = 0; c < 8; c++) { // draw letters
    text(char(c + 65), (120 + c * 90), 35);
  }
  for (int c = 0; c < 8; c++) { // draw numbers
    text(c + 1, 40, (120 + c * 90));
  }
}

void drawBoard() { // generate checkerboard image
  img_board = createGraphics(800, 800);
  img_board.beginDraw();

  for (int row = 0; row < 8; row++) {
    for (int col = 0; col < 8; col++) {
      img_board.fill(255 - (col + row) % 2 * 100); // use modulus operand to alternate black/white
      img_board.rect((0 + col * 100), (0 + row * 100), 100, 100); // draw square
    }
  }

  img_board.endDraw();
}

void drawPieces() {
  imageMode(CENTER);
  for (int X = 0; X < gameBoard.size; X++) { // for each square on the board
    for (int Y = 0; Y < gameBoard.size; Y++) {

      if (gameBoard.Pieces[X][Y] != null) { // if array element not empty
        int pieceSize;

        if (selected != null) { //if a square is selected
          // if the current square is the selected one, draw the piece a bit larger:
          pieceSize = (selected.X == X && selected.Y == Y) ? 90 : 75;
        } else {
          pieceSize = 75;
        }

        image( // draw piece image
          gameBoard.Pieces[X][Y].getImage(), // get image from Piece
          100 * X + 50, 100 * Y + 50, // +50 to draw in centre of square
          pieceSize, pieceSize  // use pieceSize calculated above
          );
      }
    }
  }
  imageMode(CORNER);
}
