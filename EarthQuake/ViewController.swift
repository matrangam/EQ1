import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet fileprivate weak var _earthquakeButton: UIButton!
    @IBOutlet fileprivate weak var _mapView: MKMapView!

    fileprivate var _locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (CLLocationManager.locationServicesEnabled()) {
            _locationManager = CLLocationManager()
            _locationManager.delegate = self
            _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            _locationManager.requestAlwaysAuthorization()
            _locationManager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        _mapView.setRegion(region, animated: true)
        _locationManager.stopUpdatingLocation()
    }
    
    @IBAction fileprivate func _earthquakeButtonPressed(_ sender: AnyObject) {
        AppDelegate().earthquakeDataProvider().NEW_getEarthquakeData(_buildAnnotations, fail: _handleNetworkError)
    }
    
    fileprivate func _buildAnnotations(_ earthQuakes: Array<Earthquake>!) {
        DispatchQueue.main.async {
            var quakeAnnotations = Array<MKPointAnnotation>()
            for quake in earthQuakes {
                let annotation = MKPointAnnotation()
                annotation.coordinate = quake.location()
                annotation.title = quake.place
                annotation.subtitle = quake.mag
                quakeAnnotations.append(annotation)
                self._mapView.addAnnotation(annotation)
            }
            self._mapView.showAnnotations(quakeAnnotations, animated: true)
        }
    }
    
    fileprivate func _handleNetworkError(_ error: NSError!) {
        print(error)
    }
}
