import Foundation
import MapKit

struct Earthquake: Identifiable {
    var id: String
    let mag: Double
    let place: String
    let updated: TimeInterval
    let title: String
    let type: String
    let time: TimeInterval
    let coordinates: [Double]

    func formattedDate() -> String! {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: "UTC")
        formatter.dateFormat = "yyyy-MM-dd 'at' HH:mm 'UTC'"
        let quakeTime = Date(timeIntervalSince1970: (self.time as Double / 1000))
        return formatter.string(from: quakeTime)
    }

    func location() -> CLLocationCoordinate2D {
        let lat = self.coordinates[1] as CLLocationDegrees
        let lon = self.coordinates[0] as CLLocationDegrees
        return CLLocationCoordinate2DMake(lat, lon)
    }
}
