int currentTime;
int previousTime;
int deltaTime;

TileMap map;
int carreLargeur = 15;
int carreHauteur = 15;

Rectangle tileRectangle = new Rectangle();

void setup () {
  size (640, 480, P3D);
  currentTime = millis();
  previousTime = millis();
  
  map = new TileMap();
  
  Tile.setTileSetTexture(loadImage("data/part2_tileset.png"));
  Tile.setSourceRectangle(tileRectangle);
  
  println(map.getMapInString());
}

void draw () {
  currentTime = millis();
  deltaTime = currentTime - previousTime;

  update(deltaTime);
  display();
  
  previousTime = currentTime;
  
  
}

/***
  The calculations should go here
*/
void update(int delta) {
  if (keyPressed) {
    if (keyCode == LEFT) {
      Camera.setLocation(
        Math.max(Camera.getLocation().x - 2,
                  Math.min(0, (map.getMapWidth() - carreLargeur) * Tile.tileWidth))
        ,Camera.getLocation().y);
    }
    
    if (keyCode == RIGHT) {
      Camera.setLocation(
        Math.max(Camera.getLocation().x + 2,
                  Math.min(0, (map.getMapWidth() - carreLargeur) * Tile.tileWidth))
        ,Camera.getLocation().y);    
    }
    
    if (keyCode == UP) {
      Camera.setLocation(
        Camera.getLocation().x,
        Math.max(Camera.getLocation().y - 2,
                  Math.min(0, (map.getMapWidth() - carreLargeur) * Tile.tileHeight))
      );
    }
    
    if (keyCode == DOWN) {
      Camera.setLocation(
        Camera.getLocation().x,
        Math.max(Camera.getLocation().y + 2,
                  Math.min(0, (map.getMapWidth() - carreLargeur) * Tile.tileHeight))
      );    
    }
  }
}

/***
  The rendering should go here
*/
void display () {
  background(0);
  PVector firstSquare = new PVector(Camera.getLocation().x / (float)Tile.tileWidth,
    Camera.getLocation().y / (float)Tile.tileHeight);
  
  int firstX = (int) firstSquare.x;
  int firstY = (int) firstSquare.y;
  
  // Le petit offset entre le bord de la caméra et la dimension d'une tuile
  PVector squareOffset = new PVector(Camera.getLocation().x % Tile.tileWidth,
    Camera.getLocation().y % Tile.tileHeight);
    
  int offsetX = (int) squareOffset.x;
  int offsetY = (int) squareOffset.y;
  
  for (int y = 0; y < carreHauteur; y++) {
    int positionY = (y * Tile.tileHeight) - offsetY;
   //<>//
    for (int x = 0; x < carreLargeur; x++) {
      
      for (int tileId : map.getRow(y + firstY).getCell(x + firstX).getBaseTiles()) {
        
        // Va chercher le rectangle de la tuile à afficher
        Rectangle srcRect = Tile.getSourceRectangle(tileId);
        
        
        image (Tile.getTileSetTexture(),
              (x * Tile.tileWidth) - offsetX, positionY,
              (int)srcRect.w, (int)srcRect.h,
              (int)srcRect.location.x, (int)srcRect.location.y,
              (int)srcRect.location.x + (int)srcRect.w, (int)srcRect.location.y + (int)srcRect.h
              );
        
      }
    }
  }

}
