class Rectangle extends GraphicObject implements Collidable {
 
    float left, right, top, bottom;
    private float w, h;

    Rectangle() {
        location = new PVector();
        setWH (100, 100);
    }

    Rectangle(float w, float h) {
        location = new PVector();
        
        setWH(w, h);
    }
    
    Rectangle(float x, float y, float w, float h) {
      location = new PVector(x, y);
      setWH(w, h);
    }

    void setXY ( float x, float y) {
        location.x = x;
        location.y = y;

        updateCoord();
    }

    void setWH(float w, float h)  {
        this.w = w;
        this.h = h;

        updateCoord();
    }

    float getW() {return w;}
    float getH() {return h;}

    private void updateCoord() {
        left = location.x;
        right = left + w;
        top = location.y;
        bottom = top + h; 
    }

    boolean Collide(Collidable c) {
        Rectangle r = (Rectangle)c;
        boolean vertical = (top >= r.top && top <= r.bottom) || 
            (bottom >= r.top && bottom <= r.bottom);
        boolean horizontal = (left >= r.left && left <= r.right) || 
            (right >= r.left && right <= r.right);


        return vertical && horizontal;
    }

    void update(float delta) {

        updateCoord();
    }

    void display() {
        pushMatrix();
            translate(location.x, location.y);

            fill(fillColor);
            stroke(strokeColor);
            rect (location.x, location.y, w, h);

        popMatrix();

    }
    
    float getWidth() {
      return w;
    }
    
    float getHeight() {
      return h;
    }
}
