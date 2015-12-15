import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet private weak var _earthquakeButton: UIButton!
    @IBOutlet private weak var _mapView: MKMapView!

    private var _locationManager: CLLocationManager!
    
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

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        _mapView.setRegion(region, animated: true)
        _locationManager.stopUpdatingLocation()
    }
    
    @IBAction private func _earthquakeButtonPressed(sender: AnyObject) {
        AppDelegate().earthquakeDataProvider().getEarthquakeData(_buildAnnotations, fail: _handleNetworkError)
    }
    
    private func _buildAnnotations(earthQuakes: Array<Earthquake>!) {
        var quakeAnnotations = Array<MKPointAnnotation>()
        for quake in earthQuakes {
            let annotation = MKPointAnnotation()
            var subtitle = "Mag: \(quake.mag) Time: \(quake.formattedDate())"
            annotation.coordinate = quake.location()
            annotation.title = quake.place
            annotation.subtitle = subtitle
            quakeAnnotations.append(annotation)
            _mapView.addAnnotation(annotation)
        }
        _mapView.showAnnotations(quakeAnnotations, animated: true)
    }
    
    private func _handleNetworkError(error: NSError!) {
        print(error)
    }
}
