import locationmapping.*;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.geo.*;
import java.sql.Timestamp;

LocationMapper mapper = new LocationMapper(this);

void setup() {
    mapper.init();


    // Import Data
    DataImporter importer = new DataImporter(this);
    TrackpointList trackpointlist = importer.load("malte_spitz.csv");
    Filter mostcommon = new Filter();
    mostcommon.setMinFrequency(4000);
    TrackpointList filteredtpl = mostcommon.apply(trackpointlist);
    
    
    for ( Trackpoint trackpoint : filteredtpl ){
        StandardMarker marker = new StandardMarker(trackpoint);
        
        marker.setColor(10);  // funktioniert nicht, nur grau
        marker.setStyle("Labeled");
        marker.setLabel("Wohnort");
        marker.setSize(10);
        mapper.map.addMarker(marker);
    }
}

void draw() {
    mapper.update();
}
