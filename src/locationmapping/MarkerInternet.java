package locationmapping;

import processing.core.PGraphics;
import de.fhpotsdam.unfolding.geo.Location;

public class MarkerInternet extends StandardMarker {

	public MarkerInternet(Location location){
		super(location);
	}
	
	public MarkerInternet(Trackpoint trackpoint) {
	    super(trackpoint.getLocation());
	}
		
	public void draw(PGraphics pg, float x, float y){
		if (!this.isHidden()){
		      pg.pushStyle();
		      pg.noStroke();
		      pg.fill(hsb_h, hsb_s, hsb_b, transparency);  // Farbe sowie sichtbarkeit
		      pg.ellipse(x, y, size, size);  // Form

		      //Zeichnung des Symbols für die obere Ecke
		      pg.textSize(size);
		      pg.stroke(5);
		      pg.fill(0, 0, 0, 100);
		      pg.text("@", x - size * 0.45f, y + size*0.35f);
		      pg.popStyle();
		}
	}
}