public class MapCell {
  int tileID = 0;
  public ArrayList<Integer> baseTiles = new ArrayList<Integer>();

  public int getTileID() {
    return baseTiles.size() > 0 ? baseTiles.get(0) : 0;
  }

  public void setTileID(int tileID) {
    if (baseTiles.size() > 0) {
      baseTiles.add(0, tileID);
    } else {
      addBaseTile(tileID);
    }
  }
  
  public void addBaseTile(int tileID) {
    baseTiles.add(tileID);
  }
  
  public ArrayList<Integer> getBaseTiles() {
    return baseTiles;
  }
  
  public MapCell(int tileID) {
    super();
    this.tileID = tileID;
  }
}
