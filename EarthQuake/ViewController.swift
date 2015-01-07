import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet var _earthquakeButton: UIButton!
    
    @IBAction func _earthquakeButtonPressed(sender: AnyObject) {
        _getEarthquakeData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func _getEarthquakeData() {
        Alamofire
            .request(.GET, "http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson")
            .responseJSON {(request, response, JSON, error) in
                println(request)
                println(response)
                println(JSON)
        }
    }
}
