Boolean fileLoaded = false;
String filename;
Piece[][] newGameArray;







void mousePressed(MouseEvent event) {
  // only take input once board is showing:
  if (welcomeScreenShowing) return;

  int clickX = event.getX();
  int clickY = event.getY();
  println(clickX, clickY);

  // if click was in load button
  if (clickX >= 290 && clickX <= 410 && clickY >=20 && clickY <= 50) {
    selectInput("Select a file to Load:", "fileSelected");
    // if click was in save button
  } else if (clickX >= 470 && clickX <= 580 && clickY >=20 && clickY <= 50) {
    selectInput("Select where to save the file:", "saveSelected");
    // if click was in new button
  } else if (clickX >= 650 && clickY >= 20 && clickY<=50 && clickX <=750) {
    //reset board to original layout
    gameBoard.resetBoard();
  } else if (clickY >160) {
    if (selected == null) { // if first click
      Square clickedSquare = mouseCoordsToSquare(clickX, clickY);

      // if the clicked square isn't empty:
      if (gameBoard.getPiece(clickedSquare) != null) {
        selected = clickedSquare; // store the clicked square for later use
      }
    } else { // if a piece is already selected        
      Square target = mouseCoordsToSquare(clickX, clickY);

      if (target.X == selected.X && target.Y == selected.Y) {
        //cancel move if click same square again
        selected = null;
      } else {
        // if valid move
        if (gameBoard.getPiece(selected).isvalidMove(target, selected)) {
          // if the target square is occupied
          if (gameBoard.getPiece(target) != null) {
            // clear occupied square if pieces are different colours
            if (gameBoard.getPiece(selected).Colour.equals(gameBoard.getPiece(target).Colour) == false) {
              println(gameBoard.getPiece(selected).Colour + "," + gameBoard.getPiece(target).Colour);
              gameBoard.removePiece(target); //<>//
            }
          }
          // move selected piece to target square
          gameBoard.movePiece(selected, target);
        }
        selected = null; // always clear selected if move was successful or not
      }
    }
  }
}




void fileSelected(File selection) {
  if (selection !=null) {
    filename=selection.getAbsolutePath();

    gameBoard = loadFile(filename);
  } else { 
    fileLoaded = false;
  }
} 

void saveSelected(File selection) {
  if (selection !=null) {
    String savename = selection.getAbsolutePath();

    String[] lines = new String[0];

    for (int X = 0; X < gameBoard.size; X++) {
      for (int Y = 0; Y < gameBoard.size; Y++) { 
        Piece curPiece = gameBoard.getPiece(new Square(X, Y));

        // if square is empty dont save
        if (curPiece == null) continue;
        
        String line = curPiece.Type + "," +
          curPiece.Position.X + "," +
          curPiece.Position.Y + "," +
          curPiece.Colour ;

        lines = append(lines, line);
      }
    }
    
    println(lines[0]);

    saveStrings(savename, lines);
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

  //println(mousex + "," + mousey + "," + X + "," + Y + "," + f_X + "," + f_Y + ",(" + X + "," + Y + ")");
  return new Square(X, Y);
}
