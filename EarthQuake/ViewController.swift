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

