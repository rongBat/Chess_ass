Boolean fileLoaded = false;
String filename;
Piece[] newGameArray;







void mousePressed(MouseEvent event) {
  // only take input once board is showing:
  if (!welcomeScreenShowing) {

    int clickX = event.getX();
    int clickY = event.getY();
    println(clickX, clickY);

    if (clickX >= 290 && clickX <= 410 && clickY >=20 && clickY <= 50) { // if click was in load button
      selectInput("Select a file to Load:", "fileSelected");
    }



    //TODO: detect which menu button was pressed
    else {

      if (clickY >160 && selected == null) { // if first click
        Square clickedSquare = mouseCoordsToSquare(clickX, clickY);

        // if the clicked square isn't empty:
        if (gameBoard.getPiece(clickedSquare) != null) {
          selected = clickedSquare; // store the clicked square for later use
        }
      } else { // if a piece is already selected
        Square clickedSquare = mouseCoordsToSquare(clickX, clickY);

        // if target square is empty:
        if (gameBoard.getPiece(clickedSquare) == null) { 
          Square target = new Square(clickedSquare.X, clickedSquare.Y);

          // if valid move
          if (gameBoard.getPiece(selected).isvalidMove(selected, target)) {
            // move selected piece to target square
            //add if piece selected is the same as target, not valid
            gameBoard.movePiece(selected, target);
          }
        } // else just clear selection ( as target square was taken):

        selected = null; // always clear selected if move was successful or not
      }
    }
  }
}



void fileSelected(File selection) {
  if (selection !=null) {
    filename=selection.getAbsolutePath();
    println(filename);
    newGameArray = readArray(filename);
    //printArray(newGameArray);
  } else { 
    fileLoaded = false;
  }
} 

Piece[] readArray(String filename) {
  Piece[] newGameArray = new Piece[0];
  String array[] = loadStrings(filename);
  printArray(array);
  println(array.length);
  for (int i =0; i < array.length; i=i+3) {
    String[] coords=split(array[i+1],',');
    newGameArray =(Piece[]) append(newGameArray, new Piece(array[i], new Square(int(coords[0]), int(coords[1])), array[i+2] ));
  }
  printArray(newGameArray);
  fileLoaded = true;
  return newGameArray;
} 





Board loadFile(Piece[] newGameArray, Boolean fileLoaded) { // STUB: to be replaced with file loading
  Board board = new Board();
  if (!fileLoaded) {

    // setup default chess board
    board.addPiece(new Rook(0, 0, "black"));
    board.addPiece(new Knight(1, 0, "black"));
    board.addPiece(new Bishop(2, 0, "black"));
    board.addPiece(new King(3, 0, "black"));
    board.addPiece(new Queen(4, 0, "black"));
    board.addPiece(new Bishop(5, 0, "black"));
    board.addPiece(new Knight(6, 0, "black"));
    board.addPiece(new Rook(7, 0, "black"));
    for (int i=0; i<8; i++) board.addPiece(new Pawn(i, 1, "black")) ;

    board.addPiece(new Rook(0, 7, "white"));
    board.addPiece(new Knight(1, 7, "white"));
    board.addPiece(new Bishop(2, 7, "white"));
    board.addPiece(new Queen(3, 7, "white"));
    board.addPiece(new King(4, 7, "white"));
    board.addPiece(new Bishop(5, 7, "white"));
    board.addPiece(new Knight(6, 7, "white"));
    board.addPiece(new Rook(7, 7, "white"));
    for (int i=0; i<8; i++) board.addPiece(new Pawn(i, 6, "white"));
  } else { for(int i=0; i < newGameArray.length;i++){
    board.addPiece( newGameArray[i](newGameArray[i].Position.X, newGameArray[i].Position.Y,"newGameArray[i].colour"));
    
    
  }
  }
  return board;
}

Square mouseCoordsToSquare(int mousex, int mousey) {
  int squareSize = 90; //100 scaled down to 0.9
  int X, Y;

  float f_X = (mousex - 80) / squareSize;
  float f_Y = (mousey - 160) / squareSize;

  // round floats down and constrain between 0-7
  X = constrain(floor(f_X), 0, 7); 
  Y = constrain(floor(f_Y), 0, 7);

  return new Square(X, Y);
}
