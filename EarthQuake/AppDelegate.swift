import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func earthquakeDataProvider() -> EarthquakeDataProvider! {
        return EarthquakeDataProvider()
    }
}

