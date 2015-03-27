import locationmapping.*;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.marker.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.providers.*;


DynamicMapper mapper = new DynamicMapper(this);

/**
* In dem Beispiel werden zwei Datensätze nach Aufenthalt von 10 bis 16 Uhr und Monatg bis Freitag gefiltert,
* um den höchstwahrscheinlichen Arbeitsplatz zu bestimmen.
*
*/

void setup(){
 
  //mapper.setResizable(false); //not possible in eclipse
  mapper.init();
    
  TrackpointList maltetpl;
  TrackpointList maxtpl;
  //Import
  maltetpl = mapper.importData("malte_spitz.csv");
  maxtpl = mapper.importData("max_mittel.json");
  
  //setzen des Arbeitsfilters
  DateTimeFilter arbeitsfilter = new DateTimeFilter();
  arbeitsfilter.setStartTime("10:00");
  arbeitsfilter.setEndTime("16:00");
  arbeitsfilter.setWeekDays("montag-freitag");
  
  LocationFilter frequencyfilter = new LocationFilter();
  frequencyfilter.setMinFrequency(200);
  
  //Anwenden des Arbeitsfilters
  maltetpl = arbeitsfilter.apply(maltetpl);
  maxtpl = arbeitsfilter.apply(maxtpl);
  
  for(Trackpoint tp: maltetpl){
      MarkerRectangle marker = new MarkerRectangle(tp);
      marker.setSize(10);
      marker.setColor("rot");
      mapper.addMarker(marker);
  }
  
  for ( Trackpoint tp : maxtpl) {
      StandardMarker marker = new StandardMarker(tp);
      marker.setSize(10);
      marker.setColor("gelb");
      mapper.addMarker(marker);
  } 
  
}

void draw(){
  
}
