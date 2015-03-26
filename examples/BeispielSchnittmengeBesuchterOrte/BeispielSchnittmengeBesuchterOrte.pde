import locationmapping.*;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.marker.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.providers.*;


StaticMapper mapper = new StaticMapper(this);
  

void setup() {
  hint(ENABLE_RETINA_PIXELS);
  //mapper.setResizable(false); //not possible in eclipse
  mapper.init();
    
  TrackpointList list1;
  list1 = mapper.importData("malte_spitz.csv");
  TrackpointList list2;
  list2 = mapper.importData("max_mittel.json");
    
  Filter schnittmengenFilter = new Filter();
  schnittmengenFilter.setStarttime("08:30");
  schnittmengenFilter.setEndtime("10:30");
  schnittmengenFilter.setStartDate("2009:09:01");
  schnittmengenFilter.setEndDate("2009:09:30");
  schnittmengenFilter.setWeekday("Montag-Mittwoch,Freitag"); 
  TrackpointList vorgefiltert;
  
  
  vorgefiltert = schnittmengenFilter.apply(list1);
  vorgefiltert = schnittmengenFilter.compareLocation(list1, list2, 1);
  
  
    
  for ( Trackpoint tp : vorgefiltert ) {
    StandardMarker schnittpunkt = new StandardMarker(tp);
    mapper.addMarker(schnittpunkt);
  }
    
    
      
}

void draw() {
      
}

