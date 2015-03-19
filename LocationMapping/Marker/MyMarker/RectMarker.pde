

public class RectMarker extends MyMarker{
  
    public RectMarker(Trackpoint trackpoint){
      super(trackpoint);
    }
  
    public void draw(PGraphics pg, float x, float y) {    
  
  //überprüft ob der Marker sichtbar ist, wenn nicht wird er nicht gezeichnet
    if(this.isHidden())
      return;
  
      pg.pushStyle();
      pg.noStroke();  // kein Rand
      pg.fill(red, yellow, blue, 200);  // Farbe sowie sichtbarkeit 
      pg.rect( x - (size/2), y - (size/2), x + (size/2), y + (size/2));  // Form
      pg.popStyle(); 
    
    }
}
  
  
