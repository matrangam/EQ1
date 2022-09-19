import Foundation

class EarthquakeDataProvider : NSObject {

    func getEarthquakeData(_ success: ((Array<LegacyEarthquake>?) -> Void)!, fail: ((NSError?) -> Void)!) -> Void {
        let endpoint: String = "http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson"
        guard let url = URL(string: endpoint) else {
            fail(NSError())
            return
        }
        let urlRequest = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)

        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            guard error == nil else {
                fail(NSError(domain: error?.localizedDescription ?? "Unknown Error", code: 0, userInfo: nil))
                return
            }

            guard let responseData = data else {
                fail(NSError(domain: "NO_RESPONSE", code: 0, userInfo: nil))
                return
            }
            do {
                guard let result = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: AnyObject] else {
                    fail(NSError(domain: "INVALID_JSON", code: 0, userInfo: nil))
                    return
                }
                guard let features = result["features"] as? NSArray else {
                    fail(NSError(domain: "INVALID_JSON", code: 0, userInfo: nil))
                    return
                }

                success(features.compactMap { LegacyEarthquake.fromDict(feature: $0 as? [String : AnyObject] ?? [:]) })
            } catch  {
                fail(NSError(domain: "INVALID_JSON", code: 0, userInfo: nil))
                return
            }
        }
        
        task.resume()
    }
}
