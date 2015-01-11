import UIKit
import Alamofire
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet private weak var _earthquakeButton: UIButton!
    @IBOutlet private weak var _mapView: MKMapView!

    private var _locationManager: CLLocationManager!
    private var _currentLocationCoordinate: CLLocationCoordinate2D!
    private var _currentQuakes: Array<Earthquake>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self._currentQuakes = []
        if (CLLocationManager.locationServicesEnabled()) {
            _locationManager = CLLocationManager()
            _locationManager.delegate = self
            _locationManager.desiredAccuracy = kCLLocationAccuracyBest
            _locationManager.requestAlwaysAuthorization()
            _locationManager.startUpdatingLocation()
        }
    }

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        let location = locations.last as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        if _currentLocationCoordinate == nil {
            _currentLocationCoordinate = CLLocationCoordinate2DMake(0, 0)
        }
        if location.coordinate.latitude != _currentLocationCoordinate.latitude {
            _currentLocationCoordinate = location.coordinate
            _mapView.setRegion(region, animated: true)
        }
    }
    
    @IBAction private func _earthquakeButtonPressed(sender: AnyObject) {
        _getEarthquakeData()
    }
    
    private func _getEarthquakeData() {
        Alamofire
            .request(.GET, "http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson")
            .responseJSON {(request, response, result, error) in
                let json = JSON(object: result!)
                if let features = json["features"].arrayValue {
                    for feature in features {
                        self._currentQuakes.append(Earthquake(json: feature))
                    }
                    
                    var quakeAnnotations = Array<MKPointAnnotation>()
                    for quake in self._currentQuakes {
                        let annotation = MKPointAnnotation()
                        annotation.setCoordinate(quake.location())
                        annotation.title = quake.place
                        annotation.subtitle = quake.mag
                        self._mapView.addAnnotation(annotation)
                        quakeAnnotations.append(annotation)
                        println(quake.place, quake.mag)
                    }
                    self._mapView.showAnnotations(quakeAnnotations, animated: true)
                }
        }
    }
}