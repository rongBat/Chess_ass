Boolean fileLoaded = false; //<>//
String filename;
Piece[][] newGameArray;







void mousePressed(MouseEvent event) {
  // only take input once board is showing:
  if (!welcomeScreenShowing) {

    int clickX = event.getX();
    int clickY = event.getY();
    println(clickX, clickY);

    if (clickX >= 290 && clickX <= 410 && clickY >=20 && clickY <= 50) { // if click was in load button
      selectInput("Select a file to Load:", "fileSelected");
    } else {



      if (clickX >= 650 && clickY >= 20 && clickY<=50 && clickX <=750) { // if click was in new button
        //reset board to original layout
        gameBoard.resetBoard();
      } else {

        if (clickY >160 && selected == null) { // if first click
          Square clickedSquare = mouseCoordsToSquare(clickX, clickY);

          // if the clicked square isn't empty:
          if (gameBoard.getPiece(clickedSquare) != null) {
            selected = clickedSquare; // store the clicked square for later use
          }
        } else { // if a piece is already selected
          Square clickedSquare = mouseCoordsToSquare(clickX, clickY);



          Square target = new Square(clickedSquare.X, clickedSquare.Y);

          // if valid move
          if (gameBoard.getPiece(selected).isvalidMove(selected, target)) {
            // if the target square is occupied
            if (gameBoard.getPiece(target)!=null) {
              // clear occupied square
              gameBoard.removePiece(target);
            }

            // move selected piece to target square
            //add if piece selected is the same as target, not valid
            gameBoard.movePiece(selected, target);
          }

          selected = null; // always clear selected if move was successful or not
        }
      }
    }
  }
}



void fileSelected(File selection) {
  if (selection !=null) {
    filename=selection.getAbsolutePath();

    gameBoard = loadFile(filename);
    //printArray(newGameArray);
  } else { 
    fileLoaded = false;
  }
} 

Board loadFile(String filename) {
  Board board = new Board(8);

  //load array of lines from file
  String[] lines = loadStrings(filename);
  if (lines==null) {
    board.resetBoard();
    return board;
  }



  for (int i=0; i < lines.length; i++) {
    if (lines[i].isEmpty()) continue;
    // line is [type,x,y,colour]
    String[] lineData = split(lines[i], ',');


    Piece newPiece;
    switch(lineData[0]) {
    case "Bishop":
      newPiece = new Bishop(int(lineData[1]), int(lineData[2]), lineData[3]);
      break;
    case "King":
      newPiece = new King(int(lineData[1]), int(lineData[2]), lineData[3]);
      break;
    case "Queen":
      newPiece = new Queen(int(lineData[1]), int(lineData[2]), lineData[3]);
      break;
    case "Pawn":
      newPiece = new Pawn(int(lineData[1]), int(lineData[2]), lineData[3]);
      break;
    case "Rook":
      newPiece = new Rook(int(lineData[1]), int(lineData[2]), lineData[3]);
      break;
    case "Knight":
      newPiece = new Knight(int(lineData[1]), int(lineData[2]), lineData[3]);
      break;
    default:
      // skip this piece as its invalid
      continue;
    }
    println("'" + newPiece.Colour + "'");
    board.addPiece(newPiece);
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
