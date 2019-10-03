public class TileMap {
	ArrayList<MapRow> rows = new ArrayList<MapRow>();
	int mapWidth = 50;
	int mapHeight = 50;
	
	public TileMap() {
		
		for (int y = 0; y < mapHeight; y++) {
			
			MapRow currentRow = new MapRow();
			
			for (int x = 0; x < mapWidth; x++) {
				currentRow.columns.add(new MapCell(0));
			}
			
			rows.add(currentRow);
			
		}
		
		generateTest();
	}

	public MapRow getRow(int rowIndex) {
		return rows.get(rowIndex);
	}

  public String getMapInString() {
    String result = "";
    
    for (int y = 0; y < mapHeight; y++) {
      
      MapRow currentRow = rows.get(y);
      
      for (int x = 0; x < mapWidth; x++) {
        result += nf(currentRow.getCell(x).getTileID(), 2, 0) + " ";
      }
      
      result += "\r\n";
      
    }    
    
    return result;
  }
	
	private void generateTest() {
		// Début de la création

		//rows.get(0).columns.get(0).addBaseTile(5);
    
    for (MapRow row : rows) {
      for (MapCell cell : row.columns) {
        cell.addBaseTile(0);
      }
    }

		rows.get(0).columns.get(3).addBaseTile(2); //<>//
		rows.get(0).columns.get(4).addBaseTile(2);
		rows.get(0).columns.get(5).addBaseTile(2);
		rows.get(0).columns.get(6).addBaseTile(2);
		rows.get(0).columns.get(7).addBaseTile(2);

		rows.get(1).columns.get(3).addBaseTile(1);
		rows.get(1).columns.get(4).addBaseTile(1);
		rows.get(1).columns.get(5).addBaseTile(1);
		rows.get(1).columns.get(6).addBaseTile(1);
		rows.get(1).columns.get(7).addBaseTile(1);

		rows.get(2).columns.get(2).addBaseTile(3);
		rows.get(2).columns.get(3).addBaseTile(3);
		rows.get(2).columns.get(4).addBaseTile(3);
		rows.get(2).columns.get(5).addBaseTile(3);
		rows.get(2).columns.get(6).addBaseTile(3);
		
		rows.get(2).columns.get(7).addBaseTile(1);
		rows.get(3).columns.get(2).addBaseTile(3);
		rows.get(3).columns.get(3).addBaseTile(1);
		rows.get(3).columns.get(4).addBaseTile(1);
		rows.get(3).columns.get(5).addBaseTile(2);
		
		rows.get(3).columns.get(6).addBaseTile(2);
		rows.get(3).columns.get(7).addBaseTile(2);
		rows.get(4).columns.get(2).addBaseTile(3);
		rows.get(4).columns.get(3).addBaseTile(1);
		rows.get(4).columns.get(4).addBaseTile(1);

		rows.get(4).columns.get(5).addBaseTile(2);
		rows.get(4).columns.get(6).addBaseTile(2);
		rows.get(4).columns.get(7).addBaseTile(2);
		rows.get(5).columns.get(2).addBaseTile(3);
		rows.get(5).columns.get(3).addBaseTile(1);
		
		rows.get(5).columns.get(4).addBaseTile(1);
		rows.get(5).columns.get(5).addBaseTile(2);
		rows.get(5).columns.get(6).addBaseTile(2);
		rows.get(5).columns.get(7).addBaseTile(2);

		// Fin de la création pour itération 1

		rows.get(3).columns.get(5).addBaseTile(30);
		rows.get(4).columns.get(5).addBaseTile(27);
		rows.get(5).columns.get(5).addBaseTile(28);

		rows.get(3).columns.get(6).addBaseTile(25);
		rows.get(5).columns.get(6).addBaseTile(24);

		rows.get(3).columns.get(7).addBaseTile(31);
		rows.get(4).columns.get(7).addBaseTile(26);
		rows.get(5).columns.get(7).addBaseTile(29);

		rows.get(4).columns.get(6).addBaseTile(104);

		// Fin de la création pour itération 2

	}

	public int getMapWidth() {
		return mapWidth;
	}

	public void setMapWidth(int mapWidth) {
		this.mapWidth = mapWidth;
	}

	public int getMapHeight() {
		return mapHeight;
	}

	public void setMapHeight(int mapHeight) {
		this.mapHeight = mapHeight;
	}
	
	
	
}
