int currentTime;
int previousTime;
int deltaTime;

TileMap map;
int carreLargeur = 10;
int carreHauteur = 10;

int tileSize = 32;
Rectangle tileRectangle = new Rectangle();

void setup () {
  size (640, 480, P3D);
  currentTime = millis();
  previousTime = millis();
  
  map = new TileMap();
  
  Tile.setTileSetTexture(loadImage("data/part1_tileset.png"));
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
                  Math.min(0, (map.getMapWidth() - carreLargeur) * tileSize))
        ,Camera.getLocation().y);
    }
    
    if (keyCode == RIGHT) {
      Camera.setLocation(
        Math.max(Camera.getLocation().x + 2,
                  Math.min(0, (map.getMapWidth() - carreLargeur) * tileSize))
        ,Camera.getLocation().y);    
    }
    
    if (keyCode == UP) {
      Camera.setLocation(
        Camera.getLocation().x,
        Math.max(Camera.getLocation().y - 2,
                  Math.min(0, (map.getMapWidth() - carreLargeur) * tileSize))
      );
    }
    
    if (keyCode == DOWN) {
      Camera.setLocation(
        Camera.getLocation().x,
        Math.max(Camera.getLocation().y + 2,
                  Math.min(0, (map.getMapWidth() - carreLargeur) * tileSize))
      );    
    }
  }
}

/***
  The rendering should go here
*/
void display () {
  background(0);
  PVector firstSquare = new PVector(Camera.getLocation().x / (float)tileSize,
    Camera.getLocation().y / (float)tileSize);
  
  int firstX = (int) firstSquare.x;
  int firstY = (int) firstSquare.y;
  
  // Le petit offset entre le bord de la caméra et la dimension d'une tuile
  PVector squareOffset = new PVector(Camera.getLocation().x % tileSize,
    Camera.getLocation().y % tileSize);
    
  int offsetX = (int) squareOffset.x;
  int offsetY = (int) squareOffset.y;
  
  for (int y = 0; y < carreHauteur; y++) {
    int positionY = (y * tileSize) - offsetY;
   //<>//
    for (int x = 0; x < carreLargeur; x++) {
      
      // Va chercher le rectangle de la tuile à afficher
      Rectangle srcRect = Tile.getSourceRectangle(map.getRow(y + firstY).getCell(x + firstX).getTileID());
      
      PImage currentTile = Tile.getTileSetTexture().get((int)srcRect.location.x, (int)srcRect.location.y,
          (int)srcRect.w, (int)srcRect.h);
  
      image(currentTile,
          (x * tileSize) - offsetX, positionY
          );
    }
  }

}
