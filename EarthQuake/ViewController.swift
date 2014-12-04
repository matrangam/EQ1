import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire
            .request(.GET, "http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson")
            .responseJSON {(request, response, JSON, error) in
                println(request)
                println(response)
                println(JSON)
            }
    }
}
