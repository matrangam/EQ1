import Foundation
import Alamofire

class EarthquakeDataProvider : NSObject {
    
    func getEarthquakeData(success: ((Array<Earthquake>!) -> Void)!, fail: ((NSError!) -> Void)!) -> AnyObject {
        
        return Alamofire
            .request(.GET, "http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson")
            .responseJSON {(request, response, result, error) in
                if error == nil {
                    let json = JSON(object: result!)
                    if let features = json["features"].arrayValue {
                        var currentEarthquakes = Array<Earthquake>()
                        for feature in features {
                            currentEarthquakes.append(Earthquake(json: feature))
                        }
                        success(currentEarthquakes)
                    }
                } else {
                    fail(error)
                }
        }
    }
}
