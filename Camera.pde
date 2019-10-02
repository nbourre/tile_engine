public static class Camera {
	static PVector location = new PVector();

	// Position en "pixel"
	public static PVector getLocation() {
		return location;
	}
	
	public static void setLocation(float x, float y) {
		location.x = x;
		location.y = y;
	}
}
