public static class Tile {
	static PImage tileSetTexture;
	static int tileWidth = 32;
	static int tileHeight = 32;
  static Rectangle tileRect;
  
  public static void setSourceRectangle(Rectangle tileRect) {
    Tile.tileRect = tileRect;
  }
  
	public static int getTileWidth() {
		return tileWidth;
	}

	public static void setTileWidth(int tileWidth) {
		Tile.tileWidth = tileWidth;
	}

	public static int getTileHeight() {
		return tileHeight;
	}

	public static void setTileHeight(int tileHeight) {
		Tile.tileHeight = tileHeight;
	}

	public static Rectangle getSourceRectangle(int tileIndex) {
		int tileY = tileIndex / (tileSetTexture.width / tileWidth);
		int tileX = tileIndex % (tileSetTexture.width / tileWidth);

    tileRect.setWH(tileWidth, tileHeight);
    tileRect.setXY(tileX * tileWidth, tileY * tileHeight);

	  return tileRect;
	}

	public static PImage getTileSetTexture() {
		return tileSetTexture;
	}

	public static void setTileSetTexture(PImage tileSetTexture) {
		Tile.tileSetTexture = tileSetTexture;
	}
}
