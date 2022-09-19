import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet fileprivate weak var earthquakeButton: UIButton!
    @IBOutlet fileprivate weak var mapView: MKMapView!

    fileprivate var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        mapView.setRegion(region, animated: true)
        locationManager.stopUpdatingLocation()
    }
    
    @IBAction fileprivate func earthquakeButtonPressed(_ sender: AnyObject) async {
//        AppDelegate().earthquakeDataProvider().getEarthquakeData(buildAnnotations, fail: handleNetworkError)
    }
    
    fileprivate func buildAnnotations(_ earthQuakes: Array<LegacyEarthquake>!) {
            var quakeAnnotations = Array<MKPointAnnotation>()
            for quake in earthQuakes {
                let annotation = MKPointAnnotation()
                annotation.coordinate = quake.location()
                annotation.title = quake.place
                annotation.subtitle = "Magnitude: \(quake.mag!)"
                quakeAnnotations.append(annotation)
                self.mapView.addAnnotation(annotation)
            }
        DispatchQueue.main.async {
            self.mapView.showAnnotations(quakeAnnotations, animated: true)
        }
    }
    
    fileprivate func handleNetworkError(_ error: NSError!) {
        print(error ?? "")
    }
}
