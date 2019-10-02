public static class Tile {
	//static final int TILESIZE = 32;
	static PImage tileSetTexture;
	static int tileWidth = 32;
	static int tileHeight = 32;
  static Rectangle tileRectangle;
  
  public void setRectangle (Rectangle r) {
    tileRectangle = r;
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

	public static Rectangle getSourceRectangle(int tileIndex, Rectangle r) {
		int tileY = tileIndex / (tileSetTexture.width / tileWidth);
		int tileX = tileIndex % (tileSetTexture.width / tileWidth);

    r.setWH(tileWidth, tileHeight);
    r.setXY(tileX * tileWidth, tileY * tileHeight);

	  return r;
	}

	public static PImage getTileSetTexture() {
		return tileSetTexture;
	}

	public static void setTileSetTexture(PImage tileSetTexture) {
		Tile.tileSetTexture = tileSetTexture;
	}}
