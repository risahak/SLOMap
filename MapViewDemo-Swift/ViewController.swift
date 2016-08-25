//
//  ViewController.swift
//  MapViewDemo-Swift
//

import UIKit
import ArcGIS

class ViewController: UIViewController , AGSMapViewLayerDelegate{

    @IBOutlet weak var mapView: AGSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set the delegate for the map view
        self.mapView.layerDelegate = self
        
        //create an instance of a tiled map service layer
        let tiledLayer = AGSTiledMapServiceLayer(URL: NSURL(string: "http://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer"))
        
        //Add it to the map view
        self.mapView.addMapLayer(tiledLayer, withName: "Tiled Layer")

    }

    //MARK: AGSMapViewLayerDelegate methods
    
    func mapViewDidLoad(mapView: AGSMapView!){
        
        self.mapView.locationDisplay.autoPanMode = .Default
        self.mapView.locationDisplay.startDataSource()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back to Map"
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }

}

