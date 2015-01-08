import UIKit
import Alamofire
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var _earthquakeButton: UIButton!
    @IBOutlet weak var _mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var location = CLLocationCoordinate2D(
            latitude: 16.40,
            longitude: -86.34
        )
        
        var span = MKCoordinateSpanMake(0.5, 0.5)
        var region = MKCoordinateRegion(center: location, span: span)
        
        _mapView.setRegion(region, animated: true)
        
        var annotation = MKPointAnnotation()
        annotation.setCoordinate(location)
        annotation.title = "Roatan"
        annotation.subtitle = "Honduras"
        
        _mapView.addAnnotation(annotation)
    }
    @IBAction func _earthquakeButtonPressed(sender: AnyObject) {
        _getEarthquakeData()
    }
    
    func _getEarthquakeData() {
        Alamofire
            .request(.GET, "http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson")
            .responseJSON {(request, response, result, error) in
                let json = JSON(object: result!)
                if let features = json["features"].arrayValue {
                    for feature in features {
                        let earthquake = Earthquake(json: feature)
                        println(earthquake.mag)
                        println("/n")
                    }
                }
        }
    }
}

